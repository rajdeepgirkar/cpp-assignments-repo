#include "Transaction.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <ctime>
#include <cmath>

namespace LibrarySystem {

    // Static member initialization
    int Transaction::nextId = 1;
    const double Transaction::FINE_RATE_PER_DAY = 2.0; // Rs 2 per day

    // Default constructor
    Transaction::Transaction()
        : transactionId(0), memberId(0), bookId(0),
          issueDate(""), dueDate(""), returnDate(""), fineAmount(0.0) {}

    // Parameterized constructor
    Transaction::Transaction(int memberId, int bookId,
                             const std::string& issueDate,
                             const std::string& dueDate)
        : transactionId(nextId++), memberId(memberId), bookId(bookId),
          issueDate(issueDate), dueDate(dueDate),
          returnDate(""), fineAmount(0.0) {}

    // Destructor
    Transaction::~Transaction() {}

    // Calculate fine based on days overdue
    double Transaction::calculateFine(const std::string& actualReturnDate) const {
        int overdueDays = daysBetween(dueDate, actualReturnDate);
        if (overdueDays > 0) {
            return overdueDays * FINE_RATE_PER_DAY;
        }
        return 0.0;
    }

    // Mark as returned
    void Transaction::markReturned(const std::string& retDate) {
        returnDate = retDate;
        fineAmount = calculateFine(retDate);
    }

    // Display
    void Transaction::displayInfo() const {
        std::cout << "  Transaction ID: " << transactionId
                  << " | Member: " << memberId
                  << " | Book: " << bookId
                  << " | Issued: " << issueDate
                  << " | Due: " << dueDate;
        if (!returnDate.empty()) {
            std::cout << " | Returned: " << returnDate
                      << " | Fine: Rs " << fineAmount;
        } else {
            std::cout << " | Status: Not Returned";
        }
        std::cout << "\n";
    }

    // Getters
    int Transaction::getTransactionId() const { return transactionId; }
    int Transaction::getId() const { return transactionId; }
    std::string Transaction::getName() const { return "T" + std::to_string(transactionId); }
    int Transaction::getMemberId() const { return memberId; }
    int Transaction::getBookId() const { return bookId; }
    std::string Transaction::getIssueDate() const { return issueDate; }
    std::string Transaction::getDueDate() const { return dueDate; }
    std::string Transaction::getReturnDate() const { return returnDate; }
    double Transaction::getFineAmount() const { return fineAmount; }
    bool Transaction::isReturned() const { return !returnDate.empty(); }

    // Setters
    void Transaction::setFineAmount(double fine) { fineAmount = fine; }
    void Transaction::setReturnDate(const std::string& date) { returnDate = date; }

    // Get current date as YYYY-MM-DD
    std::string Transaction::getCurrentDate() {
        time_t now = time(nullptr);
        struct tm* timeInfo = localtime(&now);
        char buffer[11];
        strftime(buffer, sizeof(buffer), "%Y-%m-%d", timeInfo);
        return std::string(buffer);
    }

    // Get date after N days from today
    std::string Transaction::getDateAfterDays(int days) {
        time_t now = time(nullptr);
        now += days * 24 * 60 * 60;
        struct tm* timeInfo = localtime(&now);
        char buffer[11];
        strftime(buffer, sizeof(buffer), "%Y-%m-%d", timeInfo);
        return std::string(buffer);
    }

    // Calculate days between two dates (YYYY-MM-DD format)
    int Transaction::daysBetween(const std::string& date1, const std::string& date2) {
        struct tm tm1 = {}, tm2 = {};

        sscanf(date1.c_str(), "%d-%d-%d", &tm1.tm_year, &tm1.tm_mon, &tm1.tm_mday);
        tm1.tm_year -= 1900;
        tm1.tm_mon -= 1;

        sscanf(date2.c_str(), "%d-%d-%d", &tm2.tm_year, &tm2.tm_mon, &tm2.tm_mday);
        tm2.tm_year -= 1900;
        tm2.tm_mon -= 1;

        time_t t1 = mktime(&tm1);
        time_t t2 = mktime(&tm2);

        double diff = difftime(t2, t1);
        return static_cast<int>(diff / (60 * 60 * 24));
    }

    // Reset next ID (useful after loading data)
    void Transaction::resetNextId(int id) {
        nextId = id;
    }

    // Stream output
    std::ostream& operator<<(std::ostream& os, const Transaction& t) {
        os << t.transactionId << "|" << t.memberId << "|" << t.bookId << "|"
           << t.issueDate << "|" << t.dueDate << "|" << t.returnDate << "|"
           << t.fineAmount;
        return os;
    }

    // Stream input
    std::istream& operator>>(std::istream& is, Transaction& t) {
        std::cout << "Enter Member ID: ";
        is >> t.memberId;
        std::cout << "Enter Book ID: ";
        is >> t.bookId;
        is.ignore();
        t.issueDate = Transaction::getCurrentDate();
        t.dueDate = Transaction::getDateAfterDays(14); // 14-day default
        t.returnDate = "";
        t.fineAmount = 0.0;
        t.transactionId = Transaction::nextId++;
        return is;
    }

} // namespace LibrarySystem
