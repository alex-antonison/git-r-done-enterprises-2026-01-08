-- WITH

-- all_releases AS (
--     SELECT
--         release_year,
--         mpaa_rating,
--         major_genres,
--         worldwide_gross
--     FROM {{ ref('stg_movies') }}
-- )

-- SELECT
--     release_year,
--     mpaa_rating,
--     major_genres,
--     sum(worldwide_gross) AS total_worldwide_gross
-- FROM all_releases
-- GROUP BY
--     release_year,
--     mpaa_rating,
--     major_genres


select release_date, release_year, creative_type, title, imdb_rating

FROM {{ ref('stg_movies') }}
qualify row_number() over (partition by creative_type, release_year order by imdb_rating desc)=1
order by release_year asc, creative_type asc