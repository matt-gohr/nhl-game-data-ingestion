import { ScheduledEvent, SNSEvent } from 'aws-lambda';
import faker from 'faker';

import {
    AdAccount,
    AdAccountDB,
    Channel,
    ChannelDB,
    MonitoringLoaderFunction,
    MonitoringLoaderFunctionDB,
    MonitoringLoaderInProgressDB,
} from '@eletype/models';
import { EletypeTestingUtil } from '@eletype/util';

import { MonitoringLoadAll } from '../src';

jest.mock('@eletype/models/dist/lib/db');
describe('MonitoringLoadAll', () => {
    let event;
    let accounts: AdAccount[];
    let adAccountFindAllAuthorized;
    let channels: Channel[];
    let channelMap: Map<number, Channel>;
    let channelFindAllMock;
    let functions: MonitoringLoaderFunction[];
    let functionMap: Map<number, MonitoringLoaderFunction[]>;
    let functionFindAllActiveMock;
    let inProgressCreateManyMock;
    let handler: MonitoringLoadAll;
    let sendSnsMock: jest.Mock;
    let logSpy: jest.SpyInstance;
    beforeEach(() => {
        process.env.STAGE = 'test';
        event = { id: String(Math.random()), time: String(Math.random()) } as ScheduledEvent;

        const accountIds = EletypeTestingUtil.getRandomNonZeroIntArray(100, 100);
        accounts = accountIds.map(
            (id) =>
                new AdAccount({
                    id,
                    channel_id: EletypeTestingUtil.getRandomNonZeroInt(2),
                    scan_hour: faker.random.number({ min: 0, max: 23 }),
                })
        );
        adAccountFindAllAuthorized = jest.fn().mockResolvedValue(accounts);
        // @ts-ignore
        AdAccountDB.mockImplementation(() => {
            return {
                findAllActiveByClientIdWithExtra: adAccountFindAllAuthorized,
            };
        });

        channels = [
            new Channel({ id: Channel.FACEBOOK, name: Channel.facebook, load_all_arn: String(Math.random()) }),
            new Channel({ id: Channel.GOOGLE, name: Channel.adwords, load_all_arn: String(Math.random()) }),
        ];
        channelMap = new Map<number, Channel>();
        channelMap.set(channels[0].id, channels[0]);
        channelMap.set(channels[1].id, channels[1]);
        channelFindAllMock = jest.fn().mockResolvedValue(channels);
        // @ts-ignore
        ChannelDB.mockImplementation(() => {
            return {
                findAll: channelFindAllMock,
            };
        });

        functions = [];
        functionMap = new Map<number, MonitoringLoaderFunction[]>();
        channels.forEach((channel) => {
            const functionIds = EletypeTestingUtil.getRandomNonZeroIntArray(4, 100);
            const array: MonitoringLoaderFunction[] = [];
            functionIds.forEach((id) => {
                const func = new MonitoringLoaderFunction({
                    channel_id: channel.id,
                    id,
                    identifier: String(Math.random()),
                    is_active: true,
                });
                functions.push(func);
                array.push(func);
            });
            functionMap.set(channel.id, array);
        });
        functionFindAllActiveMock = jest.fn().mockResolvedValue(functions);
        // @ts-ignore
        MonitoringLoaderFunctionDB.mockImplementation(() => {
            return {
                findAllActive: functionFindAllActiveMock,
            };
        });

        inProgressCreateManyMock = jest.fn().mockResolvedValue([]);
        // @ts-ignore
        MonitoringLoaderInProgressDB.mockImplementation(() => {
            return {
                createMany: inProgressCreateManyMock,
            };
        });

        handler = new MonitoringLoadAll();
        // @ts-ignore
        handler.initExecution();

        logSpy = jest.spyOn(handler, 'logError');

        sendSnsMock = jest.fn().mockResolvedValue(true);
        handler.sendSns = sendSnsMock;

        const DATE_TO_USE = new Date('2016');
        // @ts-ignore
        (global as any).Date = jest.fn(() => DATE_TO_USE);
        const now = Math.random();
        global.Date.now = () => now;
    });

    it('should have event ID for load identifier', async () => {
        adAccountFindAllAuthorized.mockResolvedValue(accounts.slice(0, 1));
        const handleSpy = jest.spyOn(handler as any, 'handleAdAccount').mockResolvedValue([]);
        await handler.handle(event);
        return expect(handleSpy).toHaveBeenCalledWith(event.id, accounts[0], channelMap, functionMap);
    });

    it('should have SNS mesage ID for load identifier', async () => {
        adAccountFindAllAuthorized.mockResolvedValue(accounts.slice(0, 1));
        event = { Records: [{ Sns: { MessageId: String(Math.random()) } }] } as SNSEvent;
        const handleSpy = jest.spyOn(handler as any, 'handleAdAccount').mockResolvedValue([]);
        await handler.handle(event);
        return expect(handleSpy).toHaveBeenCalledWith(
            event.Records[0].Sns.MessageId,
            accounts[0],
            channelMap,
            functionMap
        );
    });

    it('should have timestamp for load identifier', async () => {
        adAccountFindAllAuthorized.mockResolvedValue(accounts.slice(0, 1));
        event = {};
        const handleSpy = jest.spyOn(handler as any, 'handleAdAccount').mockResolvedValue([]);
        // @ts-ignore
        await handler.handle(event);
        return expect(handleSpy).toHaveBeenCalledWith(String(Date.now()), accounts[0], channelMap, functionMap);
    });

    it('should not process ad account if channel not found', async () => {
        channelFindAllMock.mockResolvedValue([]);
        await expect(handler.handle(event)).resolves.toBeTruthy();
        expect(sendSnsMock).not.toHaveBeenCalled();
        expect(logSpy).toHaveBeenCalled();
        return expect(inProgressCreateManyMock).not.toHaveBeenCalled();
    });

    it('should not process ad account if channel not found', async () => {
        functionFindAllActiveMock.mockResolvedValue([]);
        await expect(handler.handle(event)).resolves.toBeTruthy();
        expect(sendSnsMock).not.toHaveBeenCalled();
        expect(logSpy).toHaveBeenCalled();
        return expect(inProgressCreateManyMock).not.toHaveBeenCalled();
    });

    it('should process every ad account', async () => {
        await expect(handler.handle(event)).resolves.toBeTruthy();

        expect(adAccountFindAllAuthorized).toHaveBeenCalledWith();
        const loadHourMap = new Map<number, number>();
        accounts.forEach((adAccount) => {
            let loadHour = adAccount.scan_hour! - 1;
            if (loadHour < 0) {
                loadHour = 23;
            }
            loadHourMap.set(loadHour, loadHour);
            const arn = channelMap.get(adAccount.channel_id).load_all_arn;
            expect(sendSnsMock).toHaveBeenCalledWith({ ad_account: adAccount, load_identifier: event.id }, arn);
            const funcs = functionMap.get(adAccount.channel_id);
            expect(inProgressCreateManyMock).toHaveBeenCalledWith(adAccount.id, event.id, funcs);
        });
        expect(sendSnsMock).toHaveBeenCalledTimes(accounts.length);
        return expect(inProgressCreateManyMock).toHaveBeenCalledTimes(accounts.length);
    });

    it('should process every ad account regardless of time', async () => {
        event.time = undefined;
        event.Records = [
            {
                Sns: {
                    Message: 'runAll',
                    MessageId: event.id,
                },
            },
        ];
        await expect(handler.handle(event)).resolves.toBeTruthy();

        expect(adAccountFindAllAuthorized).toHaveBeenCalledWith();
        accounts.forEach((adAccount) => {
            const arn = channelMap.get(adAccount.channel_id).load_all_arn;
            expect(sendSnsMock).toHaveBeenCalledWith({ ad_account: adAccount, load_identifier: event.id }, arn);
            const funcs = functionMap.get(adAccount.channel_id);
            expect(inProgressCreateManyMock).toHaveBeenCalledWith(adAccount.id, event.id, funcs);
        });
        expect(sendSnsMock).toHaveBeenCalledTimes(accounts.length);
        return expect(inProgressCreateManyMock).toHaveBeenCalledTimes(accounts.length);
    });
});
