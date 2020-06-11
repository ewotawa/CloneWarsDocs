-- history of rolling screen

DROP TABLE dbo.hashtags

CREATE TABLE dbo.hashtags
(
    ID int IDENTITY(1, 1) NOT NULL,
    SystemTimeStamp nvarchar(400),
    Sentiment nvarchar(100),
    SentimentCount int,
    SentimentScore float,
    AhsokaTano int,
    AnakinSkywalker int,
    BoKatan int,
    Maul int,
    ObiWanKenobi int,
    CaptainRex int,
    BabyYoda int,
    SiegeOfMandalore int,
    StarWars int,
    CloneWars int,
    TheMandalorian int,
    AhsokaLives int,
    Jedi int,
    Sith int,
    MayThe4th int
)
GO

CREATE CLUSTERED INDEX IX_emp_ID ON dbo.hashtags (ID);

-- all tweets into storage container

DROP TABLE dbo.tweets;

CREATE TABLE dbo.tweets
(
    SQL_ID int IDENTITY(1, 1) NOT NULL,
    created_at text,
    --id bigint,
    id_str text,
    text text,
    --display_text_range varbinary,
    source text,
    truncated int,
    --in_reply_to_status_id int,
    --in_reply_to_status_id_str nvarchar,
    --in_reply_to_user_id int,
    --in_reply_to_user_id_str nvarchar,
    --in_reply_to_screen_name nvarchar,
    --user_id int,
    --user-id_str nvarchar,
    --user_name nvarchar,
    --user_screen_name nvarchar,
    --user_location nvarchar,
    --user_url nvarchar,
    --user_url_string nvarchar,
    --user_description nvarchar,
    --user_translator_type nvarchar,
    --user_protected int,
    --user_verified int,
    --user_followers_count int
    --user_friends_count int,
    --user_listed_count int,
    --user_favourites_count int
    --user_statuses_count int,
    --user_created_at nvarchar,
    --user_utc_offset nvarchar,
    --user_time_zone nvarchar,
    --user_geo_enabled int,
    --user_lang nvarchar
    --user_contributors_enabled int
    --user_is_translator int
    --user_profile_background_color nvarchar
    --user_profile_background_image_url nvarchar,
    --user_profile_background_image_url_https nvarchar,
    --user_profile_background_tile int,
    --user_profile_link_color nvarchar,
    --user_profile_sidebar_border_color nvarchar,
    --user_profile_sidebar_fill_color nvarchar,
    --user_profile_text_color nvarchar,
    --user_profile_use_background_image int,
    --user_profile_image_url nvarchar,
    --user_profile_image_url_https nvarchar,
    --user_profile_banner_url nvarchar,
    --user_default_profile int,
    --user_default_profile_image int,
    --user_following nvarchar,
    --user_follow_request_sent nvarchar,
    --user_notifications nvarchar,
    geo text,
    coordinates text,
    place text,
    contributors text,
    is_quote_status int,
    quote_count int,
    reply_count int,
    retweet_count int,
    favorite_count int,
    entities_hashtags_text text,
    entities_hashtags_indices text,
    entities_urls text,
    --entities_user_mentions varbinary,
    entities_symbols text,
    --entities_media_id int,
    --entities_media_id_str nvarchar,
    --entities_media_indices varbinary,
    --entities_media_media_url nvarchar,
    --entities_media_media_url_https nvarchar,
    --entities_media_url nvarchar,
    --entities_media_display_url nvarchar,
    --entities_media_expanded_url nvarchar,
    --entities_media_type nvarchar,
    --entities_media_sizes_medium_w int,
    --entities_media_sizes_medium_h int,
    --entities_media_sizes_medium_resize nvarchar,
    --entities_media_sizes_large_w int,
    --entities_media_sizes_large_h int,
    --entities_media_sizes_large_resize nvarchar,
    --entities_media_sizes_thumb_w int,
    --entities_media_sizes_thumb_h int,
    --entities_media_sizes_thumb_resize nvarchar,
    --entities_media_sizes_small_w int,
    --entities_media_sizes_small_h int,
    --entities_media_sizes_small_resize nvarchar,
    --extended_entities_media_id int,
    --extended_entities_media_id_str nvarchar,
    --extended_entities_media_indices varbinary,
    --extended_entities_media_media_url nvarchar,
    --extended_entities_media_media_url_https nvarchar,
    --extended_entities_media_url nvarchar,
    --extended_entities_media_display_url nvarchar,
    --extended_entities_media_expanded_url nvarchar,
    --extended_entities_media_type nvarchar,
    --extended_entities_media_sizes_medium_w int,
    --extended_entities_media_sizes_medium_h int,
    --extended_entities_media_sizes_medium_resize nvarchar,
    --extended_entities_media_sizes_large+w int,
    --extended_entities_media_sizes_large_h int,
    --extended_entities_media_sizes_large_resize nvarchar,
    --extended_entities_media_sizes_thumb_w int,
    --extended_entities_media_sizes_thumb_h int,
    --extended_entities_media_sizes_thumb_resize nvarchar,
    --extended_entities_media_sizes_small_w int,
    --extended_entities_media_sizes_small_h int,
    --extended_entities_media_sizes_small_resize nvarchar,
    favorited int,
    retweeted int,
    possibly_sensitive int,
    filter_level text,
    lang text,
    timestamp_ms text,
    EventProcessedUtcTime text,
    PartitionId int,
    EventEnqueuedUtcTime text, 
    --quoted_status_id int,
    --quoted_status_id_str nvarchar
)
GO

CREATE CLUSTERED INDEX IX_emp_ID ON dbo.tweets (SQL_ID);





--sentiment analysis to blob storage

DROP TABLE dbo.tweetsentiment;

CREATE TABLE dbo.tweetsentiment
(
    ID int IDENTITY(1,1) NOT NULL,
    text text,
    Sentiment text,
    Score float
)

GO

CREATE CLUSTERED INDEX IX_emp_ID ON dbo.tweetsentiment (ID);
