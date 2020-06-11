-- Copy geo data into table

SELECT 
    COUNT(*) AS count
    , CAST([created_at] AS DATE) AS [created_at_date]
    , DATEPART(HOUR, [created_at]) AS [created_at_hour]
    , [country]
INTO
    [dbo].[pbi_tweet_geo]
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

-- Copy lang into table

SELECT
    COUNT(*) AS count 
    , CAST([created_at] AS DATE) AS [created_at_date]
    , DATEPART(HOUR, [created_at]) AS [created_at_hour]
    , [lang]
INTO
    [dbo].[pbi_tweet_lang]
FROM
(
    SELECT 
    [created_at]
    , CONVERT(NVARCHAR(MAX), [lang]) AS [lang]
    FROM [dbo].[vw_tweetgeo]
) AS Sub
WHERE MONTH([created_at]) = 05 AND DAY([created_at]) = 04 AND YEAR([created_at]) = 2020
GROUP BY [created_at], [lang]
;


-- USA table
SELECT
    COUNT(*) AS count
    , CAST([created_at] AS DATE) AS [created_at_date]
    , DATEPART(HOUR, [created_at]) AS [created_at_hour]
    , [country]
    , [country_code]
    , [full_name]
INTO
    [dbo].[pbi_tweet_geo_usa]
FROM
(
    SELECT 
    [created_at]
    , CONVERT(NVARCHAR(MAX), [country]) AS [country]
    , CONVERT(NVARCHAR(MAX), [country_code]) AS [country_code]
    , CONVERT(NVARCHAR(MAX), [full_name]) AS [full_name]
   FROM [dbo].[vw_tweetgeo]
) AS Sub
WHERE MONTH([created_at]) = 05 AND DAY([created_at]) = 04 AND YEAR([created_at]) = 2020 AND [country_code] = 'US'
GROUP BY 
    CAST([created_at] AS DATE)
    , DATEPART(HOUR, [created_at])
    , [country]
    , [country_code]
    , [full_name]
;

--time table
SELECT DISTINCT 
    DATETIMEFROMPARTS(
        DATEPART(YEAR, [created_at_date]) --year
        , DATEPART(MONTH, [created_at_date])--month
        , DATEPART(DAY, [created_at_date]) --day 
        , [created_at_hour]--hours 
        , 0 --minutes
        , 0--seconds
        , 0 --milliseconds
    ) AS [created_at_date_hour]
    , [created_at_date]
    , [created_at_hour]
INTO [dbo].[pbi_date_hour]
FROM [dbo].[pbi_tweet_geo_usa];
