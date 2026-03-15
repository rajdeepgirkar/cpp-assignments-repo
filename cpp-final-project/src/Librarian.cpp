#include "Librarian.h"
#include <iostream>

namespace LibrarySystem {

    // Default constructor
    Librarian::Librarian() : Person(), department("General") {}

    // Parameterized constructor
    Librarian::Librarian(int id, const std::string& name, const std::string& phone,
                         const std::string& department)
        : Person(id, name, phone), department(department) {}

    // Destructor
    Librarian::~Librarian() {}

    // Override displayInfo (runtime polymorphism)
    void Librarian::displayInfo() const {
        std::cout << "  [Librarian] ID: " << id
                  << " | Name: " << name
                  << " | Phone: " << phone
                  << " | Department: " << department << "\n";
    }

    // Getters / Setters
    std::string Librarian::getDepartment() const { return department; }
    void Librarian::setDepartment(const std::string& dept) { department = dept; }

    // Stream output
    std::ostream& operator<<(std::ostream& os, const Librarian& l) {
        os << l.id << "|" << l.name << "|" << l.phone << "|" << l.department;
        return os;
    }

    // Stream input
    std::istream& operator>>(std::istream& is, Librarian& l) {
        std::cout << "Enter Librarian ID: ";
        is >> l.id;
        is.ignore();
        std::cout << "Enter Name: ";
        std::getline(is, l.name);
        std::cout << "Enter Phone: ";
        std::getline(is, l.phone);
        std::cout << "Enter Department: ";
        std::getline(is, l.department);
        return is;
    }

} // namespace LibrarySystem
