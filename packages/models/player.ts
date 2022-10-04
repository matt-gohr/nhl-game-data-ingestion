export interface IPlayer {
  id?: number;
  name: string;
  age: number;
  position: string;
  number: string;
  player_identifier: number;
}
export class Player {
  id?: number;
  name: string;
  age: number;
  position: string;
  number: string;
  player_identifier: number;
  constructor(data: IPlayer) {
    this.id = data.id;
    this.name = data.name;
    this.age = data.age;
    this.position = data.position;
    this.number = data.number;
    this.player_identifier = data.player_identifier;
  }
}
