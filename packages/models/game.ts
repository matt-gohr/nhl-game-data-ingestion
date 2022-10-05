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
  public penaltyMinutes: number;
  public isFinal: boolean;
  public gameIdentifier: number;
  public startDate: Date;
  public assists: number;
  public goals: number;
  public hits: number;
  public points: number;
  constructor(data: IGame) {
    this.id = data.id;
    this.playerId = data.player_id;
    this.playerName = data.player_name;
    this.teamId = data.team_id;
    this.teamName = data.team_name;
    this.playerAge = data.player_age;
    this.playerNumber = data.player_number;
    this.playerPosition = data.player_position;
    this.penaltyMinutes = data.penalty_minutes;
    this.isFinal = data.is_final;
    this.gameIdentifier = data.game_identifier;
    this.startDate = new Date(data.start_date);
    this.assists = data.assists;
    this.goals = data.goals;
    this.hits = data.hits;
    this.points = data.points;
  }
}
