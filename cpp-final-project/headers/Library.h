// manger class of system

#ifndef LIBRARY_H
#define LIBRARY_H

#include "Book.h"
#include "Member.h"
#include "Container.h"
#include <vector>

namespace LibrarySystem {

class Library {

private:

    Container<Book> books;
    Container<Member> members;

public:

    void addBook(Book b);
    void registerMember(Member m);

    void displayBooks();
    void displayMembers();
};

}

#endif

// controls books, members, transactions