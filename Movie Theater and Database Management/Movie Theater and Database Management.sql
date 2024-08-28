
-- Select the title of all movies.
select title from movies;

-- Show all the distinct ratings in the database.
select distinct rating from movies;

-- Show all unrated movies.
select * from movies where rating is null;

-- Select all movie theaters that are not currently showing a movie.
select * from [MovieTheaters] where movie is null;

-- Select all data from all movie theaters 
-- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
select * from MovieTheaters left join movies
on MovieTheaters.code=movies.code;

-- Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select * from MovieTheaters right join movies  
ON movies.code=MovieTheaters.code;

-- Show the titles of movies not currently being shown in any theaters.
 SELECT Movies.Title
   FROM MovieTheaters RIGHT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code
   WHERE MovieTheaters.Movie IS NULL;

   -- Add the unrated movie "One, Two, Three".
INSERT INTO Movies(Title,Rating) VALUES('One, Two, Three',NULL);

-- Set the rating of all unrated movies to "G".
UPDATE Movies
SET Rating = 'G'
WHERE Rating is NULL;

-- Remove movie theaters projecting movies rated "NC-17".
delete from MovieTheaters 
where Movie in (
select Code from Movies where Rating = 'NC-17'
);