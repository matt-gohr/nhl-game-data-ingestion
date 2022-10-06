import { AwsUtil } from '../../../packages/aws/aws-util';
import { ScheduledResponse } from '../../../packages/models/api-responses/scheduled';
import { NhlApi } from '../../../packages/nhl-api/nhl-api';
import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';
import { handler } from '../src';

jest.mock('../../../packages/postgres-db/db');
jest.mock('../../../packages/postgres-db/player-db');
jest.mock('../../../packages/postgres-db/game-db');
jest.mock('../../../packages/postgres-db/team-db');
jest.mock('../../../packages/nhl-api/nhl-api');
describe('game scheduler', () => {
  // let handler: GameScheduler;

  let closeMock: jest.Mock;
  let getTodaysSchedule: jest.Mock;
  let getAllTodaysGamesByExternalIds: jest.Mock;
  let sendWatcherSns: jest.Mock;
  let gameData: ScheduledResponse;
  beforeEach(() => {
    const pastDate = new Date();
    pastDate.setDate(pastDate.getDate() - 1);
    gameData = {
      totalGames: Math.random(),
      dates: [
        {
          games: [
            {
              gamePk: Math.random(),
              gameDate: pastDate.toString(),
            },
            {
              gamePk: Math.random(),
              gameDate: pastDate.toString(),
            },
            {
              gamePk: Math.random(),
              gameDate: pastDate.toString(),
            },
            {
              gamePk: Math.random(),
              gameDate: pastDate.toString(),
            },
          ],
        },
      ],
    };

    closeMock = jest.fn();
    sendWatcherSns = jest.fn();

    getTodaysSchedule = jest.fn().mockResolvedValue(gameData);
    getAllTodaysGamesByExternalIds = jest.fn().mockResolvedValue([]);
    AwsUtil.sendWatcherSns = sendWatcherSns;

    DB.close = closeMock;
    NhlApi.getTodaysSchedule = getTodaysSchedule;
    (GameDb as jest.Mock).mockImplementation(() => {
      return {
        getAllTodaysGamesByExternalIds: getAllTodaysGamesByExternalIds,
      };
    });
    // handler = new GameScheduler();
  });
  it('should call appropriate functions', async () => {
    await handler();
    expect(getTodaysSchedule).toHaveBeenCalled();
    expect(getAllTodaysGamesByExternalIds).toHaveBeenCalledWith(
      gameData.dates[0].games.map((g) => g.gamePk)
    );
    expect(sendWatcherSns).toHaveBeenCalledTimes(4);
  });
  it('should filter out final score games', async () => {
    const pastDate = new Date();
    pastDate.setDate(pastDate.getDate() - 1);
    const idInDb = 2;
    getAllTodaysGamesByExternalIds.mockResolvedValue([
      {
        gameIdentifier: idInDb,
        isFinal: true,
      },
    ]);
    gameData.dates[0].games = [
      {
        gamePk: idInDb,
        gameDate: pastDate.toString(),
      },
      {
        gamePk: Math.random(),
        gameDate: pastDate.toString(),
      },
    ];
    await handler();
    expect(getTodaysSchedule).toHaveBeenCalled();
    expect(getAllTodaysGamesByExternalIds).toHaveBeenCalledWith(
      gameData.dates[0].games.map((g) => g.gamePk)
    );
    expect(sendWatcherSns).toHaveBeenCalledTimes(1);
    expect(closeMock).toHaveBeenCalled();
  });
  it('should send sns with game id in db ', async () => {
    const pastDate = new Date();
    pastDate.setDate(pastDate.getDate() - 1);
    const idIdentifierDb = 2;
    const idInDb = 1;
    getAllTodaysGamesByExternalIds.mockResolvedValue([
      {
        gameIdentifier: idIdentifierDb,
        isFinal: false,
        id: idInDb,
      },
    ]);
    gameData.dates[0].games = [
      {
        gamePk: idIdentifierDb,
        gameDate: pastDate.toString(),
        link: Math.random().toString(),
      },
    ];
    await handler();
    expect(getTodaysSchedule).toHaveBeenCalled();
    expect(getAllTodaysGamesByExternalIds).toHaveBeenCalledWith(
      gameData.dates[0].games.map((g) => g.gamePk)
    );
    expect(sendWatcherSns).toHaveBeenCalledWith({
      gameId: idInDb,
      gameUrl: gameData.dates[0].games[0].link,
    });
  });
  it('should not send sns for future games', async () => {
    const futureDate = new Date();
    futureDate.setDate(futureDate.getDate() + 1);
    gameData.dates[0].games = [
      {
        gamePk: Math.random(),
        gameDate: futureDate.toString(),
      },
      {
        gamePk: Math.random(),
        gameDate: futureDate.toString(),
      },
    ];
    await handler();
    expect(sendWatcherSns).not.toHaveBeenCalled();
  });
  it('should close connection even if failed', async () => {
    getAllTodaysGamesByExternalIds.mockRejectedValue(true);
    await handler();
    expect(closeMock).toHaveBeenCalled();
  });
});
