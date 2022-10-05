import { SNSEvent } from 'aws-lambda';

import { DB } from '../../../packages/postgres-db/db';
import { PlayerDb } from '../../../packages/postgres-db/player-db';
import { TeamDb } from '../../../packages/postgres-db/team-db';
import { GameWatcher, handler } from '../src';

jest.mock('../../../packages/postgres-db/db');
jest.mock('../../../packages/postgres-db/player-db');
jest.mock('../../../packages/postgres-db/team-db');
describe('game watcher', () => {
  let event: SNSEvent;
  let handler: GameWatcher;
  let db: DB;
  let insertOrUpdatePlayerMock: jest.Mock;
  let insertOrUpdateTeamMock: jest.Mock;
  let closeMock: jest.Mock;
  beforeEach(() => {
    event = {
      id: String(Math.random()),
      time: String(Math.random()),
    } as unknown as SNSEvent;
    insertOrUpdatePlayerMock = jest.fn();
    DB.close = jest.fn();

    (PlayerDb as jest.Mock).mockImplementation(() => {
      return {
        insertOrUpdatePlayer: insertOrUpdatePlayerMock,
      };
    });
    (TeamDb as jest.Mock).mockImplementation(() => {
      return {
        insertOrUpdateTeam: insertOrUpdateTeamMock,
      };
    });
    handler = new GameWatcher();
  });
  it('should be called', () => {
    handler.handler(event);
    expect(insertOrUpdatePlayerMock).toBeCalled();
  });
});
