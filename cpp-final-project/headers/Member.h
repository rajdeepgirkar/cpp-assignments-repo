#ifndef MEMBER_H
#define MEMBER_H

#include "Person.h"
#include <string>
#include <iostream>

namespace LibrarySystem {

    class Member : public Person {
    private:
        int numBooksIssued;
        int* issuedBookIds;  // Dynamic array of issued book IDs
        int capacity;        // Capacity of the dynamic array

    public:
        // Constructors
        Member();
        Member(int id, const std::string& name, const std::string& phone);

        // Copy constructor (deep copy)
        Member(const Member& other);

        // Destructor
        ~Member();

        // Assignment operator (deep copy)
        Member& operator=(const Member& other);

        // Override displayInfo from Person (runtime polymorphism)
        void displayInfo() const override;

        // Book management
        void issueBook(int bookId);
        void returnBook(int bookId);
        bool hasBook(int bookId) const;

        // Getters
        int getNumBooksIssued() const;
        const int* getIssuedBookIds() const;

        // Comparison operator
        bool operator==(const Member& other) const;

        // Stream operators
        friend std::ostream& operator<<(std::ostream& os, const Member& m);
        friend std::istream& operator>>(std::istream& is, Member& m);
    };

} // namespace LibrarySystem

#endif // MEMBER_H
