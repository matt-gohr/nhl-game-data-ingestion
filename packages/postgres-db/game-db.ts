import { Pool } from 'pg';

import { Game, IGame } from '../models/game';
import { DB } from './db';

export class GameDb {
  private pool: Pool;
  private schemaColumnStr =
    'g.*, p.age as player_age, p.name as player_name, t.name as team_name, p.position as player_position, p.number as player_number';
  /**
   * getGameData
   */
  public async getGames(): Promise<any> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    const result = await this.pool.query<IGame>({
      text:
        `SELECT ${this.schemaColumnStr} FROM game g ` +
        'LEFT JOIN team t on t."id"=g.team_id ' +
        'LEFT JOIN player p on p."id"=player_id',
    });
    return result.rows.map((g) => new Game(g));
  }
  public async getAllTodaysGamesByExternalIds(
    externalIds: number[]
  ): Promise<Game[]> {
    try {
      if (!this.pool) {
        this.pool = await DB.getPool();
      }
      const text =
        `SELECT ${this.schemaColumnStr} FROM game g ` +
        'LEFT JOIN team t on t."id"=g.team_id ' +
        'LEFT JOIN player p on p."id"=player_id ' +
        'WHERE g.game_identifier = ANY($1) ' +
        'and g.is_final is false ' +
        'and Date(g.start_date) = CURRENT_DATE';

      const result = await this.pool.query<IGame>({
        text,
        values: [externalIds],
      });
      return result.rows.map((g) => new Game(g));
    } catch {
      return [];
    }
  }
}
