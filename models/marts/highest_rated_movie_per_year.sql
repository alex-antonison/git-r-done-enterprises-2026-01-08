SELECT
    release_year,
    title,
    rotten_tomatoes_rating
FROM (
    SELECT
        release_year,
        title,
        rotten_tomatoes_rating
        rank() over (partition by release_year order by rotten_tomatoes_rating desc) as rnk
    FROM {{ ref('stg_movies') }}
) t
where rnk = 1
    