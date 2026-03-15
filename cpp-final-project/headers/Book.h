// books in library

#ifndef BOOK_H
#define BOOK_H

#include <iostream>
#include <string>

namespace LibrarySystem {

enum class BookStatus { AVAILABLE, ISSUED };
enum class BookGenre { TECH, FICTION, EDUCATION };

class Book {

private:
    int bookId;
    std::string title;
    std::string author;
    std::string isbn;
    BookStatus status;
    int quantity;
    int available;

public:

    Book();
    Book(int id,std::string t,std::string a,std::string i,int q);

    bool operator==(const Book& other);
    bool operator<(const Book& other);

    Book& operator++();
    Book operator++(int);

    std::string operator[](int index);

    friend std::ostream& operator<<(std::ostream&,const Book&);
    friend std::istream& operator>>(std::istream&,Book&);
};

}

#endif
