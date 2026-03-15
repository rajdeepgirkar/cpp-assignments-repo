// Tracking books and generating transaction id

#ifndef TRANSACTION_H
#define TRANSACTION_H

#include <string>

namespace LibrarySystem {

class Transaction {

private:

    static int counter;
    static const int fineRate = 5;

    int transactionId;
    int memberId;
    int bookId;

public:

    Transaction(int m,int b);

    int getId();
};

}

#endif
