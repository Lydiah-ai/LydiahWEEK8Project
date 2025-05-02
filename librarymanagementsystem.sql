-- CREATE database LibraryManagementSystem;
USE LibraryManagementSystem;

-- Create Authors table
CREATE TABLE Authors(
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Birthdate DATE
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublishedYear INT,
    Genre VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create BorrowingRecords table
CREATE TABLE BorrowingRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample data into Authors
INSERT INTO Authors (Name, Birthdate) VALUES ('J.K. Nyangau', '1970-07-30');
INSERT INTO Authors (Name, Birthdate) VALUES ('George Arwasa', '1960-06-25');

-- Insert sample data into Books
INSERT INTO Books (Title, AuthorID, PublishedYear, Genre) VALUES ('Harry Potter and the Philosopher\'s Stone', 1, 1997, 'Fantasy');
INSERT INTO Books (Title, AuthorID, PublishedYear, Genre) VALUES ('1984', 2, 1949, 'Dystopian');

-- Insert sample data into Members
INSERT INTO Members (Name, Email, JoinDate) VALUES ('Benson Kamau', 'benson@gmail.com', '2023-01-15');
INSERT INTO Members (Name, Email, JoinDate) VALUES ('Lydiah Nongesa', 'nyongesa@yahoo.com', '2023-02-20');

-- Insert sample data into BorrowingRecords
INSERT INTO BorrowingRecords (BookID, MemberID, BorrowDate, ReturnDate) VALUES (1, 1, '2023-03-01', '2023-03-15');
INSERT INTO BorrowingRecords (BookID, MemberID, BorrowDate, ReturnDate) VALUES (2, 2, '2023-03-05', '2023-03-20');
