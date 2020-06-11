CREATE VIEW [vw_tweetdata]
AS
SELECT TOP (10)
    [created_at] 
    , [created_at_date]
    , [created_at_hour]
    , SUM([truncated]) AS truncated_sum
    , COUNT([truncated]) AS truncated_count
    , SUM([is_quote_status]) AS is_quote_status_sum
    , COUNT([is_quote_status]) AS is_quote_status_count
    , SUM([quote_count]) AS quote_count_sum
    , COUNT([quote_count]) AS quote_count_count
    , SUM([reply_count]) AS reply_count_sum
    , COUNT([reply_count]) AS reply_count_count
    , SUM([retweet_count]) AS retweet_count_sum
    , COUNT([retweet_count]) AS retweet_count_count
    , SUM([favorite_count]) AS favorite_count_sum
    , COUNT([favorite_count]) AS favorite_count_count
    , SUM([favorited]) AS favorited_sum
    , COUNT([favorited]) AS favorited_count
    , SUM([retweeted]) AS retweeted_sum
    , COUNT([retweeted]) AS retweeted_count
FROM 
(
    SELECT 
        [nv_created_at]
        , CONVERT(
            DATETIME, 
            SUBSTRING([nv_created_at], 5, 3) + ' ' + SUBSTRING([nv_created_at], 9, 2) + ' ' + RIGHT([nv_created_at], 4) + ' ' + SUBSTRING([nv_created_at], 12, 2) + ':' + SUBSTRING([nv_created_at], 15, 2) + ':' + SUBSTRING([nv_created_at], 18, 2)
        ) AS [created_at]
        , CONVERT(
            DATE,
            SUBSTRING([nv_created_at], 5, 3) + ' ' + SUBSTRING([nv_created_at], 9, 2) + ' ' + RIGHT([nv_created_at], 4)
        ) AS [created_at_date]
        , SUBSTRING([nv_created_at], 12, 2) AS [created_at_hour] 
        , [truncated]
        , [is_quote_status]
        , [quote_count]
        , [reply_count]
        , [retweet_count]
        , [favorite_count]
        , [favorited]
        , [retweeted]
    FROM 
    (
        SELECT  
        CONVERT(NVARCHAR(MAX), [created_at]) AS nv_created_at
        ,[truncated]
        ,[is_quote_status]
        ,[quote_count]
        ,[reply_count]
        ,[retweet_count]
        ,[favorite_count]
        ,[favorited]
        ,[retweeted]
    FROM [dbo].[tweets]
    ) AS Sub0
) AS Sub1
GROUP BY [created_at], [created_at_date], [created_at_hour]
;