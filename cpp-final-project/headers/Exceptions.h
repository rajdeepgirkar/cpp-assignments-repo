#ifndef EXCEPTIONS_H
#define EXCEPTIONS_H

#include <exception>
#include <string>

namespace LibrarySystem {

    // Base exception class for all library exceptions
    class LibraryException : public std::exception {
    protected:
        std::string message;
        std::string functionName;
        int lineNumber;

    public:
        LibraryException(const std::string& msg, const std::string& func = "", int line = 0)
            : message(msg), functionName(func), lineNumber(line) {}

        virtual ~LibraryException() noexcept {}

        const char* what() const noexcept override {
            return message.c_str();
        }

        std::string getFunction() const { return functionName; }
        int getLine() const { return lineNumber; }

        std::string getDetails() const {
            std::string details = "Error: " + message;
            if (!functionName.empty()) {
                details += " | Function: " + functionName;
            }
            if (lineNumber > 0) {
                details += " | Line: " + std::to_string(lineNumber);
            }
            return details;
        }
    };

    // Book not found in the library
    class BookNotFoundException : public LibraryException {
    public:
        BookNotFoundException(const std::string& msg = "Book not found",
                              const std::string& func = "", int line = 0)
            : LibraryException(msg, func, line) {}
    };

    // Member not found in the library
    class MemberNotFoundException : public LibraryException {
    public:
        MemberNotFoundException(const std::string& msg = "Member not found",
                                const std::string& func = "", int line = 0)
            : LibraryException(msg, func, line) {}
    };

    // Book is not available for issuing
    class BookNotAvailableException : public LibraryException {
    public:
        BookNotAvailableException(const std::string& msg = "Book is not available",
                                  const std::string& func = "", int line = 0)
            : LibraryException(msg, func, line) {}
    };

    // Invalid input provided by the user
    class InvalidInputException : public LibraryException {
    public:
        InvalidInputException(const std::string& msg = "Invalid input",
                              const std::string& func = "", int line = 0)
            : LibraryException(msg, func, line) {}
    };

    // File operation failure
    class FileException : public LibraryException {
    public:
        FileException(const std::string& msg = "File operation failed",
                      const std::string& func = "", int line = 0)
            : LibraryException(msg, func, line) {}
    };

} // namespace LibrarySystem

#endif // EXCEPTIONS_H
