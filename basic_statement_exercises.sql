 SHOW DATABASES;
 USE albums_db;
 SELECT DATABASE();
 
-- 2. What is the primary key for the albums table?
-- id 

-- 3. What does the column named 'name' represent?
-- name or title of each album

-- 4. What do you think the sales column represents?
-- total sales amount

-- 5. Find the name of all albums by Pink Floyd.

SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released?NS
SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
 
 -- 7. What is the genre for the album Nevermind?
SELECT genre
FROM albums
WHERE name = 'Nevermind';

-- 8. Which albums were released in the 1990s?
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 and 2000;

-- 9. Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name AS low_selling_albums
FROM albums
WHERE sales < 20000000;





