import { ScheduledEvent, SNSEvent } from 'aws-lambda';

export class GameScheduler {
  public handler(event: SNSEvent | ScheduledEvent): any {
    console.log(event);
    console.log('hello world');
  }
}

export const instance = new GameScheduler();
/* istanbul ignore next */
export const handler = (event: SNSEvent): Promise<any> =>
  instance.handler(event);
