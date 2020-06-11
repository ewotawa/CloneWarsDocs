-- when creating procedures, need to select and run individually. Needs to be the only process in the batch. Hence the squiggly underlines in the second and third statements.

CREATE PROCEDURE truncate_hashtags
AS
TRUNCATE TABLE dbo.hashtags;

CREATE PROCEDURE truncate_tweets
AS
TRUNCATE TABLE dbo.tweets;

CREATE PROCEDURE truncate_tweetsentiment
AS
TRUNCATE TABLE dbo.tweetsentiment;