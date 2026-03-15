#ifndef LIBRARY_H
#define LIBRARY_H

#include "Book.h"
#include "Member.h"
#include "Librarian.h"
#include "Container.h"
#include "Transaction.h"
#include "Exceptions.h"
#include <vector>
#include <map>
#include <string>

namespace LibrarySystem {

    class Library {
    private:
        Container<Book> books;
        Container<Member> members;
        std::vector<Transaction> transactions;
        std::map<int, int> bookToMember;  // bookId -> memberId mapping

        std::string dataPath; // Path to data directory

    public:
        Library(const std::string& dataPath = "data");
        ~Library();

        // Book management
        void addBook();
        void removeBook();
        void searchBook();
        void displayAllBooks() const;

        // Member management
        void registerMember();
        void removeMember();
        void searchMember();
        void displayAllMembers() const;

        // Issue / Return
        void issueBook();
        void returnBook();

        // Overdue
        void viewOverdueBooks() const;

        // File I/O
        void saveData() const;
        void loadData();

        // Polymorphism demonstration
        void demonstratePolymorphism() const;
    };

} // namespace LibrarySystem

#endif // LIBRARY_H
