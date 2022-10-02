import { Pool } from 'pg';

import { DB } from './db';

export class GameDb {
  private pool: Pool;

  /**
   * getGameData
   */
  public async getGameData(): Promise<any> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    await this.pool.query({
      text: 'SELECT * FROM game',
    });
  }
}
