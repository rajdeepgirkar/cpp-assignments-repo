#include "Book.h"
#include "Exceptions.h"
#include <iostream>
#include <iomanip>

namespace LibrarySystem {

    // Default constructor
    Book::Book()
        : bookId(0), title(""), author(""), isbn(""),
          status(BookStatus::AVAILABLE), genre(BookGenre::OTHER),
          quantity(1), availableCopies(1) {}

    // Parameterized constructor
    Book::Book(int bookId, const std::string& title, const std::string& author,
               const std::string& isbn, BookGenre genre, int quantity)
        : bookId(bookId), title(title), author(author), isbn(isbn),
          status(BookStatus::AVAILABLE), genre(genre),
          quantity(quantity), availableCopies(quantity) {}

    // Destructor
    Book::~Book() {}

    // Display
    void Book::displayInfo() const {
        std::cout << "  Book ID: " << bookId
                  << " | Title: " << title
                  << " | Author: " << author
                  << " | ISBN: " << isbn
                  << " | Genre: " << genreToString(genre)
                  << " | Status: " << statusToString(status)
                  << " | Qty: " << quantity
                  << " | Available: " << availableCopies << "\n";
    }

    // Getters
    int Book::getBookId() const { return bookId; }
    std::string Book::getTitle() const { return title; }
    std::string Book::getAuthor() const { return author; }
    std::string Book::getIsbn() const { return isbn; }
    BookStatus Book::getStatus() const { return status; }
    BookGenre Book::getGenre() const { return genre; }
    int Book::getQuantity() const { return quantity; }
    int Book::getAvailableCopies() const { return availableCopies; }

    // Container<T> compatibility aliases
    int Book::getId() const { return bookId; }
    std::string Book::getName() const { return title; }

    // Setters
    void Book::setStatus(BookStatus s) { status = s; }
    void Book::setAvailableCopies(int copies) { availableCopies = copies; }

    // Issue one copy
    bool Book::issueOne() {
        if (availableCopies <= 0) {
            return false;
        }
        availableCopies--;
        if (availableCopies == 0) {
            status = BookStatus::ISSUED;
        }
        return true;
    }

    // Return one copy
    void Book::returnOne() {
        availableCopies++;
        if (availableCopies > 0) {
            status = BookStatus::AVAILABLE;
        }
        if (availableCopies > quantity) {
            availableCopies = quantity;
        }
    }

    // Pre-increment (++book)
    Book& Book::operator++() {
        availableCopies++;
        if (availableCopies > quantity) availableCopies = quantity;
        if (availableCopies > 0) status = BookStatus::AVAILABLE;
        return *this;
    }

    // Post-increment (book++)
    Book Book::operator++(int) {
        Book temp = *this;
        ++(*this);
        return temp;
    }

    // Pre-decrement (--book)
    Book& Book::operator--() {
        if (availableCopies > 0) availableCopies--;
        if (availableCopies == 0) status = BookStatus::ISSUED;
        return *this;
    }

    // Post-decrement (book--)
    Book Book::operator--(int) {
        Book temp = *this;
        --(*this);
        return temp;
    }

    // Comparison
    bool Book::operator==(const Book& other) const {
        return bookId == other.bookId;
    }

    bool Book::operator<(const Book& other) const {
        return title < other.title;
    }

    // [] operator — returns field by index as string
    std::string Book::operator[](int index) const {
        switch (index) {
            case 0: return std::to_string(bookId);
            case 1: return title;
            case 2: return author;
            case 3: return isbn;
            case 4: return genreToString(genre);
            case 5: return statusToString(status);
            default:
                throw InvalidInputException("Invalid book field index",
                                            __FUNCTION__, __LINE__);
        }
    }

    // Stream output (for file I/O)
    std::ostream& operator<<(std::ostream& os, const Book& b) {
        os << b.bookId << "|" << b.title << "|" << b.author << "|"
           << b.isbn << "|" << Book::genreToString(b.genre) << "|"
           << Book::statusToString(b.status) << "|"
           << b.quantity << "|" << b.availableCopies;
        return os;
    }

    // Stream input
    std::istream& operator>>(std::istream& is, Book& b) {
        std::cout << "Enter Book ID: ";
        is >> b.bookId;
        is.ignore();
        std::cout << "Enter Title: ";
        std::getline(is, b.title);
        std::cout << "Enter Author: ";
        std::getline(is, b.author);
        std::cout << "Enter ISBN: ";
        std::getline(is, b.isbn);
        std::cout << "Enter Genre (Fiction/NonFiction/Science/History/Technology/Other): ";
        std::string genreStr;
        std::getline(is, genreStr);
        b.genre = Book::stringToGenre(genreStr);
        std::cout << "Enter Quantity: ";
        is >> b.quantity;
        b.availableCopies = b.quantity;
        b.status = BookStatus::AVAILABLE;
        return is;
    }

    // Static utility functions
    std::string Book::statusToString(BookStatus s) {
        switch (s) {
            case BookStatus::AVAILABLE: return "Available";
            case BookStatus::ISSUED:    return "Issued";
            case BookStatus::RESERVED:  return "Reserved";
            default: return "Unknown";
        }
    }

    std::string Book::genreToString(BookGenre g) {
        switch (g) {
            case BookGenre::FICTION:     return "Fiction";
            case BookGenre::NONFICTION:  return "NonFiction";
            case BookGenre::SCIENCE:     return "Science";
            case BookGenre::HISTORY:     return "History";
            case BookGenre::TECHNOLOGY:  return "Technology";
            case BookGenre::OTHER:       return "Other";
            default: return "Other";
        }
    }

    BookGenre Book::stringToGenre(const std::string& s) {
        if (s == "Fiction" || s == "fiction")         return BookGenre::FICTION;
        if (s == "NonFiction" || s == "nonfiction")   return BookGenre::NONFICTION;
        if (s == "Science" || s == "science")         return BookGenre::SCIENCE;
        if (s == "History" || s == "history")         return BookGenre::HISTORY;
        if (s == "Technology" || s == "technology")   return BookGenre::TECHNOLOGY;
        return BookGenre::OTHER;
    }

    BookStatus Book::stringToStatus(const std::string& s) {
        if (s == "Available" || s == "available")   return BookStatus::AVAILABLE;
        if (s == "Issued" || s == "issued")         return BookStatus::ISSUED;
        if (s == "Reserved" || s == "reserved")     return BookStatus::RESERVED;
        return BookStatus::AVAILABLE;
    }

    // getId() and getName() for Container compatibility
    // These are accessed via getBookId() and getTitle() normally,
    // but Container<T> calls getId() and getName()
    // We need to add these — they're already declared in the header through getBookId/getTitle

} // namespace LibrarySystem
