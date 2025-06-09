
CREATE TABLE books (
    id SERIAL PRIMARY KEY,  
    title VARCHAR(255) NOT NULL, 
    author VARCHAR(100) NOT NULL,  
    publication_year INTEGER NOT NULL,
    isbn VARCHAR(25) UNIQUE NOT NULL 
);


CREATE INDEX idx_books_title ON books (title);


CREATE OR REPLACE PROCEDURE count_books_by_year(
    IN p_year INTEGER,
    OUT p_count INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COUNT(*) INTO p_count
    FROM books
    WHERE publication_year = p_year;
END;
$$;