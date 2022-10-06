import { Pool } from 'pg';

import { IPlayer, Player } from '../models/player';
import { DB } from './db';

export class PlayerDb {
  private pool: Pool;
  constructor() {
    this.pool = DB._pool;
  }
  /**
   * getGameData
   */
  public async insertOrUpdatePlayer(player: Player): Promise<Player> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    const result = await this.pool.query<IPlayer>({
      text:
        `INSERT INTO player (name, age, position, number, player_identifier) VALUES ($1, $2, $3, $4, $5) ` +
        `ON conflict ON CONSTRAINT unique_external_id DO UPDATE SET name=$1, age=$2, position=$3, number=$4 RETURNING * `,
      values: [
        player.name,
        player.age,
        player.position,
        player.number,
        player.playerIdentifier,
      ],
    });
    return result.rows.map((g) => new Player(g))[0];
  }
  public async getAllByExternalId(externalIds: number[]): Promise<Player[]> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    const result = await this.pool.query<IPlayer>({
      text: `SELECT * from team where player_identifier = ANY($1)`,
      values: [externalIds],
    });
    return result.rows.map((g) => new Player(g));
  }
}
