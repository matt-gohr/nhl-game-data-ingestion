import * as AWS from 'aws-sdk';

import { GameWatcherSNSEvent } from '../models/interfaces';

export class AwsUtil {
  public static async sendWatcherSns(data: GameWatcherSNSEvent): Promise<void> {
    return this.sendSns(JSON.stringify(data), process.env['GAME_WATCHER_SNS']);
  }
  private static async sendSns(message: string, topic: string): Promise<any> {
    if (process.env['STAGE'] === 'local') {
      console.log('========START SNS MESSAGE=========');
      console.log(message);
      console.log('========END SNS MESSAGE=========');
    } else {
      const sns = new AWS.SNS({
        region: process.env['REGION'],
      });
      return sns
        .publish({
          Message: message,
          TopicArn: topic,
        })
        .promise();
    }
  }
}
