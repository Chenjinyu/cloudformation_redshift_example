CREATE SCHEMA cjy;

CREATE TABLE cjy.title(
  titleId VARCHAR (20),
  ordering BIGINT,
  title VARCHAR (5000),
  region VARCHAR (100),
  language VARCHAR (500),
  types VARCHAR (5000),
  attributes VARCHAR (5000),
  isOriginalTitle BOOLEAN
);

CREATE TABLE cjy.title_basics(
  tconst VARCHAR (20),
  titleType VARCHAR (100),
  primaryTitle VARCHAR (5000),
  originalTitle VARCHAR (5000),
  isAdult BOOLEAN,
  startYear VARCHAR(4),
  endYear VARCHAR(40),
  runTimeMinutes BIGINT,
  genres VARCHAR(5000)
)

CREATE TABLE cjy.name_basics(
  nconst VARCHAR (20),
  primaryName VARCHAR (200),
  birthYear VARCHAR (4),
  deathYear VARCHAR (4),
  primaryProfession VARCHAR (5000),
  knownForTitles VARCHAR (5000)
)

