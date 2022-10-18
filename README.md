# nhl-game-data-ingestion

aws serverless functions to ingest nhl game data into postgress.
The scheduler will run every 30 mins and check for game statuses. If there is a live or past game that isn't already in the db, it will send an sns message to the `game-watcher` function to save the score.

![image](https://user-images.githubusercontent.com/23470818/193689370-76d6ea5e-443a-4b95-ae79-4750c798c79e.png)

# Installation

using node version 16.x

## Repo

Install my-project with npm

```bash
npm i
```

## Postgres DB

Install psql locally

```bash
brew install postgresql
```

pull docker image;

```
docker pull gohr89/sport-radar-db
```

start the docker postgres container (This will run the database on port 5431, please be sure to update your secrets.yml file)

```
docker run -p 127.0.0.1:5431:5432/tcp gohr89/sport-radar-db
```

Populate the database with the data and schema. Run dump file For Postgres. There will be a password prompt for user postgres enter in 9876 as the password

```bash
psql -U postgres -h 0.0.0.0 -p 5431 sport_radar < new-dump-file.sql
```

There will be a password prompt for user `postgres` enter in 9876 as the password

Create Secrets file
There is a `secrets.example.yml` file.  You would need to remove the example in the name to make it `secrets.yml` and that will be the env variables for the database and AWS account

## AWS Config

Please setup a profile with the provided credentials in the email. This is a readonly profile for my account that I'll delete afterwards.
![image](https://user-images.githubusercontent.com/23470818/195419340-3104f8b4-e992-445b-a9d8-c7dad1e19c39.png)

Place credentials in aws creds file `~/.aws/credentials`
CREDENTIALS PROVIDED IN EMAIL

# Running Local

The AWS and DB credentials are in the secrets.example.yml file

To run locally you'll have to run the `game-scheduler` first and get the sns logs from that to run the `game-watcher` function

```bash
  npm run local:scheduler
```

the output should look something like this

![image](https://user-images.githubusercontent.com/23470818/195417351-c8e13941-dd82-434d-8cfb-c1300e1d09d1.png)

You would take one of those logs inbetweeen the `========START SNS MESSAGE=======` and `========END SNS MESSAGE=========`
example

```
{\"gameUrl\":\"/api/v1/game/2022010069/feed/live\"}
```

and place that log the `event.json` where the `Message` field is. To simulate an sns message.

```
{
  "Records": [
    {
      "Sns": {
        "Message": "{\"gameUrl\":\"/api/v1/game/2022010069/feed/live\"}"
      }
    }
  ]
}
```

once the event.json file is updated, please run the following command.

```bash
  npm run local:watcher
```

## Run api

```bash
  npm run local:api
```

two endpoints.

Get all game data:

```
http://localhost:3000/local/allGameData
```

Get all game data by external id:

```
http://localhost:3000/local/allGameData/2022010069
```

## Running Tests

To run tests, run the following command

```bash
  npm run test
```

## Deploy to AWS

using serverless to deploy to aws. You'll have to configure the database. I was able to get the lamnda functions deployed to my aws account but did not setup a database in aws.

```bash
  serverless deploy
```
