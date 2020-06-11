CREATE VIEW [vw_tweetgeo]
AS
SELECT
    [SQL_ID]
    , CONVERT(DATETIME, [created_at_CONCAT]) AS created_at
    , [id_str]
    , [lang]
    , [nplace]
    , SUBSTRING(place_type0, LEN('"place_type":"') + 1, LEN(place_type0) - LEN('"place_type":"') - 2) AS place_type
    , SUBSTRING(name0, LEN('"name":"') + 1, LEN(name0) - LEN('"name":"') - 2) AS name
    , SUBSTRING(full_name0, LEN('"full_name":"') + 1, LEN(full_name0) - LEN('"full_name":"') - 2) AS full_name
    , SUBSTRING(country_code0, LEN('"country_code":"') + 1, LEN(country_code0) - LEN('"country_code":"') - 2) AS country_code
    , SUBSTRING(country0, LEN('"country":"') + 1, LEN(country0) - LEN('"country":"') - 2) AS country
FROM 
(
    SELECT
        [SQL_ID]
        --, CONVERT(DATETIME, [nv_created_at]) AS [dt_created_at]
        , [nv_created_at]
        /* 
        , SUBSTRING([nv_created_at], 5, 3) AS mmm
        , SUBSTRING([nv_created_at], 9, 2) AS dd 
        , RIGHT([nv_created_at], 4) AS yyyy 
        , SUBSTRING([nv_created_at], 12, 2) AS hh 
        , SUBSTRING([nv_created_at], 15, 2) AS mm 
        , SUBSTRING([nv_created_at], 18, 2) AS ss
        */
        , SUBSTRING([nv_created_at], 5, 3) + ' ' + SUBSTRING([nv_created_at], 9, 2) + ' ' + RIGHT([nv_created_at], 4) + ' ' + SUBSTRING([nv_created_at], 12, 2) + ':' + SUBSTRING([nv_created_at], 15, 2) + ':' + SUBSTRING([nv_created_at], 18, 2) AS created_at_concat
        , [id_str]
        , [text]
        , [lang]
        , [nplace]
        /* 
        , CHARINDEX('"place_type":', nplace) AS idx_place_type
        , CHARINDEX('"name":', nplace) AS idx_name
        , CHARINDEX('"full_name":', nplace) AS idx_full_name
        , CHARINDEX('"country_code":', nplace) AS idx_country_code
        , CHARINDEX('"country":', nplace) AS idx_country
        , CHARINDEX('"bounding_box":', nplace) AS idx_bounding_box
        */
        , SUBSTRING(nplace, CHARINDEX('"place_type":', nplace), CHARINDEX('"name":', nplace) - CHARINDEX('"place_type":', nplace)) AS place_type0
        , SUBSTRING(nplace, CHARINDEX('"name":', nplace), CHARINDEX('"full_name":', nplace) - CHARINDEX('"name":', nplace)) AS name0
        , SUBSTRING(nplace, CHARINDEX('"full_name":', nplace), CHARINDEX('"country_code":', nplace) - CHARINDEX('"full_name":', nplace)) AS full_name0
        , SUBSTRING(nplace, CHARINDEX('"country_code":', nplace), CHARINDEX('"country":', nplace) - CHARINDEX('"country_code":', nplace)) AS country_code0
        , SUBSTRING(nplace, CHARINDEX('"country":', nplace), CHARINDEX('"bounding_box":', nplace) - CHARINDEX('"country":', nplace)) AS country0
    FROM
    (
        SELECT [SQL_ID]
            , CONVERT(NVARCHAR(MAX), [created_at]) AS [nv_created_at]
            , [id_str]
            , [text]
            , [lang]
            , CONVERT(NVARCHAR(MAX), [place]) AS nplace
        FROM [dbo].[tweets]
        WHERE [place] IS NOT NULL
    ) AS sub0
) AS sub1
;