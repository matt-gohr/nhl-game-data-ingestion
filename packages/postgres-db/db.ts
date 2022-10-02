import { Pool, PoolConfig } from 'pg';

export class DB {
  private static _pool: Pool | null = null;
  private static _readPool: Pool | null = null;

  public static async close(): Promise<void> {
    const promises: Array<Promise<void>> = [];
    if (DB._pool) {
      promises.push(
        DB._pool.end().then(() => {
          DB._pool = null;
        })
      );
    }
    if (DB._readPool) {
      promises.push(
        DB._readPool.end().then(() => {
          DB._readPool = null;
        })
      );
    }
    await Promise.all(promises);
    return await Promise.resolve();
  }

  public static async getPool(): Promise<Pool> {
    if (!DB._pool) {
      DB._pool = await DB.connectPool();
      return DB._pool;
    }

    return Promise.resolve(DB._pool);
  }

  private static async connectPool(): Promise<Pool> {
    let max: number = 3;
    const maxEnv = process.env.MAXCONNECTIONS;
    if (maxEnv && maxEnv !== undefined) {
      max = Number(process.env['MAXCONNECTIONS']);
    }

    const config = {
      database: process.env['DBNAME'],
      host: process.env['HOST'],
      max,
      password: process.env['PASSWORD'],
      port: Number(process.env['PORT']),
      user: process.env['USERNAME'],
    } as PoolConfig;
    return new Pool(config);
  }
}
