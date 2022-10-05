export interface ScheduledResponse {
  totalItems: number;
  totalEvents: number;
  totalGames: number;
  totalMatches: number;
  wait: number;
  dates: [
    {
      date: string;
      totalItems: number;
      totalEvents: number;
      totalGames: number;
      totalMatches: number;
      games: [
        {
          gamePk: number;
          link: string;
          gameType: string;
          season: string;
          gameDate: string;
          status: GameStatus;
          teams: {
            away: {
              leagueRecord: {
                wins: number;
                losses: number;
                ot: number;
                type: string;
              };
              score: number;
              team: {
                id: number;
                name: string;
                link: string;
              };
            };
            home: {
              leagueRecord: {
                wins: number;
                losses: number;
                ot: number;
                type: string;
              };
              score: 0;
              team: {
                id: number;
                name: string;
                link: string;
              };
            };
          };
          venue: {
            name: string;
            link: string;
          };
          content: {
            link: string;
          };
        }
      ];
      events: [];
      matches: [];
    }
  ];
}

export interface PlayerResponse {
  id: number;
  fullName: string;
  link: string;
  firstName: string;
  lastName: string;
  primaryNumber: string;
  birthDate: string;
  currentAge: number;
  birthCity: string;
  birthStateProvince: string;
  birthCountry: string;
  nationality: string;
  height: string;
  weight: number;
  active: boolean;
  alternateCaptain: boolean;
  captain: boolean;
  rookie: boolean;
  shootsCatches: string;
  rosterStatus: string;
  currentTeam: {
    id: number;
    name: string;
    link: string;
    triCode: string;
  };
  primaryPosition: {
    code: string;
    name: string;
    type: string;
    abbreviation: string;
  };
}
export interface GameStatus {
  abstractGameState: string | 'Live';
  codedGameState: string;
  detailedState: string;
  statusCode: string | 'Final' | 'Scheduled' | 'In Progress';
  startTimeTBD: boolean;
}
export interface TeamResponse {
  id: number;
  name: string;
  link: string;
  venue: {
    name: string;
    link: string;
    city: string;
    timeZone: {
      id: string;
      offset: number;
      tz: string;
    };
  };
  abbreviation: string;
  triCode: string;
  teamName: string;
  locationName: string;
  firstYearOfPlay: string;
  division: {
    id: number;
    name: string;
    nameShort: string;
    link: string;
    abbreviation: string;
  };
  conference: {
    id: number;
    name: string;
    link: string;
  };
  franchise: {
    franchiseId: number;
    teamName: string;
    link: string;
  };
  shortName: string;
  officialSiteUrl: string;
  franchiseId: number;
  active: true;
}
export interface GameResponse {
  gamePk: number;
  link: string;
  metaData: {
    wait: number;
    timeStamp: string;
  };
  gameData: {
    game: {
      pk: number;
      season: string;
      type: string;
    };
    datetime: {
      dateTime: string;
    };
    status: GameStatus;
    teams: {
      away: TeamResponse;
      home: TeamResponse;
    };
    players: { [name: string]: PlayerResponse };
  };
  liveData: {
    plays: {
      allPlays: Play[];
      scoringPlays: number[];
      penaltyPlays: number[];
      playsByPeriod: any;
      currentPlay: any;
    };
  };
}

export interface Play {
  players?: [
    {
      player: {
        id: number;
        fullName: string;
        link: string;
      };
      playerType: string;
    },
    {
      player: {
        id: number;
        fullName: string;
        link: string;
      };
      playerType: string;
    }
  ];
  result: {
    event: string;
    eventCode: string;
    eventTypeId: string;
    description: string;
    penaltySeverity: string;
    penaltyMinutes: number;
  };
  about?: {
    eventIdx: number;
    eventId: number;
    period: number;
    periodType: string;
    ordinalNum: string;
    periodTime: string;
    periodTimeRemaining: string;
    dateTime: string;
    goals: {
      away: number;
      home: number;
    };
  };
  coordinates?: {
    x: number;
    y: number;
  };
  team?: {
    id: number;
    name: string;
    link: string;
    triCode: string;
  };
}
