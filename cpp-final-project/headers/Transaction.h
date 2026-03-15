#ifndef TRANSACTION_H
#define TRANSACTION_H

#include <string>
#include <iostream>
#include <ctime>

namespace LibrarySystem {

    class Transaction {
    private:
        int transactionId;
        int memberId;
        int bookId;
        std::string issueDate;
        std::string dueDate;
        std::string returnDate;
        double fineAmount;

        static int nextId;

    public:
        static const double FINE_RATE_PER_DAY;

        // Constructors
        Transaction();
        Transaction(int memberId, int bookId, const std::string& issueDate,
                    const std::string& dueDate);

        // Destructor
        ~Transaction();

        // Calculate fine based on days overdue
        double calculateFine(const std::string& actualReturnDate) const;

        // Mark as returned
        void markReturned(const std::string& returnDate);

        // Display
        void displayInfo() const;

        // Getters
        int getTransactionId() const;
        int getId() const;   // Alias for Container compatibility
        std::string getName() const; // Alias for Container compatibility
        int getMemberId() const;
        int getBookId() const;
        std::string getIssueDate() const;
        std::string getDueDate() const;
        std::string getReturnDate() const;
        double getFineAmount() const;
        bool isReturned() const;

        // Setters
        void setFineAmount(double fine);
        void setReturnDate(const std::string& date);

        // Static utility
        static std::string getCurrentDate();
        static std::string getDateAfterDays(int days);
        static int daysBetween(const std::string& date1, const std::string& date2);
        static void resetNextId(int id = 1);

        // Stream operators
        friend std::ostream& operator<<(std::ostream& os, const Transaction& t);
        friend std::istream& operator>>(std::istream& is, Transaction& t);
    };

} // namespace LibrarySystem

#endif // TRANSACTION_H
