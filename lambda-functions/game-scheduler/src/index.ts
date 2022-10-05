import { SNSEvent } from 'aws-lambda';

import { AwsUtil } from '../../../packages/aws/aws-util';
import { GameWatcherSNSEvent } from '../../../packages/models/interfaces';
import { NhlApi } from '../../../packages/nhl-api/nhl-api';
import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';
import { BaseFunction } from '../../lambda-base';

export class GameScheduler extends BaseFunction {
  public async handler(): Promise<any> {
    const responses = await NhlApi.getTodaysSchedule();
    if (responses.totalGames > 0) {
      // find all games that haven't started or are finished
      const allGames = responses.dates[0]?.games.map((g) => g);
      const db = new GameDb();
      const activeGamesDb = await db.getAllTodaysGamesByExternalIds(
        responses.dates[0]?.games.map((game) => game.gamePk)
      );

      const activeOrPastGames: GameWatcherSNSEvent[] = [];

      allGames.forEach((game) => {
        const gameDate = new Date(game.gameDate);
        const curTime = new Date();

        if (gameDate < curTime) {
          const found = activeGamesDb.find(
            (g) => g.gameIdentifier === game.gamePk
          );

          const event: GameWatcherSNSEvent = {
            gameUrl: game.link,
          };
          if (found) {
            if (found.isFinal) {
              return false; // if final score recorded skip
            }
            event.gameId = found.id;
          }
          activeOrPastGames.push(event);
        }
      });

      // send over to sns message for each game
      activeOrPastGames.forEach((gameEvent) => {
        return AwsUtil.sendWatcherSns(gameEvent);
      });
    }
  }
  public async cleanupFunction(): Promise<any> {
    await DB.close();
  }
}

export const instance = new GameScheduler();
/* istanbul ignore next */
export const handler = async (event: SNSEvent): Promise<any> => {
  await instance.handler().catch((err) => {
    //todo: add to some logging service for error handling
    console.error('there was an error');
  });
  await instance.cleanupFunction();
};
