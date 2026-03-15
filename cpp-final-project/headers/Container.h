#ifndef CONTAINER_H
#define CONTAINER_H

#include <string>
#include <stdexcept>
#include <iostream>

namespace LibrarySystem {

    // Generic template container using dynamic array
    // IMPORTANT: Full implementation in header as required for templates
    template <typename T>
    class Container {
    private:
        T* data;
        int size;
        int capacity;

        void resize() {
            int newCapacity = (capacity == 0) ? 4 : capacity * 2;
            T* newData = new T[newCapacity];
            for (int i = 0; i < size; i++) {
                newData[i] = data[i];
            }
            delete[] data;
            data = newData;
            capacity = newCapacity;
        }

    public:
        // Constructor
        Container() : data(nullptr), size(0), capacity(0) {}

        // Parameterized constructor
        Container(int initialCapacity)
            : data(new T[initialCapacity]), size(0), capacity(initialCapacity) {}

        // Copy constructor (deep copy)
        Container(const Container& other)
            : data(nullptr), size(0), capacity(0) {
            if (other.capacity > 0) {
                data = new T[other.capacity];
                capacity = other.capacity;
                size = other.size;
                for (int i = 0; i < size; i++) {
                    data[i] = other.data[i];
                }
            }
        }

        // Assignment operator (deep copy)
        Container& operator=(const Container& other) {
            if (this != &other) {
                delete[] data;
                data = nullptr;
                size = 0;
                capacity = 0;

                if (other.capacity > 0) {
                    data = new T[other.capacity];
                    capacity = other.capacity;
                    size = other.size;
                    for (int i = 0; i < size; i++) {
                        data[i] = other.data[i];
                    }
                }
            }
            return *this;
        }

        // Destructor
        ~Container() {
            delete[] data;
        }

        // Add an element
        void add(const T& item) {
            if (size >= capacity) {
                resize();
            }
            data[size++] = item;
        }

        // Remove element at index
        bool remove(int index) {
            if (index < 0 || index >= size) {
                return false;
            }
            for (int i = index; i < size - 1; i++) {
                data[i] = data[i + 1];
            }
            size--;
            return true;
        }

        // Get element at index
        T& get(int index) {
            if (index < 0 || index >= size) {
                throw std::out_of_range("Container index out of range");
            }
            return data[index];
        }

        const T& get(int index) const {
            if (index < 0 || index >= size) {
                throw std::out_of_range("Container index out of range");
            }
            return data[index];
        }

        // [] operator
        T& operator[](int index) {
            return get(index);
        }

        const T& operator[](int index) const {
            return get(index);
        }

        // Find by ID (function overloading)
        int find(int id) const {
            for (int i = 0; i < size; i++) {
                if (data[i].getId() == id) {
                    return i;
                }
            }
            return -1; // Not found
        }

        // Find by name (function overloading)
        int find(const std::string& name) const {
            for (int i = 0; i < size; i++) {
                if (data[i].getName() == name) {
                    return i;
                }
            }
            return -1; // Not found
        }

        // Getters
        int getSize() const { return size; }
        int getCapacity() const { return capacity; }
        bool isEmpty() const { return size == 0; }

        // Display all elements
        void displayAll() const {
            if (size == 0) {
                std::cout << "  (No items to display)\n";
                return;
            }
            for (int i = 0; i < size; i++) {
                data[i].displayInfo();
                std::cout << "------------------------------\n";
            }
        }
    };

} // namespace LibrarySystem

#endif // CONTAINER_H
