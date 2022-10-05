export interface IGame {
  id?: number;
  player_id?: number;
  player_name?: number;
  team_id?: number;
  team_name?: number;
  player_age?: number;
  player_number?: number;
  player_position?: number;
  assists?: number;
  goals?: number;
  hits?: number;
  points?: number;
  penalty_minutes?: number;
  is_final?: boolean;
  game_identifier?: number;
  start_date?: string;
}
export class Game {
  public id?: number;
  public playerId: number;
  public playerName: number;
  public teamId: number;
  public teamName: number;
  public playerAge: number;
  public playerNumber: number;
  public playerPosition: number;
  public penaltyMinutes: number = 0;
  public isFinal: boolean;
  public gameIdentifier: number;
  public startDate: Date;
  public assists: number = 0;
  public goals: number = 0;
  public hits: number = 0;
  public points: number = 0;
  constructor(data: IGame) {
    if (data.id !== undefined) {
      this.id = data.id;
    }
    if (data.player_id !== undefined) {
      this.playerId = data.player_id;
    }
    if (data.player_name !== undefined) {
      this.playerName = data.player_name;
    }
    if (data.team_id !== undefined) {
      this.teamId = data.team_id;
    }
    if (data.team_name !== undefined) {
      this.teamName = data.team_name;
    }
    if (data.player_age !== undefined) {
      this.playerAge = data.player_age;
    }
    if (data.player_number !== undefined) {
      this.playerNumber = data.player_number;
    }
    if (data.player_position !== undefined) {
      this.playerPosition = data.player_position;
    }
    if (data.penalty_minutes !== undefined) {
      this.penaltyMinutes = data.penalty_minutes;
    }
    if (data.is_final !== undefined) {
      this.isFinal = data.is_final;
    }
    if (data.game_identifier !== undefined) {
      this.gameIdentifier = data.game_identifier;
    }
    if (data.assists !== undefined) {
      this.assists = data.assists;
    }
    if (data.goals !== undefined) {
      this.goals = data.goals;
    }
    if (data.hits !== undefined) {
      this.hits = data.hits;
    }
    if (data.points !== undefined) {
      this.points = data.points;
    }
    this.startDate = new Date(data.start_date);
  }
}
