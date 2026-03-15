#include "Library.h"
#include "Exceptions.h"
#include <iostream>
#include <limits>

using namespace LibrarySystem;

void displayMenu() {
    std::cout << "\n+--------------------------------------------+\n"
              << "|     LIBRARY MANAGEMENT SYSTEM              |\n"
              << "+--------------------------------------------+\n"
              << "|  1.  Add New Book                          |\n"
              << "|  2.  Remove Book                           |\n"
              << "|  3.  Search Book                           |\n"
              << "|  4.  Display All Books                     |\n"
              << "|  5.  Register Member                       |\n"
              << "|  6.  Remove Member                         |\n"
              << "|  7.  Search Member                         |\n"
              << "|  8.  Display All Members                   |\n"
              << "|  9.  Issue Book                            |\n"
              << "|  10. Return Book                           |\n"
              << "|  11. View Overdue Books                    |\n"
              << "|  12. Save Data                             |\n"
              << "|  13. Load Data                             |\n"
              << "|  0.  Exit                                  |\n"
              << "+--------------------------------------------+\n"
              << "Enter your choice: ";
}

int main() {
    Library library("data");

    // Demonstrate runtime polymorphism at startup
    library.demonstratePolymorphism();

    int choice = -1;

    while (true) {
        displayMenu();

        // Validate integer input
        if (!(std::cin >> choice)) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::cout << "\n  !! Invalid input. Please enter a number.\n";
            continue;
        }

        if (choice == 0) {
            std::cout << "\n  Saving data before exit...\n";
            try {
                library.saveData();
            } catch (const LibraryException& e) {
                std::cout << "  Warning: " << e.getDetails() << "\n";
            }
            std::cout << "\n  Thank you for using the Library Management System!\n"
                      << "  Goodbye!\n\n";
            break;
        }

        try {
            switch (choice) {
                case 1:  library.addBook();            break;
                case 2:  library.removeBook();         break;
                case 3:  library.searchBook();         break;
                case 4:  library.displayAllBooks();    break;
                case 5:  library.registerMember();     break;
                case 6:  library.removeMember();       break;
                case 7:  library.searchMember();       break;
                case 8:  library.displayAllMembers();  break;
                case 9:  library.issueBook();          break;
                case 10: library.returnBook();         break;
                case 11: library.viewOverdueBooks();   break;
                case 12: library.saveData();           break;
                case 13: library.loadData();           break;
                default:
                    std::cout << "\n  !! Invalid option. Please choose 0-13.\n";
            }
        }
        catch (const BookNotFoundException& e) {
            std::cout << "\n  [Book Error] " << e.getDetails() << "\n";
        }
        catch (const MemberNotFoundException& e) {
            std::cout << "\n  [Member Error] " << e.getDetails() << "\n";
        }
        catch (const BookNotAvailableException& e) {
            std::cout << "\n  [Availability Error] " << e.getDetails() << "\n";
        }
        catch (const InvalidInputException& e) {
            std::cout << "\n  [Input Error] " << e.getDetails() << "\n";
        }
        catch (const FileException& e) {
            std::cout << "\n  [File Error] " << e.getDetails() << "\n";
        }
        catch (const LibraryException& e) {
            std::cout << "\n  [Library Error] " << e.getDetails() << "\n";
        }
        catch (const std::exception& e) {
            std::cout << "\n  [System Error] " << e.what() << "\n";
        }
    }

    return 0;
}
