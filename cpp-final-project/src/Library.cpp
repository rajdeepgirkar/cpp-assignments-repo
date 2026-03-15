#include "Library.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <iomanip>

namespace LibrarySystem {

    Library::Library(const std::string& dataPath) : dataPath(dataPath) {}
    Library::~Library() {}

    // ==================== Book Management ====================

    void Library::addBook() {
        Book book;
        std::cin >> book;
        // Check for duplicate ID
        if (books.find(book.getBookId()) != -1) {
            throw InvalidInputException("A book with this ID already exists",
                                        __FUNCTION__, __LINE__);
        }
        books.add(book);
        std::cout << "\n  >> Book added successfully!\n";
    }

    void Library::removeBook() {
        int id;
        std::cout << "Enter Book ID to remove: ";
        std::cin >> id;
        int index = books.find(id);
        if (index == -1) {
            throw BookNotFoundException("Book with ID " + std::to_string(id) + " not found",
                                        __FUNCTION__, __LINE__);
        }
        // Check if book is currently issued
        if (bookToMember.count(id)) {
            throw BookNotAvailableException("Cannot remove book — it is currently issued",
                                            __FUNCTION__, __LINE__);
        }
        books.remove(index);
        std::cout << "\n  >> Book removed successfully!\n";
    }

    void Library::searchBook() {
        std::cout << "Search by:\n  1. Title\n  2. Author\n  3. ISBN\n  4. Book ID\nChoice: ";
        int choice;
        std::cin >> choice;
        std::cin.ignore();

        bool found = false;
        if (choice == 4) {
            int id;
            std::cout << "Enter Book ID: ";
            std::cin >> id;
            int index = books.find(id);
            if (index != -1) {
                std::cout << "\n--- Search Result ---\n";
                books.get(index).displayInfo();
                found = true;
            }
        } else {
            std::string query;
            std::cout << "Enter search query: ";
            std::getline(std::cin, query);

            // Convert query to lowercase for case-insensitive search
            std::string queryLower = query;
            std::transform(queryLower.begin(), queryLower.end(), queryLower.begin(), ::tolower);

            std::cout << "\n--- Search Results ---\n";
            for (int i = 0; i < books.getSize(); i++) {
                std::string field;
                if (choice == 1) field = books.get(i).getTitle();
                else if (choice == 2) field = books.get(i).getAuthor();
                else if (choice == 3) field = books.get(i).getIsbn();
                else continue;

                std::string fieldLower = field;
                std::transform(fieldLower.begin(), fieldLower.end(), fieldLower.begin(), ::tolower);

                if (fieldLower.find(queryLower) != std::string::npos) {
                    books.get(i).displayInfo();
                    std::cout << "------------------------------\n";
                    found = true;
                }
            }
        }

        if (!found) {
            throw BookNotFoundException("No books matching your query were found",
                                        __FUNCTION__, __LINE__);
        }
    }

    void Library::displayAllBooks() const {
        std::cout << "\n========== ALL BOOKS (" << books.getSize() << ") ==========\n";
        books.displayAll();
    }

    // ==================== Member Management ====================

    void Library::registerMember() {
        Member member;
        std::cin >> member;
        // Check for duplicate ID
        if (members.find(member.getId()) != -1) {
            throw InvalidInputException("A member with this ID already exists",
                                        __FUNCTION__, __LINE__);
        }
        members.add(member);
        std::cout << "\n  >> Member registered successfully!\n";
    }

    void Library::removeMember() {
        int id;
        std::cout << "Enter Member ID to remove: ";
        std::cin >> id;
        int index = members.find(id);
        if (index == -1) {
            throw MemberNotFoundException("Member with ID " + std::to_string(id) + " not found",
                                          __FUNCTION__, __LINE__);
        }
        // Check if member has books
        if (members.get(index).getNumBooksIssued() > 0) {
            throw InvalidInputException("Cannot remove member — they have books issued",
                                        __FUNCTION__, __LINE__);
        }
        members.remove(index);
        std::cout << "\n  >> Member removed successfully!\n";
    }

