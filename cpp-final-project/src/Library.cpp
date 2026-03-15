// Implementation of Library functions

#include "../headers/Library.h"

using namespace LibrarySystem;

void Library::addBook(Book b){
    books.add(b);
}

void Library::registerMember(Member m){
    members.add(m);
}

void Library::displayBooks(){
    books.display();
}

void Library::displayMembers(){
    members.display();
}

// adds books & members to display