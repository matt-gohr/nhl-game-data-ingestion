import { SNSEvent } from 'aws-lambda';

import { GameResponse } from '../../../packages/models/api-responses/scheduled';
import { IPlayer } from '../../../packages/models/player';
import { ITeam } from '../../../packages/models/team';
import { NhlApi } from '../../../packages/nhl-api/nhl-api';
import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';
import { PlayerDb } from '../../../packages/postgres-db/player-db';
import { TeamDb } from '../../../packages/postgres-db/team-db';
import { GameWatcher, handler } from '../src';

jest.mock('../../../packages/postgres-db/db');
jest.mock('../../../packages/postgres-db/player-db');
jest.mock('../../../packages/postgres-db/game-db');
jest.mock('../../../packages/postgres-db/team-db');
jest.mock('../../../packages/nhl-api/nhl-api');
describe('game watcher', () => {
  let event: SNSEvent;

  let insertOrUpdatePlayerMock: jest.Mock;
  let insertOrUpdateTeamMock: jest.Mock;
  let closeMock: jest.Mock;
  let getGameDataMock: jest.Mock;
  let getPoolMock: jest.Mock;
  let getAllByExternalId: jest.Mock;
  let getAllPlayerByExternalId: jest.Mock;
  let getAllGameByExternalId: jest.Mock;
  let insertGame: jest.Mock;
  let updateGame: jest.Mock;
  let gameData: GameResponse;
  beforeEach(() => {
    event = {
      Records: [
        {
          Sns: {
            Message: '{"gameUrl":"/api/v1/game/2022010069/feed/live"}',
          },
        },
      ],
    } as unknown as SNSEvent;

    gameData = {
      copyright:
        'NHL and the NHL Shield are registered trademarks of the National Hockey League. NHL and NHL team marks are the property of the NHL and its teams. © NHL 2022. All Rights Reserved.',
      gamePk: 123,
      link: '/api/v1/game/2022010065/feed/live',
      metaData: {
        wait: 10,
        timeStamp: '20221004_161434',
      },
      gameData: {
        players: {
          ID8474709: {
            id: 1,
            fullName: 'Matt Martin',
            currentAge: 22,
            primaryNumber: '33',
            currentTeam: {
              id: 1,
              name: 'New York Islanders',
              link: '/api/v1/teams/2',
              triCode: 'NYI',
            },
            primaryPosition: {
              code: 'L',
              name: 'Left Wing',
              type: 'Forward',
              abbreviation: 'LW',
            },
          } as GameResponse['gameData']['players']['index'],
          ID8482691: {
            id: 2,
            fullName: 'Aatu Raty',
            currentAge: 22,
            primaryNumber: '33',
            currentTeam: {
              id: 2,
              name: 'New York Islanders',
              link: '/api/v1/teams/2',
              triCode: 'NYI',
            },
            primaryPosition: {
              code: 'C',
              name: 'Center',
              type: 'Forward',
              abbreviation: 'C',
            },
          } as GameResponse['gameData']['players']['index'],
        },
        game: {
          pk: 123,
          season: '20222023',
          type: 'PR',
        },
        datetime: {
          dateTime: '2022-10-02T23:00:00Z',
        },
        status: {
          abstractGameState: 'Final',
          codedGameState: '6',
          detailedState: 'Final',
          statusCode: '6',
          startTimeTBD: false,
        },
        teams: {
          away: {
            id: 1,
            name: 'Philadelphia Flyers',
            link: '/api/v1/teams/4',
            venue: {
              //@ts-ignore
              id: 5096,
              name: 'Wells Fargo Center',
              link: '/api/v1/venues/5096',
              city: 'Philadelphia',
              timeZone: {
                id: 'America/New_York',
                offset: -4,
                tz: 'EDT',
              },
            },
            abbreviation: 'PHI',
            triCode: 'PHI',
            teamName: 'Flyers',
            locationName: 'Philadelphia',
            firstYearOfPlay: '1967',
            division: {
              id: 18,
              name: 'Metropolitan',
              nameShort: 'Metro',
              link: '/api/v1/divisions/18',
              abbreviation: 'M',
            },
            conference: {
              id: 6,
              name: 'Eastern',
              link: '/api/v1/conferences/6',
            },
            franchise: {
              franchiseId: 16,
              teamName: 'Flyers',
              link: '/api/v1/franchises/16',
            },
            shortName: 'Philadelphia',
            officialSiteUrl: 'http://www.philadelphiaflyers.com/',
            franchiseId: 16,
            active: true,
          },
          home: {
            id: 2,
            name: 'New York Islanders',
            link: '/api/v1/teams/2',
            venue: {
              name: 'UBS Arena',
              link: '/api/v1/venues/null',
              city: 'Elmont',
              timeZone: {
                id: 'America/New_York',
                offset: -4,
                tz: 'EDT',
              },
            },
            abbreviation: 'NYI',
            triCode: 'NYI',
            teamName: 'Islanders',
            locationName: 'New York',
            firstYearOfPlay: '1972',
            division: {
              id: 18,
              name: 'Metropolitan',
              nameShort: 'Metro',
              link: '/api/v1/divisions/18',
              abbreviation: 'M',
            },
            conference: {
              id: 6,
              name: 'Eastern',
              link: '/api/v1/conferences/6',
            },
            franchise: {
              franchiseId: 22,
              teamName: 'Islanders',
              link: '/api/v1/franchises/22',
            },
            shortName: 'NY Islanders',
            officialSiteUrl: 'http://www.newyorkislanders.com/',
            franchiseId: 22,
            active: true,
          },
        },
      },
      liveData: {
        plays: {
          allPlays: [
            {
              players: [
                {
                  player: {
                    id: 1,
                    fullName: 'Trent Frederic',
                    link: '/api/v1/people/8479365',
                  },
                  playerType: 'Hitter',
                },
                {
                  player: {
                    id: 2,
                    fullName: 'Miles Wood',
                    link: '/api/v1/people/8477425',
                  },
                  playerType: 'Hittee',
                },
              ],
              result: {
                event: 'Hit',
                eventCode: 'NJD126',
                eventTypeId: 'HIT',
                description: 'Trent Frederic hit Miles Wood',
              },
              team: {
                id: 6,
                name: 'Boston Bruins',
                link: '/api/v1/teams/6',
                triCode: 'BOS',
              },
            },
            {
              players: [
                {
                  player: {
                    id: 1,
                    fullName: 'Trent Frederic',
                    link: '/api/v1/people/8479365',
                  },
                  playerType: 'Hitter',
                },
                {
                  player: {
                    id: 2,
                    fullName: 'Miles Wood',
                    link: '/api/v1/people/8477425',
                  },
                  playerType: 'Hittee',
                },
              ],
              result: {
                event: 'Hit',
                eventCode: 'NJD126',
                eventTypeId: 'HIT',
                description: 'Trent Frederic hit Miles Wood',
              },
              team: {
                id: 6,
                name: 'Boston Bruins',
                link: '/api/v1/teams/6',
                triCode: 'BOS',
              },
            },
            {
              players: [
                {
                  player: {
                    id: 1,
                    fullName: 'Trent Frederic',
                    link: '/api/v1/people/8479365',
                  },
                  playerType: 'Scorer',
                },
                {
                  player: {
                    id: 2,
                    fullName: 'Miles Wood',
                    link: '/api/v1/people/8477425',
                  },
                  playerType: 'Assist',
                },
              ],
              result: {
                event: 'Goal',
                eventCode: 'NJD126',
                eventTypeId: 'HIT',
                description: 'Trent Frederic hit Miles Wood',
              },
              team: {
                id: 6,
                name: 'Boston Bruins',
                link: '/api/v1/teams/6',
                triCode: 'BOS',
              },
            },
            {
              players: [
                {
                  player: {
                    id: 1,
                    fullName: 'Trent Frederic',
                    link: '/api/v1/people/8479365',
                  },
                  playerType: 'Scorer',
                },
                {
                  player: {
                    id: 2,
                    fullName: 'Miles Wood',
                    link: '/api/v1/people/8477425',
                  },
                  playerType: 'Assist',
                },
              ],
              result: {
                event: 'Goal',
                eventCode: 'NJD126',
                eventTypeId: 'HIT',
                description: 'Trent Frederic hit Miles Wood',
              },
              team: {
                id: 6,
                name: 'Boston Bruins',
                link: '/api/v1/teams/6',
                triCode: 'BOS',
              },
            },
            {
              players: [
                {
                  player: {
                    id: 1,
                    fullName: 'Trent Frederic',
                    link: '/api/v1/people/8479365',
                  },
                  playerType: 'DrewBy',
                },
                {
                  player: {
                    id: 1,
                    fullName: 'Miles Wood',
                    link: '/api/v1/people/8477425',
                  },
                  playerType: 'Assist',
                },
              ],
              result: {
                event: 'Penalty',
                eventCode: 'NJD126',
                eventTypeId: 'HIT',
                description: 'Trent Frederic hit Miles Wood',
                penaltySeverity: 'Minor',
                penaltyMinutes: 2,
              },
              team: {
                id: 6,
                name: 'Boston Bruins',
                link: '/api/v1/teams/6',
                triCode: 'BOS',
              },
            },
          ],
        } as unknown as GameResponse['liveData']['plays'],
      },
    };

    insertOrUpdatePlayerMock = jest.fn((player: IPlayer) => {
      player.id = Math.random();
      return Promise.resolve(player);
    });
    insertOrUpdateTeamMock = jest.fn((team: ITeam) => {
      team.id = Math.random();
      return Promise.resolve(team);
    });

    const watcher = new GameWatcher();

    getAllByExternalId = jest.fn(() => {
      return Promise.resolve(
        watcher.mapTeams([
          gameData.gameData.teams.away,
          gameData.gameData.teams.home,
        ])
      );
    });
    getAllPlayerByExternalId = jest.fn(() => {
      return Promise.resolve(
        watcher.mapPlayers(Object.values(gameData.gameData.players))
      );
    });
    getAllGameByExternalId = jest.fn().mockResolvedValue([
      {
        id: Math.random(),
        penaltyMinutes: 2,
        assists: 0,
        goals: 2,
        hits: 2,
        points: 0,
        playerId: 0.562383802251103,
        teamId: 0.26357762280597674,
        isFinal: true,
        gameIdentifier: 123,
        startDate: '2022-10-02T23:00:00.000Z',
      },
    ]);

    closeMock = jest.fn();
    getPoolMock = jest.fn();

    getGameDataMock = jest.fn().mockResolvedValue(gameData);
    insertGame = jest.fn().mockResolvedValue(true);
    updateGame = jest.fn().mockResolvedValue(true);

    DB.close = closeMock;
    DB.getPool = getPoolMock;
    NhlApi.getGameData = getGameDataMock;
    (GameDb as jest.Mock).mockImplementation(() => {
      return {
        insertGames: insertGame,
        updateGame: updateGame,
        getAllByExternalId: getAllGameByExternalId,
      };
    });
    (PlayerDb as jest.Mock).mockImplementation(() => {
      return {
        insertOrUpdatePlayer: insertOrUpdatePlayerMock,
        getAllByExternalId: getAllPlayerByExternalId,
      };
    });
    (TeamDb as jest.Mock).mockImplementation(() => {
      return {
        getAllByExternalId: getAllByExternalId,
        insertOrUpdateTeam: insertOrUpdateTeamMock,
      };
    });
  });
  it('On new create player should be called', async () => {
    await handler(event);
    expect(insertOrUpdatePlayerMock).toHaveBeenCalled();
  });
  it('On new create team should be called', async () => {
    await handler(event);
    expect(insertOrUpdateTeamMock).toHaveBeenCalled();
  });
  it('should tallie up scores for player', async () => {
    const lambdaHandler = new GameWatcher();
    //@ts-ignore
    const spy = jest.spyOn(lambdaHandler, 'getPlayerStats');

    await lambdaHandler.handler(event);
    expect(spy).toHaveReturnedWith([
      {
        penaltyMinutes: 2,
        assists: 0,
        goals: 2,
        hits: 2,
        points: 0,
        playerId: expect.anything(),
        isFinal: true,
        teamId: expect.anything(),
        gameIdentifier: 123,
        startDate: expect.anything(),
      },
      {
        penaltyMinutes: 0,
        assists: 2,
        goals: 0,
        hits: 0,
        points: 0,
        playerId: expect.anything(),
        teamId: expect.anything(),
        isFinal: true,
        gameIdentifier: 123,
        startDate: expect.anything(),
      },
    ]);
  });
  it('should only insert ', async () => {
    await handler(event);
    expect(updateGame).not.toHaveBeenCalled();
    expect(insertGame).toHaveBeenCalledWith(
      expect.arrayContaining([
        {
          penaltyMinutes: 2,
          assists: 0,
          goals: 2,
          hits: 2,
          points: 0,
          playerId: expect.anything(),
          isFinal: true,
          teamId: expect.anything(),
          gameIdentifier: 123,
          startDate: expect.anything(),
        },
      ])
    );
  });
  it('should get existing data if live game', async () => {
    event = {
      Records: [
        {
          Sns: {
            Message:
              '{"gameUrl":"/api/v1/game/2022010069/feed/live", "gameId": 2}',
          },
        },
      ],
    } as unknown as SNSEvent;
    await handler(event);
    expect(getAllByExternalId).toHaveBeenCalled();
    expect(getAllPlayerByExternalId).toHaveBeenCalled();
    expect(getAllGameByExternalId).toHaveBeenCalled();
    expect(updateGame).toHaveBeenCalled();
  });
});
