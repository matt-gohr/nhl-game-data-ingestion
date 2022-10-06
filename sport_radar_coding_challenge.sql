/*
 Navicat PostgreSQL Data Transfer

 Source Server         : Local
 Source Server Type    : PostgreSQL
 Source Server Version : 90621 (90621)
 Source Host           : localhost:5432
 Source Catalog        : sport_radar
 Source Schema         : coding_challenge

 Target Server Type    : PostgreSQL
 Target Server Version : 90621 (90621)
 File Encoding         : 65001

 Date: 05/10/2022 22:38:28
*/


-- ----------------------------
-- Sequence structure for game_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "coding_challenge"."game_id_seq";
CREATE SEQUENCE "coding_challenge"."game_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "coding_challenge"."game_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for player_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "coding_challenge"."player_id_seq";
CREATE SEQUENCE "coding_challenge"."player_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "coding_challenge"."player_id_seq" OWNER TO "eletype";

-- ----------------------------
-- Sequence structure for team_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "coding_challenge"."team_id_seq";
CREATE SEQUENCE "coding_challenge"."team_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "coding_challenge"."team_id_seq" OWNER TO "eletype";

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS "coding_challenge"."game";
CREATE TABLE "coding_challenge"."game" (
  "player_id" int4 NOT NULL,
  "team_id" int4 NOT NULL,
  "goals" int4,
  "hits" int4,
  "points" int4 DEFAULT 0,
  "penalty_minutes" int4,
  "assists" int4 DEFAULT 0,
  "id" int4 NOT NULL DEFAULT nextval('"coding_challenge".game_id_seq'::regclass),
  "is_final" bool NOT NULL DEFAULT false,
  "game_identifier" int4 NOT NULL,
  "start_date" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "coding_challenge"."game" OWNER TO "postgres";

-- ----------------------------
-- Records of game
-- ----------------------------
BEGIN;
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (583, 29, 0, 4, 0, 0, 0, 61, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (581, 12, 0, 1, 0, 0, 0, 62, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (592, 29, 0, 3, 0, 0, 0, 63, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (539, 12, 0, 1, 0, 2, 0, 64, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (505, 29, 0, 2, 0, 0, 0, 65, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (2322, 12, 0, 1, 0, 2, 0, 66, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (502, 12, 0, 7, 0, 0, 1, 67, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (491, 12, 1, 3, 0, 0, 1, 68, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (536, 29, 1, 2, 0, 0, 0, 69, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (587, 29, 0, 2, 0, 0, 1, 70, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (599, 29, 0, 1, 0, 4, 0, 71, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (600, 12, 1, 0, 0, 0, 2, 72, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (543, 12, 0, 1, 0, 0, 2, 73, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (495, 29, 0, 1, 0, 0, 0, 74, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (500, 29, 0, 3, 0, 2, 0, 75, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (606, 12, 0, 1, 0, 0, 2, 76, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (509, 12, 1, 1, 0, 0, 1, 77, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (503, 12, 1, 0, 0, 0, 1, 78, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (506, 29, 0, 1, 0, 0, 0, 79, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (526, 12, 0, 3, 0, 4, 0, 80, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (2345, 12, 2, 0, 0, 0, 1, 81, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (604, 12, 0, 0, 0, 0, 1, 82, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (520, 29, 0, 2, 0, 2, 0, 83, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (499, 12, 2, 0, 0, 0, 2, 84, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (552, 12, 0, 2, 0, 0, 0, 85, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (601, 29, 0, 0, 0, 2, 0, 86, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (554, 29, 0, 2, 0, 0, 0, 87, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (583, 29, 0, 4, 0, 0, 0, 88, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (581, 12, 0, 1, 0, 0, 0, 89, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (592, 29, 0, 3, 0, 0, 0, 90, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (539, 12, 0, 1, 0, 2, 0, 91, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (505, 29, 0, 2, 0, 0, 0, 92, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (2322, 12, 0, 1, 0, 2, 0, 93, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (502, 12, 0, 7, 0, 0, 1, 94, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (491, 12, 1, 3, 0, 0, 1, 95, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (536, 29, 1, 2, 0, 0, 0, 96, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (587, 29, 0, 2, 0, 0, 1, 97, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (599, 29, 0, 1, 0, 4, 0, 98, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (600, 12, 1, 0, 0, 0, 2, 99, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (543, 12, 0, 1, 0, 0, 2, 100, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (495, 29, 0, 1, 0, 0, 0, 101, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (500, 29, 0, 3, 0, 2, 0, 102, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (606, 12, 0, 1, 0, 0, 2, 103, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (509, 12, 1, 1, 0, 0, 1, 104, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (503, 12, 1, 0, 0, 0, 1, 105, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (506, 29, 0, 1, 0, 0, 0, 106, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (526, 12, 0, 3, 0, 4, 0, 107, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (2345, 12, 2, 0, 0, 0, 1, 108, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (604, 12, 0, 0, 0, 0, 1, 109, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (520, 29, 0, 2, 0, 2, 0, 110, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (499, 12, 2, 0, 0, 0, 2, 111, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (552, 12, 0, 2, 0, 0, 0, 112, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (601, 29, 0, 0, 0, 2, 0, 113, 't', 2022010069, '2022-10-03 23:00:00');
INSERT INTO "coding_challenge"."game" ("player_id", "team_id", "goals", "hits", "points", "penalty_minutes", "assists", "id", "is_final", "game_identifier", "start_date") VALUES (554, 29, 0, 2, 0, 0, 0, 114, 't', 2022010069, '2022-10-03 23:00:00');
COMMIT;

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS "coding_challenge"."player";
CREATE TABLE "coding_challenge"."player" (
  "id" int4 NOT NULL DEFAULT nextval('"coding_challenge".player_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "age" int4,
  "position" varchar(255) COLLATE "pg_catalog"."default",
  "number" varchar(255) COLLATE "pg_catalog"."default",
  "player_identifier" int4 NOT NULL,
  "team_id" int4
)
;
ALTER TABLE "coding_challenge"."player" OWNER TO "eletype";

-- ----------------------------
-- Records of player
-- ----------------------------
BEGIN;
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (511, 'Aleksi Heimosalmi', 19, 'Defenseman', NULL, 8482860, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (514, 'Kirill Dolzhenkov', 18, 'Right Wing', NULL, 8483434, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (490, 'Joona Luoto', 25, 'Left Wing', '46', 8481649, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (515, 'Trey Fix-Wolansky', 23, 'Right Wing', '64', 8480441, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (518, 'Vasiliy Ponomarev', 20, 'Center', NULL, 8482102, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (521, 'James Malatesta', 19, 'Left Wing', '73', 8482744, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (522, 'Zion Nybeck', 20, 'Left Wing', NULL, 8482483, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (523, 'Sergei Mozyakin', 41, 'Right Wing', NULL, 8470253, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (525, 'Noel Gunler', 20, 'Right Wing', NULL, 8482080, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (527, 'Peter Quenneville', 28, 'Center', '75', 8477334, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (529, 'Teuvo Teravainen', 28, 'Left Wing', '86', 8476882, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (501, 'Robbie Stucker', 24, 'Defenseman', '78', 8480294, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (531, 'Lucas Mercuri', 20, 'Center', NULL, 8482518, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (532, 'Nikolai Makarov', 19, 'Defenseman', NULL, 8482913, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (533, 'Erik Gudbranson', 30, 'Defenseman', '44', 8475790, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (534, 'Jake Gardiner', 32, 'Defenseman', '51', 8474581, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (535, 'Nikita Guslistov', 20, 'Center', NULL, 8482917, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (536, 'Yegor Chinakhov', 21, 'Right Wing', '59', 8482475, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (537, 'Antti Raanta', 33, 'Goalie', '32', 8477293, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (539, 'Nick Blankenburg', 24, 'Defenseman', '77', 8483565, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (541, 'Liam Foudy', 22, 'Center', '19', 8480853, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (542, 'Robert Orr', 19, 'Right Wing', '45', 8482755, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (543, 'Seth Jarvis', 20, 'Center', '24', 8482093, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (546, 'David Jiricek', 18, 'Defenseman', NULL, 8483460, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (547, 'Alexandre Texier', 23, 'Center', '42', 8480074, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (549, 'Jordan Staal', 34, 'Center', '11', 8473533, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (550, 'Sebastian Aho', 25, 'Center', '20', 8478427, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (553, 'Samuel Huo', 21, 'Center', NULL, 8483857, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (554, 'Jake Bean', 24, 'Defenseman', '22', 8479402, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (555, 'Sergei Ivanov', 18, 'Goalie', NULL, 8483738, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (558, 'Martin Rysavy', 19, 'Right Wing', NULL, 8482926, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (559, 'Sean Kuraly', 29, 'Center', '7', 8476374, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (560, 'Ben Boyd', 19, 'Left Wing', '56', 8482885, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (561, 'Patrik Hamrla', 19, 'Goalie', '39', 8482921, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (562, 'Bryce Montgomery', 19, 'Defenseman', '58', 8482888, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (563, 'Blake Murray', 21, 'Center', '85', 8481677, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (564, 'Jacob Kucharski', 23, 'Goalie', '40', 8481050, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (566, 'Kent Johnson', 19, 'Center', '13', 8482660, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (567, 'Cade Webber', 21, 'Defenseman', '68', 8481570, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (569, 'Calvin de Haan', 31, 'Defenseman', '44', 8475177, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (570, 'Kirill Slepets', 23, 'Right Wing', NULL, 8481724, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (571, 'Domenick Fensore', 21, 'Defenseman', '89', 8481562, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (572, 'Nikita Quapp', 19, 'Goalie', NULL, 8482895, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (573, 'Adam Boqvist', 22, 'Defenseman', '27', 8480871, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (574, 'Marcus Bjork', 24, 'Defenseman', NULL, 8483620, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (576, 'Yegor Naumov', 19, 'Goalie', NULL, 8482899, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (577, 'Evan Vierling', 20, 'Center', '38', 8482152, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (578, 'Denton Mateychuk', 18, 'Defenseman', NULL, 8483485, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (579, 'Lane Pederson', 25, 'Center', '18', 8478967, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (581, 'Brett Pesce', 27, 'Defenseman', '22', 8477488, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (580, 'Jesper Fast', 30, 'Right Wing', '71', 8475855, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (582, 'Boone Jenner', 29, 'Center', '38', 8476432, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (583, 'Cole Sillinger', 19, 'Center', '34', 8482705, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (584, 'Jack Roslovic', 25, 'Center', '96', 8478458, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (585, 'Gleb Trikozov', 18, 'Left Wing', NULL, 8483519, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (586, 'Anttoni Honka', 22, 'Defenseman', '84', 8481615, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (587, 'Justin Danforth', 29, 'Right Wing', '17', 8479941, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (588, 'Ethan Bear', 25, 'Defenseman', '25', 8478451, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (589, 'Jalen Chatfield', 26, 'Defenseman', '64', 8478970, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (2428, 'Victor Rask', NULL, 'Center', '49', 8476437, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (478, 'Kevin Wall', 22, 'Right Wing', '62', 8481756, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (2299, 'Owen Sillinger', NULL, 'Center', NULL, 8483538, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (479, 'Frederik Andersen', 33, 'Goalie', '31', 8475883, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (481, 'Maxime Lajoie', 24, 'Defenseman', '42', 8479320, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (484, 'Malte Stromwall', 28, 'Right Wing', NULL, 8479440, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (486, 'Ronan Seeley', 20, 'Defenseman', '82', 8482187, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (487, 'Gustav Nyquist', 33, 'Center', '14', 8474679, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (488, 'Elvis Merzlikins', 28, 'Goalie', '90', 8478007, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (489, 'Johnny Gaudreau', 29, 'Left Wing', '13', 8476346, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (492, 'Jakub Voracek', 33, 'Right Wing', '93', 8474161, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (494, 'Vladislav Gavrikov', 26, 'Defenseman', '44', 8478882, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (495, 'Ole Julian Bjorgvik-Holm', 20, 'Defenseman', '94', 8482453, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (496, 'Massimo Rizzo', 21, 'Center', NULL, 8481760, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (497, 'Alexander Pashin', 20, 'Right Wing', NULL, 8482212, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (498, 'Andrei Svechnikov', 22, 'Right Wing', '37', 8480830, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (500, 'Carson Meyer', 25, 'Right Wing', '55', 8480292, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (499, 'Martin Necas', 23, 'Center', '88', 8480039, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (503, 'Brady Skjei', 28, 'Defenseman', '76', 8476869, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (505, 'Brendan Gaunce', 28, 'Center', '23', 8476867, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (506, 'Emil Bemstrom', 23, 'Center', '52', 8480205, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (507, 'James Fisher', 18, 'Right Wing', NULL, 8483715, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (508, 'Eric Hjorth', 21, 'Defenseman', '45', 8481659, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (509, 'Stefan Noesen', 29, 'Right Wing', '29', 8476474, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (510, 'Luca Del Bel Belluz', 18, 'Center', NULL, 8483432, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (512, 'Simon Forsmark', 18, 'Defenseman', NULL, 8483674, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (516, 'Ondrej Kase', 26, 'Right Wing', '25', 8478131, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (517, 'Jet Greaves', 21, 'Goalie', NULL, 8482982, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (519, 'Alexander Pelevin', 18, 'Defenseman', NULL, 8483713, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (520, 'Josh Dunne', 23, 'Center', '21', 8482623, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (526, 'Stelio Mattheos', 23, 'Right Wing', '49', 8479989, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (528, 'Ville Koivunen', 19, 'Left Wing', NULL, 8482758, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (530, 'Joel Nystrom', 20, 'Defenseman', NULL, 8482911, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (538, 'William Lagesson', 26, 'Defenseman', '84', 8478021, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (544, 'Jake Christiansen', 23, 'Defenseman', '32', 8481161, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (545, 'Daniil Tarasov', 23, 'Goalie', '40', 8480193, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (551, 'Dylan Coghlan', 24, 'Defenseman', '52', 8479639, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (513, 'Alexander Nikishin', 21, 'Defenseman', NULL, 8482100, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (540, 'Jordan Dumais', 18, 'Right Wing', NULL, 8483688, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (552, 'Jordan Martinook', 30, 'Left Wing', '48', 8476921, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (556, 'Andrew Peeke', 24, 'Defenseman', '2', 8479369, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (557, 'Dmitri Voronkov', 22, 'Left Wing', NULL, 8481716, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (568, 'Nolan Lalonde', 18, 'Goalie', NULL, 8483869, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (485, 'Samuel Knazko', 20, 'Defenseman', NULL, 8482448, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (2322, 'Griffin Mendel', NULL, 'Defenseman', NULL, 8483560, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (480, 'Max Pacioretty', 33, 'Left Wing', '67', 8474157, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (2345, 'Derek Stepan', NULL, 'Center', '18', 8474613, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (565, 'Tyler Angle', 22, 'Center', '39', 8481690, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (590, 'Patrik Puistola', 21, 'Right Wing', '32', 8481574, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (593, 'Scott Morrow', 19, 'Defenseman', NULL, 8482666, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (596, 'Cruz Lucius', 18, 'Right Wing', NULL, 8483479, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (599, 'Jamieson Rees', 21, 'Center', '81', 8481579, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (602, 'Tim Berni', 22, 'Defenseman', '75', 8481072, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (605, 'Gavin Bayreuther', 28, 'Defenseman', '5', 8479945, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (608, 'Zach Sawchenko', 24, 'Goalie', '36', 8479313, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (611, 'Kirill Marchenko', 22, 'Right Wing', NULL, 8480893, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (614, 'Corson Ceulemans', 19, 'Defenseman', NULL, 8482678, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (591, 'Justin Robidas', 19, 'Center', '46', 8482785, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (594, 'Tuukka Tieksola', 21, 'Right Wing', NULL, 8481697, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (597, 'Jakub Vondras', 18, 'Goalie', NULL, 8483754, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (600, 'Brent Burns', 37, 'Defenseman', '88', 8470613, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (603, 'Aidan Hreschuk', 19, 'Defenseman', NULL, 8482680, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (606, 'Ryan Dzingel', 30, 'Center', '14', 8476288, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (609, 'Cavan Fitzgerald', 26, 'Defenseman', '79', 8478981, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (612, 'Billy Sweezey', 26, 'Defenseman', NULL, 8482399, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (615, 'Stanislav Svozil', 19, 'Defenseman', '81', 8482711, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (477, 'Guillaume Richard', 19, 'Defenseman', NULL, 8482692, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (476, 'Mikael Pyyhtia', 20, 'Left Wing', NULL, 8482451, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (482, 'Dominik Bokk', 22, 'Right Wing', '36', 8480827, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (483, 'Vladimir Grudinin', 18, 'Defenseman', NULL, 8483773, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (491, 'Jesperi Kotkaniemi', 22, 'Center', '82', 8480829, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (493, 'Jack Drury', 22, 'Center', '72', 8480835, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (502, 'Mackenzie MacEachern', 28, 'Left Wing', '28', 8476907, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (504, 'Patrik Laine', 24, 'Left Wing', '29', 8479339, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (524, 'Joonas Korpisalo', 28, 'Goalie', '70', 8476914, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (548, 'Jackson Blake', 19, 'Right Wing', NULL, 8482809, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (575, 'Alexander Perevalov', 18, 'Left Wing', NULL, 8483501, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (592, 'Eric Robinson', 27, 'Left Wing', '50', 8480762, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (595, 'Ryan Suzuki', 21, 'Center', '61', 8481576, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (598, 'Pyotr Kochetkov', 23, 'Goalie', '52', 8481611, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (601, 'Paul Stastny', 36, 'Center', '25', 8471669, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (604, 'Jaccob Slavin', 28, 'Defenseman', '74', 8476958, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (607, 'Pavel Cajan', 19, 'Goalie', NULL, 8483805, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (610, 'Mathieu Olivier', 25, 'Right Wing', NULL, 8479671, NULL);
INSERT INTO "coding_challenge"."player" ("id", "name", "age", "position", "number", "player_identifier", "team_id") VALUES (613, 'Zach Werenski', 25, 'Defenseman', '8', 8478460, NULL);
COMMIT;

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS "coding_challenge"."team";
CREATE TABLE "coding_challenge"."team" (
  "id" int4 NOT NULL DEFAULT nextval('"coding_challenge".team_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "team_identifier" int4 NOT NULL
)
;
ALTER TABLE "coding_challenge"."team" OWNER TO "eletype";

-- ----------------------------
-- Records of team
-- ----------------------------
BEGIN;
INSERT INTO "coding_challenge"."team" ("id", "name", "team_identifier") VALUES (9, 'Columbus Blue Jackets', 29);
INSERT INTO "coding_challenge"."team" ("id", "name", "team_identifier") VALUES (8, 'Carolina Hurricanes', 12);
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "coding_challenge"."game_id_seq"
OWNED BY "coding_challenge"."game"."id";
SELECT setval('"coding_challenge"."game_id_seq"', 114, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "coding_challenge"."player_id_seq"
OWNED BY "coding_challenge"."player"."id";
SELECT setval('"coding_challenge"."player_id_seq"', 3591, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "coding_challenge"."team_id_seq"
OWNED BY "coding_challenge"."team"."id";
SELECT setval('"coding_challenge"."team_id_seq"', 73, true);

-- ----------------------------
-- Primary Key structure for table game
-- ----------------------------
ALTER TABLE "coding_challenge"."game" ADD CONSTRAINT "game_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table player
-- ----------------------------
ALTER TABLE "coding_challenge"."player" ADD CONSTRAINT "unique_external_id" UNIQUE ("player_identifier");

-- ----------------------------
-- Primary Key structure for table player
-- ----------------------------
ALTER TABLE "coding_challenge"."player" ADD CONSTRAINT "player_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table team
-- ----------------------------
ALTER TABLE "coding_challenge"."team" ADD CONSTRAINT "unique_team_external_id" UNIQUE ("team_identifier");

-- ----------------------------
-- Primary Key structure for table team
-- ----------------------------
ALTER TABLE "coding_challenge"."team" ADD CONSTRAINT "team_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table game
-- ----------------------------
ALTER TABLE "coding_challenge"."game" ADD CONSTRAINT "player_id" FOREIGN KEY ("player_id") REFERENCES "coding_challenge"."player" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
