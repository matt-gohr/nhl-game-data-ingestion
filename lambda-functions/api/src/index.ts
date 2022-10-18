import { DB } from '../../../packages/postgres-db/db';
import { GameDb } from '../../../packages/postgres-db/game-db';

const serverless = require('serverless-http');
const express = require('express');
const app = express();

app.get('/allGameData', async (req: any, res: any) => {
  try {
    DB.getPool();
    const gameDb = new GameDb();
    const x = await gameDb.getGames();
    res.send(x);
  } catch (error) {
    res.send('Error getting data');
  }
  DB.close();
});
app.get('/allGameData/:id', async (req: any, res: any) => {
  try {
    DB.getPool();
    const gameDb = new GameDb();
    const x = await gameDb.getAllByExternalId(req.params.id);
    res.send(x);
  } catch (error) {
    res.send(`Error getting data ${error}`);
  }
  DB.close();
});

module.exports.handler = serverless(app);
