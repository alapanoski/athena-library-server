DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE;

DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS writes CASCADE;
DROP TABLE IF EXISTS publishes CASCADE;
DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS issues CASCADE;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE authors
(
    author_id uuid DEFAULT uuid_generate_v4(),
    name      VARCHAR(64) NOT NULL,

    PRIMARY KEY (author_id)
);

CREATE TABLE books
(
    book_id     uuid    DEFAULT uuid_generate_v4(),
    title       varchar(128) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (book_id)
);

CREATE TABLE publishers
(
    publisher_id uuid DEFAULT uuid_generate_v4(),
    name         varchar(64) NOT NULL,

    PRIMARY KEY (publisher_id)
);

CREATE TABLE writes
(
    fk_author_id uuid NOT NULL,
    fk_book_id   uuid NOT NULL,

    FOREIGN KEY (fk_author_id) REFERENCES authors (author_id),
    FOREIGN KEY (fk_book_id) REFERENCES books (book_id)
)

CREATE TABLE publishes
(
    fk_publisher_id uuid NOT NULL,
    fk_book_id      uuid NOT NULL,

    FOREIGN KEY (fk_publisher_id) REFERENCES publishers (publisher_id),
    FOREIGN KEY (fk_book_id) REFERENCES books (book_id)
);

CREATE TABLE members
(
    member_id  uuid DEFAULT uuid_generate_v4(),
    first_name VARCHAR(32) NOT NULL,
    last_name  VARCHAR(32) NOT NULL,
    issue_limit INT NOT NULL,
    number_of_books_issued INT DEFAULT 0,

    PRIMARY KEY (member_id)
);

CREATE TABLE issues
(
    fk_user_id uuid NOT NULL,
    fk_book_id uuid NOT NULL,

    FOREIGN KEY (fk_user_id) REFERENCES members (member_id),
    FOREIGN KEY (fk_book_id) REFERENCES books (book_id)
);
