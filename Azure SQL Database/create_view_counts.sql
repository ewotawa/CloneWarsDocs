CREATE VIEW [vw_counts]
AS
SELECT
    [created_at] 
    , [created_at_date]
    , [created_at_hour]
    , SUM(AhsokaTano) AS AhsokaTano
    , SUM(AnakinSkywalker) AS AnakinSkywalker
    , SUM(ObiWanKenobi) AS ObiWanKenobi
    , SUM(BoKatan) AS BoKatan
    , SUM(CaptainRex) AS CaptainRex
    , SUM(BabyYoda) AS BabyYoda
    , SUM(Maul) AS Maul
    , SUM(SiegeOfMandalore) AS SiegeOfMandalore
    , SUM(StarWars) AS StarWars
    , SUM(CloneWars) AS CloneWars
    , SUM(TheMandalorian) AS TheMandalorian
    , SUM(AhsokaLives) AS AhsokaLives
    , SUM(Jedi) AS Jedi
    , SUM(Sith) AS Sith
    , SUM(MayThe4th) AS MayThe4th
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
        , AhsokaTano
        , AnakinSkywalker
        , ObiWanKenobi
        , BoKatan
        , CaptainRex
        , BabyYoda
        , Maul
        , SiegeOfMandalore
        , StarWars
        , CloneWars
        , TheMandalorian
        , AhsokaLives
        , Jedi
        , Sith
        , MayThe4th
    FROM 
    (
        SELECT  
        CONVERT(NVARCHAR(MAX), [created_at]) AS nv_created_at
        , CASE WHEN CHARINDEX('AhsokaTano', [text]) <> 0 THEN 1 ELSE 0 END AS AhsokaTano
        , CASE WHEN CHARINDEX('AnakinSkywalker', [text]) <> 0 THEN 1 ELSE 0 END AS AnakinSkywalker
        , CASE WHEN CHARINDEX('ObiWanKenobi', [text]) <> 0 THEN 1 ELSE 0 END AS ObiWanKenobi
        , CASE WHEN CHARINDEX('BoKatan', [text]) <> 0 THEN 1 ELSE 0 END AS BoKatan
        , CASE WHEN CHARINDEX('CaptainRex', [text]) <> 0 THEN 1 ELSE 0 END AS CaptainRex
        , CASE WHEN CHARINDEX('BabyYoda', [text]) <> 0 THEN 1 ELSE 0 END AS BabyYoda
        , CASE WHEN CHARINDEX('DarthMaul', [text]) <> 0 THEN 1 ELSE 0 END AS Maul
        , CASE WHEN CHARINDEX('SiegeOfMandalore', [text]) <> 0 THEN 1 ELSE 0 END AS SiegeOfMandalore
        , CASE WHEN CHARINDEX('StarWars', [text]) <> 0 THEN 1 ELSE 0 END AS StarWars
        , CASE WHEN CHARINDEX('CloneWars', [text]) <> 0 THEN 1 ELSE 0 END AS CloneWars
        , CASE WHEN CHARINDEX('TheMandalorian', [text]) <> 0 THEN 1 ELSE 0 END AS TheMandalorian
        , CASE WHEN CHARINDEX('AhsokaLives', [text]) <> 0 THEN 1 ELSE 0 END AS AhsokaLives
        , CASE WHEN CHARINDEX('Jedi', [text]) <> 0 THEN 1 ELSE 0 END AS Jedi
        , CASE WHEN CHARINDEX('Sith', [text]) <> 0 THEN 1 ELSE 0 END AS Sith
        , CASE WHEN CHARINDEX('MayThe4th', [text]) <> 0 THEN 1 ELSE 0 END AS MayThe4th
    FROM [dbo].[tweets]
    ) AS Sub0
) AS Sub1
GROUP BY [created_at], [created_at_date], [created_at_hour]
;