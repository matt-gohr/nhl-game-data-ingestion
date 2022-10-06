import { SNSEvent } from 'aws-lambda';

import {
    Play, PlayerResponse, TeamResponse
} from '../../../packages/models/api-responses/scheduled';
import { Game } from '../../../packages/models/game';
import { GameWatcherSNSEvent } from '../../../packages/models/interfaces';
import { Player } from '../../../packages/models/player';
import { Team } from '../../../packages/models/team';
import { NhlApi } from '../../../packages/nhl-api/nhl-api';
import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';
import { PlayerDb } from '../../../packages/postgres-db/player-db';
import { TeamDb } from '../../../packages/postgres-db/team-db';
import { BaseFunction } from '../../lambda-base';

export class GameWatcher extends BaseFunction {
  public async handler(event: SNSEvent): Promise<any> {
    const data: GameWatcherSNSEvent = JSON.parse(event.Records[0]?.Sns.Message);
    const gameData = await NhlApi.getGameData(data.gameUrl);

    if (gameData) {
      let players = this.mapPlayers(Object.values(gameData.gameData.players));
      let teams = this.mapTeams([
        gameData.gameData.teams.away,
        gameData.gameData.teams.home,
      ]);
      let existingGamesInDb: Game[];

      const playerDb = new PlayerDb();
      const teamDb = new TeamDb();
      const gameDb = new GameDb();
      await DB.getPool();

      if (data.gameId === undefined) {
        teams = await Promise.all(
          teams.map((t) => teamDb.insertOrUpdateTeam(t))
        );
        players = await Promise.all(
          players.map((p) => playerDb.insertOrUpdatePlayer(p))
        );
      } else {
        teams = await teamDb.getAllByExternalId(
          teams.map((t) => t.team_identifier)
        );

        players = await playerDb.getAllByExternalId(
          players.map((p) => p.playerIdentifier)
        );

        existingGamesInDb = await gameDb.getAllByExternalId(gameData.gamePk);
      }
      const playerMap = new Map<number, Player>();
      const teamMap = new Map<number, number>();
      teams.forEach((t) => {
        teamMap.set(t.team_identifier, t.id);
      });

      players.forEach((p) => {
        const teamId = teamMap.get(p.teamIdentifier);
        p.teamId = teamId;
        playerMap.set(p.playerIdentifier, p);
      });

      const gameStats = this.getPlayerStats(
        gameData.liveData.plays.allPlays,
        gameData.gameData.status.detailedState === 'Final',
        gameData.gameData.datetime.dateTime,
        gameData.gamePk,
        playerMap,
        existingGamesInDb
      );
      const newGames: Game[] = [];
      await Promise.all(
        gameStats.map((g) => {
          if (g.id === undefined) {
            return newGames.push(g);
          } else {
            return gameDb.updateGame(g);
          }
        })
      );
      await gameDb.insertGames(newGames);
    } else {
      // error logger service
      console.log('there was an error getting dame data');
    }
  }
  private getPlayerStats(
    plays: Play[],
    isFinal: boolean,
    startDate: string,
    gameIdentifier: number,
    playerMap: Map<number, Player>,
    gameScores: Game[] = []
  ): Game[] {
    plays.forEach((play) => {
      if (play.result?.event === 'Goal') {
        play.players?.forEach((player) => {
          if (player.playerType === 'Scorer') {
            const curPlayer = playerMap.get(player.player.id);
            this.addOrPush(
              gameScores,
              new Game({
                game_identifier: gameIdentifier,
                is_final: isFinal,
                start_date: startDate,
                player_id: curPlayer?.id,
                goals: 1,
                team_id: curPlayer.teamId ? curPlayer.teamId : play.team.id,
              })
            );
          }
          if (player.playerType === 'Assist') {
            const curPlayer = playerMap.get(player.player?.id);
            this.addOrPush(
              gameScores,
              new Game({
                game_identifier: gameIdentifier,
                is_final: isFinal,
                start_date: startDate,
                player_id: curPlayer?.id,
                assists: 1,
                team_id: curPlayer.teamId ? curPlayer.teamId : play.team.id,
              })
            );
          }
        });
      } else if (play.result?.event === 'Hit') {
        play.players?.forEach((player) => {
          const curPlayer = playerMap.get(player.player.id);
          if (player.playerType === 'Hitter') {
            this.addOrPush(
              gameScores,
              new Game({
                game_identifier: gameIdentifier,
                is_final: isFinal,
                start_date: startDate,
                player_id: curPlayer.id,
                hits: 1,
                team_id: curPlayer.teamId ? curPlayer.teamId : play.team.id,
              })
            );
          }
        });
      } else if (play.result?.event === 'Penalty') {
        play.players?.forEach((player) => {
          if (player.playerType === 'DrewBy') {
            const curPlayer = playerMap.get(player.player.id);
            this.addOrPush(
              gameScores,
              new Game({
                game_identifier: gameIdentifier,
                is_final: isFinal,
                start_date: startDate,
                player_id: curPlayer.id,
                penalty_minutes: play.result.penaltyMinutes,
                team_id: curPlayer.teamId ? curPlayer.teamId : play.team.id,
              })
            );
          }
        });
      }
    });

    return gameScores;
  }
  private addOrPush(gameRecords: Game[], addGame: Game): void {
    for (let i = 0; i < gameRecords.length; i++) {
      if (gameRecords[i].playerId === addGame.playerId) {
        gameRecords[i].hits += addGame.hits ? addGame.hits : 0;
        gameRecords[i].penaltyMinutes += addGame.penaltyMinutes
          ? addGame.penaltyMinutes
          : 0;
        gameRecords[i].goals += addGame.goals ? addGame.goals : 0;
        gameRecords[i].assists += addGame.assists ? addGame.assists : 0;
        return;
      }
    }
    gameRecords.push(addGame);
  }
  private mapPlayers(playersApi: PlayerResponse[]): Player[] {
    const players = playersApi.map((p) => {
      return new Player({
        name: p.fullName,
        position: p.primaryPosition.name,
        player_identifier: p.id,
        age: p.currentAge,
        number: p.primaryNumber,
        team_identifier: p.currentTeam?.id,
      });
    });
    return players;
  }
  private mapTeams(teams: TeamResponse[]): Team[] {
    return teams.map((t) => {
      return new Team({
        name: t.name,
        team_identifier: t.id,
      });
    });
  }
  public async cleanupFunction(): Promise<any> {
    await DB.close();
  }
}

export const instance = new GameWatcher();
/* istanbul ignore next */
export const handler = async (event: SNSEvent): Promise<any> => {
  await instance
    .handler(event)
    .catch((err) =>
      console.log('something went wrong with the functions', err)
    );
  await instance.cleanupFunction();
};
