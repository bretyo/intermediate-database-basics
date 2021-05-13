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

---------- BLACK DIAMOND --------------

-- SELECT t.name, g.name, al.title, ar.name FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- JOIN album al ON t.album_id = al.album_id
-- JOIN artist ar ON al.artist_id = ar.artist_id
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id
-- WHERE p.name = 'Music';


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

-- UPDATE customer
-- SET fax=null
-- WHERE fax IS NOT null;

-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS null;

-- UPDATE customer
-- SET last_name='Thompson'
-- WHERE last_name='Barnett';

-- UPDATE customer
-- SET support_rep_id=4
-- WHERE email = 'luisrojas@yahoo.cl';

-- UPDATE track
-- SET composer='The darkness around us'
-- WHERE genre_id IN(
-- 	SELECT genre_id FROM genre
--   WHERE name = 'Metal'
-- );


---------------- GROUP BY ----------------------------------------------------------------

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g on t.genre_id = g.genre_id
-- WHERE g.name='Pop' OR g.name='Rock'
-- GROUP BY g.name;

-- SELECT COUNT(*), a.name
-- FROM album al
-- JOIN artist a ON al.artist_id = a.artist_id
-- GROUP BY a.name;

---------------- USE DISTINCT ----------------------------------------------------------------

-- SELECT DISTINCT composer FROM track;

-- SELECT DISTINCT billing_postal_code
-- FROM invoice;

-- SELECT DISTINCT company FROM customer;

---------------- DELETE ROWS ----------------------------------------------------------------

-- DELETE FROM practice_delete
-- WHERE type='bronze';

-- DELETE FROM practice_delete
-- WHERE type='silver';

-- DELETE FROM practice_delete
-- WHERE value=150;

---------------- E COMMERCE ----------------------------------------------------------------

-- CREATE TABLE users(
-- 	user_id SERIAL PRIMARY KEY,
--   user_name VARCHAR(40),
--   email VARCHAR(100)
-- );

-- CREATE TABLE products(
-- 	product_id SERIAL PRIMARY KEY,
--   product_name VARCHAR(60),
--   price INT
-- );

-- CREATE TABLE orders(
-- 	order_id SERIAL PRIMARY KEY,
--   product_id INT REFERENCES products(product_id)
-- );

-- INSERT INTO users
-- (user_name, email)
-- VALUES
-- ('Bob', 'bobmail'),
-- ('rob', 'robmail'),
-- ('job', 'jobmail');

-- INSERT INTO products
-- (product_name, price)
-- VALUES
-- ('shoes', 300),
-- ('burger', 25),
-- ('car', 100000);

-- INSERT INTO orders
-- (product_id)
-- VALUES
-- (1),
-- (2),
-- (3);


-- SELECT p.product_id, p.product_name FROM orders o
-- JOIN products p ON o.product_id = p.product_id
-- WHERE	o.order_id= 1;

-- SELECT * FROM orders;

-- SELECT SUM(p.price) FROM orders o
-- JOIN products p ON o.product_id = p.product_id
-- WHERE o.product_id = 1;

-- ALTER TABLE orders
-- ADD COLUMN user_id INT REFERENCES users(user_id);

-- UPDATE orders
-- SET user_id = 2;

-- SELECT * FROM orders
-- WHERE user_id = 1;

-- SELECT COUNT(*) FROM orders
-- WHERE user_id=1;

---------------- BLACK DIAMOND ---------------

-- SELECT COUNT(*), u.user_name 
-- FROM orders o
-- JOIN users u ON o.user_id = u.user_id
-- GROUP BY u.user_name;