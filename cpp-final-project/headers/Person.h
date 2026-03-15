#ifndef PERSON_H
#define PERSON_H

#include <string>
#include <iostream>

namespace LibrarySystem {

    // Abstract base class for Member and Librarian
    class Person {
    protected:
        int id;
        std::string name;
        std::string phone;

    public:
        Person() : id(0), name(""), phone("") {}

        Person(int id, const std::string& name, const std::string& phone)
            : id(id), name(name), phone(phone) {}

        // Virtual destructor for proper cleanup through base pointer
        virtual ~Person() {}

        // Pure virtual function — makes this class abstract
        virtual void displayInfo() const = 0;

        // Getters
        int getId() const { return id; }
        std::string getName() const { return name; }
        std::string getPhone() const { return phone; }

        // Setters
        void setId(int id) { this->id = id; }
        void setName(const std::string& name) { this->name = name; }
        void setPhone(const std::string& phone) { this->phone = phone; }

        // Overloaded stream operators
        friend std::ostream& operator<<(std::ostream& os, const Person& p) {
            p.displayInfo();
            return os;
        }

        friend std::istream& operator>>(std::istream& is, Person& p) {
            std::cout << "Enter ID: ";
            is >> p.id;
            is.ignore();
            std::cout << "Enter Name: ";
            std::getline(is, p.name);
            std::cout << "Enter Phone: ";
            std::getline(is, p.phone);
            return is;
        }
    };

} // namespace LibrarySystem

#endif // PERSON_H
