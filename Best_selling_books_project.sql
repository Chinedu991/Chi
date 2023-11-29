UPDATE `data-learning-123.book_performance.best_seller`
SET Author = 'J.K. Rowling'
WHERE Author = 'J. K. Rowling'
## CLEANS THE INCONSISTENCY IN THE AUTHOR NAME CAUSING A DUPLICATE

WITH AuthorStats AS (
  SELECT
    Author,
    MAX(User_Rating) AS Highest_Rated,
    AVG(User_Rating) AS Avg_Rated,
    MIN(User_Rating) AS Lowest_Rated
  FROM `data-learning-123.book_performance.best_seller`
  GROUP BY Author
)
SELECT DISTINCT Author, Highest_Rated, Avg_Rated, Lowest_Rated
FROM AuthorStats
ORDER BY Highest_Rated DESC;
## to find highest rating, we see only 19 authors received a rating higher than 4.8 and 247 authors in the data set

SELECT Author, 
User_Rating
FROM `data-learning-123.book_performance.best_seller`
ORDER BY User_Rating ASC
## to find Author with lowest rated books, J.K. Rowling has the lowest rated book

SELECT
  CORR(Price, User_Rating) AS correlation
FROM
  `data-learning-123.book_performance.best_seller`
  #shows no correlation between user rating and reviews
WITH GenreRatingStats AS (
  SELECT
    Genre,
    MAX(User_Rating) AS Highest_Rated,
    AVG(User_Rating) AS Avg_Rated,
    MIN(User_Rating) AS Lowest_Rated
  FROM `data-learning-123.book_performance.best_seller`
  GROUP BY Genre
  ORDER BY Highest_Rated DESC
)
SELECT
  g.Genre,
  g.Highest_Rated,
  g.Avg_Rated,
  g.Lowest_Rated
FROM
  GenreRatingStats g
ORDER BY
  g.Highest_Rated DESC

  #SHOWS FICTION IS RATED HIGHER ON AVERAGE

WITH Genre_Review_Stats AS (
  SELECT
    Genre,
    MAX(Reviews) AS Highest_Reviews,
    AVG(Reviews) AS Avg_Reviews,
    MIN(Reviews) AS Lowest_Reviews
  FROM `data-learning-123.book_performance.best_seller`
  GROUP BY Genre
  ORDER BY Highest_Reviews DESC
)
SELECT
  g.Genre,
  g.Highest_Reviews,
  g.Avg_Reviews,
  g.Lowest_Reviews
FROM
  Genre_Review_Stats g
ORDER BY
  g.Highest_Reviews DESC

  #SHOWS ON AVERAGE FICTION HAS MORE REVIEWS THAN NON-FICTION

WITH Top_Rated_Fiction_Authors AS (
  SELECT
    DISTINCT Author,
    Genre,
    MAX(User_Rating) AS Highest_Ratings,
    AVG(User_Rating) AS Avg_Ratings,
  FROM `data-learning-123.book_performance.best_seller`
  GROUP BY Author, Genre
  ORDER BY Highest_Ratings DESC
)
SELECT
  g.Author,
  g.Genre,
  g.Highest_Ratings,
  g.Avg_Ratings,
FROM
  Top_Rated_Fiction_Authors g
ORDER BY
  g.Highest_Ratings DESC

  # THERE ARE 13 AUTHORS RATED 4.9 IN FICTION and only 6 Authors rated 4.9 in non-fiction \

SELECT
DISTINCT Author,
Price,
Genre,
User_Rating,
Name
FROM `data-learning-123.book_performance.best_seller` 
WHERE User_Rating > 4.8
ORDER BY Price DESC

#shows the price of each other and title at the highest ratings