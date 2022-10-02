import { ScheduledEvent, SNSEvent } from 'aws-lambda';

export class GameWatcher {
  public handler(event: SNSEvent | ScheduledEvent): any {
    console.log('triggered function');
    console.log(event);
  }
}

export const instance = new GameWatcher();
/* istanbul ignore next */
export const handler = (event: SNSEvent): Promise<any> =>
  instance.handler(event);
