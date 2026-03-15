// Implementation of Member functions

#include "../headers/Member.h"

using namespace LibrarySystem;

Member::Member() : Person(), booksIssued(0) {
    issuedBooks = new int[10];
}

Member::Member(int id, std::string name, std::string phone)
: Person(id,name,phone) {
    booksIssued = 0;
    issuedBooks = new int[10];
}

Member::Member(const Member& other) : Person(other.id,other.name,other.phone) {
    booksIssued = other.booksIssued;
    issuedBooks = new int[10];
    for(int i=0;i<booksIssued;i++)
        issuedBooks[i]=other.issuedBooks[i];
}

Member::~Member(){
    delete[] issuedBooks;
}

Member& Member::operator=(const Member& other){

    if(this!=&other){

        id=other.id;
        name=other.name;
        phone=other.phone;

        delete[] issuedBooks;

        booksIssued=other.booksIssued;
        issuedBooks=new int[10];

        for(int i=0;i<booksIssued;i++)
            issuedBooks[i]=other.issuedBooks[i];
    }

    return *this;
}

bool Member::operator==(const Member& other){
    return id==other.id;
}

void Member::displayInfo() const{
    std::cout<<"Member ID: "<<id<<"\nName: "<<name<<"\nPhone: "<<phone<<"\n";
}

std::ostream& LibrarySystem::operator<<(std::ostream& os,const Member& m){
    os<<m.id<<" "<<m.name<<" "<<m.phone;
    return os;
}

std::istream& LibrarySystem::operator>>(std::istream& is, Member& m){
    is>>m.id>>m.name>>m.phone;
    return is;
}