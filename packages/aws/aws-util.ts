import * as AWS from 'aws-sdk';

export class AwsUtil {
  public static async sendSns(message: string): Promise<any> {
    const sns = new AWS.SNS({
      region: process.env['REGION'],
    });
    return sns
      .publish({
        Message: message,
        TopicArn: process.env['GAME_WATCHER_SNS'],
      })
      .promise();
  }
}
