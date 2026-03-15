#include "Member.h"
#include "Exceptions.h"
#include <iostream>
#include <cstring>

namespace LibrarySystem {

    // Default constructor
    Member::Member()
        : Person(), numBooksIssued(0), issuedBookIds(nullptr), capacity(4) {
        issuedBookIds = new int[capacity];
    }

    // Parameterized constructor
    Member::Member(int id, const std::string& name, const std::string& phone)
        : Person(id, name, phone), numBooksIssued(0), issuedBookIds(nullptr), capacity(4) {
        issuedBookIds = new int[capacity];
    }

    // Copy constructor (deep copy)
    Member::Member(const Member& other)
        : Person(other.id, other.name, other.phone),
          numBooksIssued(other.numBooksIssued),
          issuedBookIds(nullptr),
          capacity(other.capacity) {
        issuedBookIds = new int[capacity];
        for (int i = 0; i < numBooksIssued; i++) {
            issuedBookIds[i] = other.issuedBookIds[i];
        }
    }

    // Destructor
    Member::~Member() {
        delete[] issuedBookIds;
    }

    // Assignment operator (deep copy)
    Member& Member::operator=(const Member& other) {
        if (this != &other) {
            // Copy base class members
            id = other.id;
            name = other.name;
            phone = other.phone;

            // Free existing memory
            delete[] issuedBookIds;

            // Deep copy
            numBooksIssued = other.numBooksIssued;
            capacity = other.capacity;
            issuedBookIds = new int[capacity];
            for (int i = 0; i < numBooksIssued; i++) {
                issuedBookIds[i] = other.issuedBookIds[i];
            }
        }
        return *this;
    }

    // Override displayInfo (runtime polymorphism)
    void Member::displayInfo() const {
        std::cout << "  [Member] ID: " << id
                  << " | Name: " << name
                  << " | Phone: " << phone
                  << " | Books Issued: " << numBooksIssued << "\n";
        if (numBooksIssued > 0) {
            std::cout << "    Issued Book IDs: ";
            for (int i = 0; i < numBooksIssued; i++) {
                std::cout << issuedBookIds[i];
                if (i < numBooksIssued - 1) std::cout << ", ";
            }
            std::cout << "\n";
        }
    }

    // Issue a book to this member
    void Member::issueBook(int bookId) {
        // Check if already has this book
        if (hasBook(bookId)) {
            throw InvalidInputException("Member already has this book",
                                        __FUNCTION__, __LINE__);
        }
        // Resize if needed
        if (numBooksIssued >= capacity) {
            int newCapacity = capacity * 2;
            int* newArr = new int[newCapacity];
            for (int i = 0; i < numBooksIssued; i++) {
                newArr[i] = issuedBookIds[i];
            }
            delete[] issuedBookIds;
            issuedBookIds = newArr;
            capacity = newCapacity;
        }
        issuedBookIds[numBooksIssued++] = bookId;
    }

    // Return a book
    void Member::returnBook(int bookId) {
        int foundIndex = -1;
        for (int i = 0; i < numBooksIssued; i++) {
            if (issuedBookIds[i] == bookId) {
                foundIndex = i;
                break;
            }
        }
        if (foundIndex == -1) {
            throw BookNotFoundException("Member does not have this book",
                                        __FUNCTION__, __LINE__);
        }
        // Shift elements left
        for (int i = foundIndex; i < numBooksIssued - 1; i++) {
            issuedBookIds[i] = issuedBookIds[i + 1];
        }
        numBooksIssued--;
    }

    // Check if member has a specific book
    bool Member::hasBook(int bookId) const {
        for (int i = 0; i < numBooksIssued; i++) {
            if (issuedBookIds[i] == bookId) {
                return true;
            }
        }
        return false;
    }

    // Getters
    int Member::getNumBooksIssued() const { return numBooksIssued; }
    const int* Member::getIssuedBookIds() const { return issuedBookIds; }

    // Comparison
    bool Member::operator==(const Member& other) const {
        return id == other.id;
    }

    // Stream output
    std::ostream& operator<<(std::ostream& os, const Member& m) {
        os << m.id << "|" << m.name << "|" << m.phone << "|" << m.numBooksIssued;
        for (int i = 0; i < m.numBooksIssued; i++) {
            os << "|" << m.issuedBookIds[i];
        }
        return os;
    }

    // Stream input
    std::istream& operator>>(std::istream& is, Member& m) {
        std::cout << "Enter Member ID: ";
        is >> m.id;
        is.ignore();
        std::cout << "Enter Name: ";
        std::getline(is, m.name);
        std::cout << "Enter Phone: ";
        std::getline(is, m.phone);
        m.numBooksIssued = 0;
        return is;
    }

} // namespace LibrarySystem
