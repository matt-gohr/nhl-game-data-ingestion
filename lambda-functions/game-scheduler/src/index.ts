import { ScheduledEvent, SNSEvent } from 'aws-lambda';

import { NhlApi } from '../../../packages/nhl-api/nhl-api';
import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';
import { BaseFunction } from '../../lambda-base';

export class GameScheduler extends BaseFunction {
  public async handler(event: SNSEvent | ScheduledEvent): Promise<any> {
    console.log(event);

    const api = new NhlApi();
    const responses = await api.getNextDaysSchedule();
    if (responses.totalGames > 0) {
      // find all games that haven't started or are finished
      const activeOrPastGames = responses.dates[0]?.games.map((g) => {
        const gameDate = new Date(g.gameDate);
      });
      const db = new GameDb();
      const activeGamesDb = await db.getAllTodaysGamesByExternalIds(
        responses.dates[0]?.games.map((game) => game.gamePk)
      );

      // compar database to see if they are not finalized
      // send over to sns message for each game
    }
  }
  public async cleanupFunction(): Promise<any> {
    await DB.close();
  }
}

export const instance = new GameScheduler();
/* istanbul ignore next */
export const handler = async (event: SNSEvent): Promise<any> => {
  await instance.handler(event);
  await instance.cleanupFunction();
};
