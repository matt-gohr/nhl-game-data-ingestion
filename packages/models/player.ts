export interface IPlayer {
  id?: number;
  name: string;
  age?: number;
  position?: string;
  number?: string;
  player_identifier: number;
  team_id?: number;
  team_identifier?: number;
}
export class Player {
  id?: number;
  name: string;
  age?: number;
  position?: string;
  number?: string;
  playerIdentifier: number;
  teamId?: number;
  teamIdentifier?: number;
  constructor(data: IPlayer) {
    this.id = data.id;
    this.name = data.name;
    this.age = data.age;
    this.position = data.position;
    this.number = data.number;
    this.playerIdentifier = data.player_identifier;
    this.teamId = data.team_id;
    this.teamIdentifier = data.team_identifier;
  }
}
