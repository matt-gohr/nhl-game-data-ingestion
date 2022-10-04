export interface ITeam {
  id?: number;
  name: string;
  team_identifier: string;
}

export class Team {
  id?: number;
  name: string;
  team_identifier: string;
  constructor(data: ITeam) {
    this.id = data.id;
    this.name = data.name;
    this.team_identifier = data.team_identifier;
  }
}
