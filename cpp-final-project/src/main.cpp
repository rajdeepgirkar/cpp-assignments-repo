// Entry point

#include <iostream>
#include "headers/Library.h"

using namespace LibrarySystem;

int main(){

    Library lib;

    int choice;

    while(true){

        std::cout<<"\n===== Library Menu =====\n";
        std::cout<<"1 Add Book\n";
        std::cout<<"2 Register Member\n";
        std::cout<<"3 Display Books\n";
        std::cout<<"4 Display Members\n";
        std::cout<<"0 Exit\n";

        std::cin>>choice;

        if(choice==0) break;

        if(choice==1){

            int id,q;
            std::string t,a,i;

            std::cout<<"Book ID:";
            std::cin>>id;

            std::cout<<"Title:";
            std::cin>>t;

            std::cout<<"Author:";
            std::cin>>a;

            std::cout<<"ISBN:";
            std::cin>>i;

            std::cout<<"Quantity:";
            std::cin>>q;

            Book b(id,t,a,i,q);

            lib.addBook(b);
        }

        else if(choice==2){

            Member m;

            std::cin>>m;

            lib.registerMember(m);
        }

        else if(choice==3){

            lib.displayBooks();
        }

        else if(choice==4){

            lib.displayMembers();
        }
    }

    return 0;
}
