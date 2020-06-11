-- Gather streaming data

WITH HashTag AS (  
    SELECT 
        text, 
        sentiment1(text) as result,
        CASE WHEN CHARINDEX('AhsokaTano', text) <> 0 THEN 1 ELSE 0 END AS AhsokaTano,
        CASE WHEN CHARINDEX('AnakinSkywalker', text) <> 0 THEN 1 ELSE 0 END AS AnakinSkywalker,
        CASE WHEN CHARINDEX('ObiWanKenobi', text) <> 0 THEN 1 ELSE 0 END AS ObiWanKenobi,
        CASE WHEN CHARINDEX('BoKatan', text) <> 0 THEN 1 ELSE 0 END AS BoKatan,
        CASE WHEN CHARINDEX('CaptainRex', text) <> 0 THEN 1 ELSE 0 END AS CaptainRex,
        CASE WHEN CHARINDEX('BabyYoda', text) <> 0 THEN 1 ELSE 0 END AS BabyYoda,
        CASE WHEN CHARINDEX('Maul', text) <> 0 THEN 1 ELSE 0 END AS Maul,
        CASE WHEN CHARINDEX('SiegeOfMandalore', text) <> 0 THEN 1 ELSE 0 END AS SiegeOfMandalore,
        CASE WHEN CHARINDEX('StarWars', text) <> 0 THEN 1 ELSE 0 END AS StarWars,
        CASE WHEN CHARINDEX('CloneWars', text) <> 0 THEN 1 ELSE 0 END AS CloneWars,
        CASE WHEN CHARINDEX('TheMandalorian', text) <> 0 THEN 1 ELSE 0 END AS TheMandalorian,
        CASE WHEN CHARINDEX('AhsokaLives', text) <> 0 THEN 1 ELSE 0 END AS AhsokaLives,
        CASE WHEN CHARINDEX('Jedi', text) <> 0 THEN 1 ELSE 0 END AS Jedi,
        CASE WHEN CHARINDEX('Sith', text) <> 0 THEN 1 ELSE 0 END AS Sith,
        CASE WHEN CHARINDEX('MayThe4th', text) <> 0 THEN 1 ELSE 0 END AS MayThe4th
    FROM TwitterStream  )  

-- send hashtag results to blob storage

SELECT
    System.TimeStamp as SystemTimeStamp,
    result.[Sentiment],
    COUNT(result.[Sentiment]) SentimentCount,
    AVG(result.[Score]) AS SentimentScore,
    SUM(AhsokaTano) AS AhsokaTano,
    SUM(AnakinSkywalker) AS AnakinSkywzalker,
    SUM(BoKatan) AS BoKatan,
    SUM(Maul) AS Maul,
    SUM(ObiWanKenobi) AS ObiWanKenobi,
    SUM(CaptainRex) AS CaptainRex,
    SUM(BabyYoda) AS BabyYoda,
    SUM(SiegeOfMandalore) AS SiegeOfMandalore,
    SUM(StarWars) AS StarWars,
    SUM(CloneWars) AS CloneWars,
    SUM(TheMandalorian) AS TheMandalorian,
    SUM(AhsokaLives) AS AhsokaLives,
    SUM(Jedi) AS Jedi,
    SUM(Sith) AS Sith,
    SUM(MayThe4th) AS MayThe4th
INTO [TwitterStream-Characters]
FROM HashTag
GROUP BY TumblingWindow(minute, 1), result.[Sentiment];


-- send to PowerBI

SELECT
    System.TimeStamp as SystemTimeStamp,
    result.[Sentiment],
    COUNT(result.[Sentiment]) SentimentCount,
    AVG(result.[Score]) AS SentimentScore,
    SUM(AhsokaTano) AS AhsokaTano,
    SUM(AnakinSkywalker) AS AnakinSkywalker,
    SUM(BoKatan) AS BoKatan,
    SUM(Maul) AS Maul,
    SUM(ObiWanKenobi) AS ObiWanKenobi,
    SUM(CaptainRex) AS CaptainRex,
    SUM(BabyYoda) AS BabyYoda,
    SUM(SiegeOfMandalore) AS SiegeOfMandalore,
    SUM(StarWars) AS StarWars,
    SUM(CloneWars) AS CloneWars,
    SUM(TheMandalorian) AS TheMandalorian,
    SUM(AhsokaLives) AS AhsokaLives,
    SUM(Jedi) AS Jedi,
    SUM(Sith) AS Sith,
    SUM(MayThe4th) AS MayThe4th
INTO [TwitterStream-PowerBI]
FROM HashTag
GROUP BY TumblingWindow(minute, 1), result.[Sentiment];


-- all tweets into storage container

SELECT * INTO [TwitterStream-Output] FROM TwitterStream;


--sentiment analysis to blob storage

SELECT text, result.[Sentiment], result.[Score] INTO [TwitterStream-Sentiment] FROM Hashtag;

