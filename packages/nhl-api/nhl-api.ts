import axios, { AxiosRequestConfig, AxiosResponse } from 'axios';

import { ScheduledResponse } from '../models/api-responses/scheduled';

export class NhlApi {
  public async getNextDaysSchedule(): Promise<ScheduledResponse> {
    const url = 'https://statsapi.web.nhl.com/api/v1/schedule';
    const date = new Date();

    const config: AxiosRequestConfig = {
      params: {
        startDate: date.toISOString().split('T')[0],
        endDate: date.toISOString().split('T')[0],
      },
    };
    const r: AxiosResponse<ScheduledResponse> = await axios.get(url, config);
    if (r.data && r.data.dates.length > 0) {
      return r.data;
    } else {
      // TODO: send to some error log service
      throw new Error('no data returned from api');
    }
  }
}
