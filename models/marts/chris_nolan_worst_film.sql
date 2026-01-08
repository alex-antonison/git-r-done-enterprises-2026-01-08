SELECT
    release_year,
    title,
    director,
    imdb_rating,
    mpaa_rating,
    major_genres,
    worldwide_gross
FROM {{ ref('stg_movies') }}
where director ='Christopher Nolan'
order by imdb_rating asc