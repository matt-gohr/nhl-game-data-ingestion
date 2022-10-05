export interface ITeam {
  id?: number;
  name: string;
  team_identifier: number;
}

export class Team {
  id?: number;
  name: string;
  team_identifier: number;
  constructor(data: ITeam) {
    this.id = data.id;
    this.name = data.name;
    this.team_identifier = data.team_identifier;
  }
}
