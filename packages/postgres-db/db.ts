import { Pool, PoolConfig } from 'pg';

export class DB {
  private static _pool: Pool | null = null;

  public static async close(): Promise<void> {
    console.log('closing');

    if (DB._pool) {
      await DB._pool.end().then(() => {
        DB._pool = null;
        console.log('closed');
      });
    }

    return;
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
