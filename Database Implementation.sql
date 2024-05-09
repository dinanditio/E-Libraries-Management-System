-- Table: libraries
-- Description: Stores information about libraries. Each library is identified by a unique ID.
CREATE TABLE libraries (
    library_id SERIAL PRIMARY KEY,     -- A unique identifier for each library.
    name VARCHAR(255) NOT NULL,        -- The name of the library.
    location VARCHAR(255) NOT NULL     -- The physical location of the library.
);

-- Table: users
-- Description: Stores information about users of the library system. Each user has a unique ID.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,                -- A unique identifier for each user.
    username VARCHAR(255) NOT NULL UNIQUE,     -- The user's username, which must be unique.
    email VARCHAR(255) NOT NULL UNIQUE,        -- The user's email, which must be unique.
    password_hash CHAR(255) NOT NULL,          -- A hashed version of the user's password.
    registered_on DATE NOT NULL DEFAULT CURRENT_DATE  -- The date the user registered, defaults to the current date.
);

-- Table: books
-- Description: Stores information about books in the library's catalog.
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,         -- A unique identifier for each book.
    title VARCHAR(255) NOT NULL,        -- The title of the book.
    author VARCHAR(255) NOT NULL,       -- The author of the book.
    category VARCHAR(100) NOT NULL      -- The category of the book.
);

-- Table: book_copies
-- Description: Stores individual copies of books available at different libraries.
CREATE TABLE book_copies (
    copy_id SERIAL PRIMARY KEY,                 -- A unique identifier for each book copy.
    book_id INTEGER NOT NULL,                   -- The ID of the book this copy represents.
    library_id INTEGER NOT NULL,                -- The ID of the library where this copy is located.
    is_available BOOLEAN NOT NULL DEFAULT TRUE, -- Availability status of the book copy.
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (library_id) REFERENCES libraries(library_id)
);

-- Table: loans
-- Description: Records the details of book loans to users.
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,   -- A unique identifier for each loan.
    copy_id INTEGER NOT NULL,     -- The ID of the book copy being loaned.
    user_id INTEGER NOT NULL,     -- The ID of the user who is borrowing the book.
    loan_date DATE NOT NULL,      -- The date the book was loaned.
    due_date DATE NOT NULL,       -- The date the book is due to be returned.
    return_date DATE,             -- The date the book was actually returned.
    FOREIGN KEY (copy_id) REFERENCES book_copies(copy_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: holds
-- Description: Tracks reservations (holds) placed by users for books.
CREATE TABLE holds (
    hold_id SERIAL PRIMARY KEY,       -- A unique identifier for each hold.
    book_id INTEGER NOT NULL,         -- The ID of the book being held.
    user_id INTEGER NOT NULL,         -- The ID of the user who placed the hold.
    hold_placed_date DATE NOT NULL,   -- The date the hold was placed.
    expiration_date DATE NOT NULL,    -- The date the hold expires.
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);