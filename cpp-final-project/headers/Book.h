#ifndef BOOK_H
#define BOOK_H

#include <string>
#include <iostream>

namespace LibrarySystem {

    enum class BookStatus { AVAILABLE, ISSUED, RESERVED };
    enum class BookGenre { FICTION, NONFICTION, SCIENCE, HISTORY, TECHNOLOGY, OTHER };

    class Book {
    private:
        int bookId;
        std::string title;
        std::string author;
        std::string isbn;
        BookStatus status;
        BookGenre genre;
        int quantity;
        int availableCopies;

    public:
        // Constructors
        Book();
        Book(int bookId, const std::string& title, const std::string& author,
             const std::string& isbn, BookGenre genre = BookGenre::OTHER,
             int quantity = 1);

        // Destructor
        ~Book();

        // Display
        void displayInfo() const;

        // Getters
        int getBookId() const;
        std::string getTitle() const;
        std::string getAuthor() const;
        std::string getIsbn() const;
        BookStatus getStatus() const;
        BookGenre getGenre() const;
        int getQuantity() const;
        int getAvailableCopies() const;

        // Container<T> compatibility (aliases)
        int getId() const;
        std::string getName() const;

        // Setters
        void setStatus(BookStatus status);
        void setAvailableCopies(int copies);

        // Issue/Return helpers
        bool issueOne();   // Decrement available, return success
        void returnOne();  // Increment available

        // Operator overloading: ++ / -- (pre and post) for available copies
        Book& operator++();        // Pre-increment
        Book operator++(int);      // Post-increment
        Book& operator--();        // Pre-decrement
        Book operator--(int);      // Post-decrement

        // Comparison operators
        bool operator==(const Book& other) const;
        bool operator<(const Book& other) const;

        // [] operator — return field by index
        // 0=id, 1=title, 2=author, 3=isbn, 4=genre, 5=status
        std::string operator[](int index) const;

        // Stream operators
        friend std::ostream& operator<<(std::ostream& os, const Book& b);
        friend std::istream& operator>>(std::istream& is, Book& b);

        // Utility
        static std::string statusToString(BookStatus s);
        static std::string genreToString(BookGenre g);
        static BookGenre stringToGenre(const std::string& s);
        static BookStatus stringToStatus(const std::string& s);
    };

} // namespace LibrarySystem

#endif // BOOK_H
