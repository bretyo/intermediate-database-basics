---------------- PRACTICE JOINS----------------------------------------------------------------

-- SELECT * FROM invoice i
-- JOIN invoice_line il ON i.invoice_id = il.invoice_id
-- WHERE unit_price > .99;

-- SELECT i.invoice_date, c.first_name, c.last_name, i.total 
-- FROM invoice i
-- JOIN customer c ON i.customer_id = c.customer_id;

-- SELECT c.first_name, c.last_name, e.first_name, e.last_name
-- FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id;

-- SELECT al.title, ar.name FROM album al
-- JOIN artist ar ON al.artist_id = ar.artist_id;

-- SELECT pt.track_id FROM playlist_track pt
-- JOIN playlist p ON pt.playlist_id = p.playlist_id
-- WHERE p.name = 'Music';

-- SELECT t.name FROM track t
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- WHERE pt.playlist_id = 5;

-- SELECT t.name, p.name FROM track t
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;

-- SELECT t.name, a.title FROM track t
-- JOIN album a ON t.album_id = a.album_id
-- JOIN genre g ON t.genre_id = g.genre_id
-- WHERE g.name = 'Alternative & Punk';


---------------- PRACTICE NESTED QUERIES----------------------------------------------------------------

-- SELECT * FROM invoice
-- WHERE invoice_id IN (
-- 	SELECT invoice_id FROM invoice_line
--   WHERE unit_price > .99
-- );

-- SELECT * FROM playlist_track
-- WHERE playlist_id IN (
-- 	SELECT playlist_id FROM playlist
--   WHERE name = 'Music'
-- );

-- SELECT name FROM track
-- WHERE track_id IN(
-- 		SELECT track_id FROM playlist_track
--   	WHERE playlist_id=5
-- );

-- SELECT * FROM track
-- WHERE genre_id IN(
-- 	SELECT genre_id FROM genre
--   WHERE name='Comedy'
-- );

-- SELECT * FROM track
-- WHERE album_id IN (
-- 	SELECT album_id FROM album
--   WHERE title = 'Fireball'
-- );

-- SELECT * FROM track 
-- WHERE album_id IN (
-- 	SELECT album_id FROM album
--   WHERE artist_id IN(
--   	SELECT artist_id FROM artist
--     WHERE name='Queen'
--   )
-- );

---------------- PRACTICE UPDATING ROWS----------------------------------------------------------------