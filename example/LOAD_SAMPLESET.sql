INSERT INTO books(title)
VALUES ('Harry Potter and the Philosopher''s Stone'),
       ('Harry Potter and the Chamber of Secrets'),
       ('Harry Potter and the Prisoner of Azkaban'),
       ('Harry Potter and the Goblet of Fire'),
       ('Harry Potter and the Order of Phoenix'),
       ('Harry Potter and the Half-Blood Prince'),
       ('Harry Potter and the Deathly Hallows'),
       ('Harry Potter and the Cursed Child');
INSERT INTO books(title)
VALUES ('Charlie and the Chocolate Factory');

INSERT INTO authors(name)
VALUES ('J. K. Rowling');
INSERT INTO authors(name)
VALUES ('Roald Dahl');

INSERT INTO publishers(name)
VALUES ('Bloomsbury');
INSERT INTO publishers(name)
VALUES ('Scholastic');

INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                          AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Philosopher''s Stone') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                        AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Chamber of Secrets') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                         AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Prisoner of Azkaban') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                    AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Goblet of Fire') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                      AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Order of Phoenix') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                       AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Half-Blood Prince') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                     AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Deathly Hallows') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'J. K. Rowling')                  AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Cursed Child') AS fk_book_id;
INSERT INTO writes(fk_author_id, fk_book_id)
SELECT (SELECT author_id FROM authors WHERE name = 'Roald Dahl')                     AS fk_author_id,
       (SELECT book_id FROM books WHERE title = 'Charlie and the Chocolate Factory') AS fk_book_id;

INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                       AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Philosopher''s Stone') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                     AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Chamber of Secrets') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                      AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Prisoner of Azkaban') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                 AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Goblet of Fire') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                   AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Order of Phoenix') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                    AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Half-Blood Prince') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')                  AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Deathly Hallows') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Bloomsbury')               AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Cursed Child') AS fk_book_id;
INSERT INTO publishes(fk_publisher_id, fk_book_id)
SELECT (SELECT publisher_id FROM publishers WHERE name = 'Scholastic')               AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Charlie and the Chocolate Factory') AS fk_book_id;

INSERT INTO members(first_name, last_name, issue_limit)
VALUES ('John', 'Doe', 2);
INSERT INTO members(first_name, last_name, issue_limit)
VALUES ('Evanna', 'McKinnon', 4);

INSERT INTO issues(fk_user_id, fk_book_id)
SELECT (SELECT member_id FROM members WHERE first_name = 'John' AND last_name = 'Doe')       AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Harry Potter and the Philosopher''s Stone') AS fk_book_id;
UPDATE members
SET number_of_books_issued = number_of_books_issued + 1
WHERE first_name = 'John'
  AND last_name = 'Doe';
UPDATE books
SET is_available= FALSE
WHERE title = 'Harry Potter and the Philosopher''s Stone';

INSERT INTO issues(fk_user_id, fk_book_id)
SELECT (SELECT member_id FROM members WHERE first_name = 'Evanna' AND last_name = 'McKinnon') AS fk_publisher_id,
       (SELECT book_id FROM books WHERE title = 'Charlie and the Chocolate Factory')          AS fk_book_id;
UPDATE members
SET number_of_books_issued = number_of_books_issued + 1
WHERE first_name = 'Evanna'
  AND last_name = 'McKinnon';
UPDATE books
SET is_available= FALSE
WHERE title = 'Charlie and the Chocolate Factory';