    void Library::searchMember() {
        std::cout << "Search by:\n  1. Name\n  2. Member ID\nChoice: ";
        int choice;
        std::cin >> choice;
        std::cin.ignore();

        bool found = false;
        if (choice == 2) {
            int id;
            std::cout << "Enter Member ID: ";
            std::cin >> id;
            int index = members.find(id);
            if (index != -1) {
                std::cout << "\n--- Search Result ---\n";
                members.get(index).displayInfo();
                found = true;
            }
        } else {
            std::string query;
            std::cout << "Enter name to search: ";
            std::getline(std::cin, query);

            std::string queryLower = query;
            std::transform(queryLower.begin(), queryLower.end(), queryLower.begin(), ::tolower);

            std::cout << "\n--- Search Results ---\n";
            for (int i = 0; i < members.getSize(); i++) {
                std::string nameLower = members.get(i).getName();
                std::transform(nameLower.begin(), nameLower.end(), nameLower.begin(), ::tolower);

                if (nameLower.find(queryLower) != std::string::npos) {
                    members.get(i).displayInfo();
                    std::cout << "------------------------------\n";
                    found = true;
                }
            }
        }

        if (!found) {
            throw MemberNotFoundException("No members matching your query were found",
                                          __FUNCTION__, __LINE__);
        }
    }

    void Library::displayAllMembers() const {
        std::cout << "\n========== ALL MEMBERS (" << members.getSize() << ") ==========\n";
        members.displayAll();
    }

    // ==================== Issue / Return ====================

    void Library::issueBook() {
        int bookId, memberId;
        std::cout << "Enter Book ID to issue: ";
        std::cin >> bookId;
        std::cout << "Enter Member ID: ";
        std::cin >> memberId;

        // Find book
        int bookIndex = books.find(bookId);
        if (bookIndex == -1) {
            throw BookNotFoundException("Book with ID " + std::to_string(bookId) + " not found",
                                        __FUNCTION__, __LINE__);
        }

        // Find member
        int memberIndex = members.find(memberId);
        if (memberIndex == -1) {
            throw MemberNotFoundException("Member with ID " + std::to_string(memberId) + " not found",
                                          __FUNCTION__, __LINE__);
        }

        // Check availability
        if (books.get(bookIndex).getAvailableCopies() <= 0) {
            throw BookNotAvailableException("Book '" + books.get(bookIndex).getTitle() +
                                            "' has no available copies",
                                            __FUNCTION__, __LINE__);
        }

        // Check if member already has this book
        if (members.get(memberIndex).hasBook(bookId)) {
            throw InvalidInputException("This member already has a copy of this book",
                                        __FUNCTION__, __LINE__);
        }

        // Issue the book
        books.get(bookIndex).issueOne();
        members.get(memberIndex).issueBook(bookId);
        bookToMember[bookId] = memberId;

        // Create transaction
        std::string issueDate = Transaction::getCurrentDate();
        std::string dueDate = Transaction::getDateAfterDays(14);
        Transaction t(memberId, bookId, issueDate, dueDate);
        transactions.push_back(t);

        std::cout << "\n  >> Book issued successfully!\n"
                  << "  Issue Date: " << issueDate << " | Due Date: " << dueDate << "\n";
    }

