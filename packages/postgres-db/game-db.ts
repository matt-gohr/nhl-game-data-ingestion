import { Pool } from 'pg';

import { Game, IGame } from '../models/game';
import { DB } from './db';

import pgFormat = require('pg-format');

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
  public async insertGames(game: Game[]): Promise<Game> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }
    const values = game.map((g) => [
      g.playerId,
      g.teamId,
      g.goals,
      g.hits,
      g.points,
      g.penaltyMinutes,
      g.assists,
      g.gameIdentifier,
      g.isFinal,
      g.startDate,
    ]);
    const insert =
      `INSERT INTO  game (player_id, team_id, goals, hits, points, penalty_minutes, assists, game_identifier, is_final, start_date) ` +
      `VALUES %L RETURNING *`;
    const format = pgFormat(insert, values);
    const result = await this.pool.query<IGame>({
      text: format,
    });
    return result.rows.map((g) => new Game(g))[0];
  }
  public async updateGame(game: Game): Promise<Game> {
    if (!this.pool) {
      this.pool = await DB.getPool();
    }

    const result = await this.pool.query<IGame>({
      text:
        `UPDATE game set player_id=$1, team_id=$2, goals=$3, hits=$4, point=$5, penalty_minutes=$6, assists=$7, game_identifier=$8, is_final=$9, start_date=$10) ` +
        `WHERE id=$11 RETURNING *`,
      values: [
        game.playerId,
        game.teamId,
        game.goals,
        game.hits,
        game.points,
        game.penaltyMinutes,
        game.assists,
        game.gameIdentifier,
        game.isFinal,
        game.startDate,
        game.id,
      ],
    });
    return result.rows.map((g) => new Game(g))[0];
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
  public async getAllByExternalId(externalId: number): Promise<Game[]> {
    try {
      if (!this.pool) {
        this.pool = await DB.getPool();
      }
      const text =
        `SELECT ${this.schemaColumnStr} FROM game g ` +
        'LEFT JOIN team t on t."id"=g.team_id ' +
        'LEFT JOIN player p on p."id"=player_id ' +
        'WHERE g.game_identifier = $1';

      const result = await this.pool.query<IGame>({
        text,
        values: [externalId],
      });
      return result.rows.map((g) => new Game(g));
    } catch {
      return [];
    }
  }
}
