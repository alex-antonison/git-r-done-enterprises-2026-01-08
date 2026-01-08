-- Highest grossing genre per year
with yearly_genre_grossing as(
select
        release_year
        , major_genres
        , sum(worldwide_gross) as worldwide_gross
        row_number over(partition by release_year, major_genres order by worldwide_gross desc) as rn
from {{ ref('stg_movies') }}
GROUP BY release_year, major_genres
order by worldwide_gross
)

select
    release_year
    , major_genres
    , worldwide_gross
from yearly_genre_grossing
where rn=1

