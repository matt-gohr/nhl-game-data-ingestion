# nhl-game-data-ingestion

aws serverless functions to ingest nhl game data into postgress
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

## Deploy

using serverless to deploy to aws. you'll have to configure the database and topics based on your environment.

```bash
  serverless deploy
```
