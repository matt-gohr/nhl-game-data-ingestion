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
          status: {
            abstractGameState: string;
            codedGameState: string;
            detailedState: string;
            statusCode: string | 'Final' | 'Scheduled';
            startTimeTBD: boolean;
          };
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
