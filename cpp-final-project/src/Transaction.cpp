// increments transaction id

#include "../headers/Transaction.h"

using namespace LibrarySystem;

int Transaction::counter=1;

Transaction::Transaction(int m,int b){

    transactionId=counter++;
    memberId=m;
    bookId=b;
}

int Transaction::getId(){
    return transactionId;
}