// Derived from Person.h

#ifndef MEMBER_H
#define MEMBER_H

#include "Person.h"
#include <iostream>

namespace LibrarySystem {

class Member : public Person {

private:
    int booksIssued;
    int* issuedBooks;

public:

    Member();
    Member(int id, std::string name, std::string phone);
    Member(const Member& other);
    ~Member();

    Member& operator=(const Member& other);
    bool operator==(const Member& other);

    void displayInfo() const override;

    friend std::ostream& operator<<(std::ostream&, const Member&);
    friend std::istream& operator>>(std::istream&, Member&);
};

}

#endif

/*
library member who borrows book
*/