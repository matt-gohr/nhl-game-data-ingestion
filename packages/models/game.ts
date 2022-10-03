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
  public player_id: number;
  public player_name: number;
  public team_id: number;
  public team_name: number;
  public player_age: number;
  public player_number: number;
  public player_position: number;
  public assists: number;
  public goals: number;
  public hits: number;
  public points: number;
  public penalty_minutes: number;
  public is_final: boolean;
  public game_identifier: number;
  public start_date: Date;
  constructor(data: IGame) {
    this.id = data.id;
    this.player_id = data.player_id;
    this.player_name = data.player_name;
    this.team_id = data.team_id;
    this.team_name = data.team_name;
    this.player_age = data.player_age;
    this.player_number = data.player_number;
    this.player_position = data.player_position;
    this.assists = data.assists;
    this.goals = data.goals;
    this.hits = data.hits;
    this.points = data.points;
    this.penalty_minutes = data.penalty_minutes;
    this.is_final = data.is_final;
    this.game_identifier = data.game_identifier;
    this.start_date = new Date(data.start_date);
  }
}
