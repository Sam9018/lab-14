CREATE TABLE bookshelves (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- creates a new table called bookshelves --

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
-- this allows you to copy data in between 2 tables --

ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- connects books in the two seperate tables --

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- prepares a connection between 2 tables --

ALTER TABLE books DROP COLUMN bookshelf;
-- this is used to remove a certian collum in your table --

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
-- Sets the foreign key in the second table liked to the primary key --