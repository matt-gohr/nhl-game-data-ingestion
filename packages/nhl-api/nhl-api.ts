import axios, { AxiosRequestConfig, AxiosResponse } from 'axios';

import { GameResponse, ScheduledResponse } from '../models/api-responses/scheduled';

export class NhlApi {
  private static baseUrl = 'https://statsapi.web.nhl.com';
  public static async getTodaysSchedule(): Promise<ScheduledResponse> {
    const url = this.baseUrl + '/api/v1/schedule';
    const startDate = new Date();
    const endDate = new Date();
    startDate.setDate(startDate.getDate() - 1);
    const config: AxiosRequestConfig = {
      params: {
        startDate: startDate.toISOString().split('T')[0],
        endDate: endDate.toISOString().split('T')[0],
      },
    };
    const r: AxiosResponse<ScheduledResponse> = await axios.get(url, config);
    return r.data;
  }
  public static async getGameData(path: string): Promise<GameResponse> {
    const url = this.baseUrl + path;
    const r: AxiosResponse<GameResponse> = await axios.get(url);
    return r.data;
  }
}
