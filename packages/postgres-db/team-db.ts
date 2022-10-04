import { Pool } from 'pg';

import { ITeam, Team } from '../models/team';
import { DB } from './db';

export class TeamDb {
  private pool: Pool;

  /**
   * getGameData
   */
  public async insertOrUpdateTeam(team: Team): Promise<Team> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    const result = await this.pool.query<ITeam>({
      text:
        `INSERT INTO team ("name", team_identifier) VALUES ('test', 22) ` +
        `ON conflict ON CONSTRAINT unique_team_external_id DO UPDATE SET name=$1 RETURNING * `,
      values: [team.name, team.team_identifier],
    });
    return result.rows.map((g) => new Team(g))[0];
  }
}