    void Library::returnBook() {
        int bookId, memberId;
        std::cout << "Enter Book ID to return: ";
        std::cin >> bookId;
        std::cout << "Enter Member ID: ";
        std::cin >> memberId;

        // Find book
        int bookIndex = books.find(bookId);
        if (bookIndex == -1) {
            throw BookNotFoundException("Book with ID " + std::to_string(bookId) + " not found",
                                        __FUNCTION__, __LINE__);
        }

        // Find member
        int memberIndex = members.find(memberId);
        if (memberIndex == -1) {
            throw MemberNotFoundException("Member with ID " + std::to_string(memberId) + " not found",
                                          __FUNCTION__, __LINE__);
        }

        // Check if member actually has this book
        if (!members.get(memberIndex).hasBook(bookId)) {
            throw InvalidInputException("This member does not have this book",
                                        __FUNCTION__, __LINE__);
        }

        // Return the book
        books.get(bookIndex).returnOne();
        members.get(memberIndex).returnBook(bookId);
        bookToMember.erase(bookId);

        // Find the corresponding transaction and mark returned
        std::string returnDate = Transaction::getCurrentDate();
        double fine = 0.0;
        for (int i = static_cast<int>(transactions.size()) - 1; i >= 0; i--) {
            if (transactions[i].getBookId() == bookId &&
                transactions[i].getMemberId() == memberId &&
                !transactions[i].isReturned()) {
                transactions[i].markReturned(returnDate);
                fine = transactions[i].getFineAmount();
                break;
            }
        }

        std::cout << "\n  >> Book returned successfully!\n";
        if (fine > 0) {
            std::cout << "  ** Fine due: Rs " << std::fixed << std::setprecision(2)
                      << fine << " **\n";
        }
    }

    // ==================== Overdue ====================

    void Library::viewOverdueBooks() const {
        std::string today = Transaction::getCurrentDate();
        bool found = false;

        std::cout << "\n========== OVERDUE BOOKS ==========\n";
        for (size_t i = 0; i < transactions.size(); i++) {
            if (!transactions[i].isReturned()) {
                int overdue = Transaction::daysBetween(transactions[i].getDueDate(), today);
                if (overdue > 0) {
                    std::cout << "  Transaction #" << transactions[i].getTransactionId()
                              << " | Book ID: " << transactions[i].getBookId()
                              << " | Member ID: " << transactions[i].getMemberId()
                              << " | Due: " << transactions[i].getDueDate()
                              << " | Overdue by: " << overdue << " days"
                              << " | Fine: Rs " << std::fixed << std::setprecision(2)
                              << overdue * Transaction::FINE_RATE_PER_DAY << "\n";
                    found = true;
                }
            }
        }

        if (!found) {
            std::cout << "  (No overdue books)\n";
        }
    }

    // ==================== File I/O ====================

    void Library::saveData() const {
        // Save books
        std::ofstream bookFile(dataPath + "/books.txt");
        if (!bookFile.is_open()) {
            throw FileException("Failed to open " + dataPath + "/books.txt for writing",
                                __FUNCTION__, __LINE__);
        }
        for (int i = 0; i < books.getSize(); i++) {
            bookFile << books.get(i) << "\n";
        }
        bookFile.close();

        // Save members
        std::ofstream memberFile(dataPath + "/members.txt");
        if (!memberFile.is_open()) {
            throw FileException("Failed to open " + dataPath + "/members.txt for writing",
                                __FUNCTION__, __LINE__);
        }
        for (int i = 0; i < members.getSize(); i++) {
            memberFile << members.get(i) << "\n";
        }
        memberFile.close();

        // Save transactions
        std::ofstream transFile(dataPath + "/transactions.txt");
        if (!transFile.is_open()) {
            throw FileException("Failed to open " + dataPath + "/transactions.txt for writing",
                                __FUNCTION__, __LINE__);
        }
        for (size_t i = 0; i < transactions.size(); i++) {
            transFile << transactions[i] << "\n";
        }
        transFile.close();

        std::cout << "\n  >> All data saved successfully!\n";
    }

