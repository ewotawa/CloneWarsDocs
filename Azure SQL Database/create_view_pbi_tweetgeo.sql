CREATE VIEW [vw_pbi_tweet_geo]
AS
SELECT 
    COUNT(*) AS count
    , CAST([created_at] AS DATE) AS [created_at_date]
    , DATEPART(HOUR, [created_at]) AS [created_at_hour]
    , [country]
FROM
(
    SELECT 
    [created_at]
    , CONVERT(NVARCHAR(MAX), [country]) AS [country]
    FROM [dbo].[vw_tweetgeo]
) AS Sub
WHERE MONTH([created_at]) = 05 AND DAY([created_at]) = 04 AND YEAR([created_at]) = 2020
GROUP BY [created_at], [country]
;

