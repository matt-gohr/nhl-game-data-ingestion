# nhl-game-data-ingestion

aws serverless functions to ingest nhl game data into postgress.
The scheduler will run every 30 mins and check for game statuses.  If there is a live or past game that isn't already in the db, it will send an sns message to the `game-watcher` function to save the score. 

![image](https://user-images.githubusercontent.com/23470818/193689370-76d6ea5e-443a-4b95-ae79-4750c798c79e.png)

## Installation

using node version 16.x

Install my-project with npm

```bash
  npm i
```

Run dump file For Postgres

## Running Local

The AWS and DB credentials are in the secrets.example.yml file

To run locally you'll have to run the `game-scheduler` first and get the sns logs from that to run the `game-watcher` function

```bash
  npm run local:game-scheduler
```

take the output from game scheduler to the `event.json` file and run the following command

```bash
  npm run local:game-watcher
```

## Running Tests

To run tests, run the following command

```bash
  npm run test
```

## Deploy to AWS

using serverless to deploy to aws. You'll have to configure the database.  I was able to get the lamnda functions deployed to my aws account but did not setup a database in aws. 

```bash
  serverless deploy
```