    void Library::loadData() {
        // Load books
        std::ifstream bookFile(dataPath + "/books.txt");
        if (bookFile.is_open()) {
            std::string line;
            while (std::getline(bookFile, line)) {
                if (line.empty()) continue;
                std::stringstream ss(line);
                std::string token;
                int bookId, qty, avail;
                std::string title, author, isbn, genreStr, statusStr;

                std::getline(ss, token, '|'); bookId = std::stoi(token);
                std::getline(ss, title, '|');
                std::getline(ss, author, '|');
                std::getline(ss, isbn, '|');
                std::getline(ss, genreStr, '|');
                std::getline(ss, statusStr, '|');
                std::getline(ss, token, '|'); qty = std::stoi(token);
                std::getline(ss, token, '|'); avail = std::stoi(token);

                Book book(bookId, title, author, isbn, Book::stringToGenre(genreStr), qty);
                book.setStatus(Book::stringToStatus(statusStr));
                book.setAvailableCopies(avail);
                books.add(book);
            }
            bookFile.close();
        }

        // Load members
        std::ifstream memberFile(dataPath + "/members.txt");
        if (memberFile.is_open()) {
            std::string line;
            while (std::getline(memberFile, line)) {
                if (line.empty()) continue;
                std::stringstream ss(line);
                std::string token;

                std::getline(ss, token, '|');
                int memberId = std::stoi(token);
                std::string name, phone;
                std::getline(ss, name, '|');
                std::getline(ss, phone, '|');
                std::getline(ss, token, '|');
                int numBooks = std::stoi(token);

                Member member(memberId, name, phone);
                for (int i = 0; i < numBooks; i++) {
                    if (std::getline(ss, token, '|')) {
                        member.issueBook(std::stoi(token));
                    }
                }
                members.add(member);
            }
            memberFile.close();
        }

        // Load transactions
        std::ifstream transFile(dataPath + "/transactions.txt");
        if (transFile.is_open()) {
            std::string line;
            int maxId = 0;
            while (std::getline(transFile, line)) {
                if (line.empty()) continue;
                std::stringstream ss(line);
                std::string token;

                std::getline(ss, token, '|');
                int tId = std::stoi(token);
                if (tId > maxId) maxId = tId;

                std::getline(ss, token, '|');
                int mId = std::stoi(token);
                std::getline(ss, token, '|');
                int bId = std::stoi(token);
                std::string issueDate, dueDate, returnDate;
                std::getline(ss, issueDate, '|');
                std::getline(ss, dueDate, '|');
                std::getline(ss, returnDate, '|');
                std::getline(ss, token, '|');
                double fine = std::stod(token);

                Transaction t(mId, bId, issueDate, dueDate);
                if (!returnDate.empty()) {
                    t.setReturnDate(returnDate);
                    t.setFineAmount(fine);
                }
                transactions.push_back(t);

                // Rebuild bookToMember map for active transactions
                if (returnDate.empty()) {
                    bookToMember[bId] = mId;
                }
            }
            Transaction::resetNextId(maxId + 1);
            transFile.close();
        }

        std::cout << "\n  >> Data loaded successfully! ("
                  << books.getSize() << " books, "
                  << members.getSize() << " members, "
                  << transactions.size() << " transactions)\n";
    }

    // ==================== Polymorphism Demo ====================

    void Library::demonstratePolymorphism() const {
        std::cout << "\n========== Runtime Polymorphism Demonstration ==========\n";
        std::cout << "Creating Person* pointers to Member and Librarian objects...\n\n";

        // Create a Member via base pointer
        Person* p1 = new Member(999, "Demo Member", "1234567890");
        // Create a Librarian via base pointer
        Person* p2 = new Librarian(998, "Demo Librarian", "0987654321", "Science Dept");

        std::cout << "Calling displayInfo() through Person* pointer:\n";
        std::cout << "  p1 (Member):    ";
        p1->displayInfo();  // Should call Member::displayInfo()
        std::cout << "  p2 (Librarian): ";
        p2->displayInfo();  // Should call Librarian::displayInfo()

        std::cout << "\n  >> Late binding confirmed: correct derived versions executed!\n";

        delete p1;
        delete p2;
    }

} // namespace LibrarySystem
