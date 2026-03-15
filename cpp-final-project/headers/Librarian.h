#ifndef LIBRARIAN_H
#define LIBRARIAN_H

#include "Person.h"
#include <string>
#include <iostream>

namespace LibrarySystem {

    class Librarian : public Person {
    private:
        std::string department;

    public:
        // Constructors
        Librarian();
        Librarian(int id, const std::string& name, const std::string& phone,
                  const std::string& department);

        // Destructor
        ~Librarian();

        // Override displayInfo from Person (runtime polymorphism)
        void displayInfo() const override;

        // Getters / Setters
        std::string getDepartment() const;
        void setDepartment(const std::string& dept);

        // Stream operators
        friend std::ostream& operator<<(std::ostream& os, const Librarian& l);
        friend std::istream& operator>>(std::istream& is, Librarian& l);
    };

} // namespace LibrarySystem

#endif // LIBRARIAN_H
