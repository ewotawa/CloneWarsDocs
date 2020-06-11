CREATE VIEW [vw_pbi_hashtags]
AS
SELECT
    --[ID]
    CONVERT(DATE, [SystemTimeStamp]) AS SystemTimeStampDate
    , DATEPART(HOUR, CONVERT(DATETIME, [SystemTimeStamp])) AS SystemTimeStampHour
    , [Sentiment]
    , SUM([SentimentCount]) AS SentimentCount
    --,[SentimentScore]
    , SUM([AhsokaTano]) AS AhsokaTano
    , SUM([AnakinSkywalker]) AS AnakinSkywalker
    , SUM([BoKatan]) AS BoKatan
    , SUM([Maul]) AS Maul
    , SUM([ObiWanKenobi]) AS ObiWanKenobi
    , SUM([CaptainRex]) AS CaptainRex
    , SUM([BabyYoda]) AS BabyYoda
    , SUM([SiegeOfMandalore]) AS SiegeOfMandalore
    , SUM([StarWars]) AS StarWars
    , SUM([CloneWars]) AS CloneWars
    , SUM([TheMandalorian]) TheMandalorian
    , SUM([AhsokaLives]) AS AhsokaLives
    , SUM([Jedi]) AS Jedi
    , SUM([Sith]) AS Sith
    , SUM([MayThe4th]) AS MayThe4th
FROM [dbo].[hashtags]
WHERE
    [Sentiment] IN ('positive', 'neutral', 'negative')
GROUP BY
    CONVERT(DATE, [SystemTimeStamp])
    , DATEPART(HOUR, CONVERT(DATETIME, [SystemTimeStamp]))
    , [Sentiment]
/*
ORDER BY 
    CONVERT(DATE, [SystemTimeStamp])
    , DATEPART(HOUR, CONVERT(DATETIME, [SystemTimeStamp]))
*/