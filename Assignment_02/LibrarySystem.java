import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Book {
    int bookId;
    String bookName;
    
    public Book(int bookId, String bookName) {
        this.bookId = bookId;
        this.bookName = bookName;
    }
}

class Library {
    List<Book> books = new ArrayList<>();
    
    // Method to pass/add objects to library
    public void addBook(Book book) {
        books.add(book);
    }
    
    // Method to display books
    public void displayBooks() {
        System.out.println("Library Book List:");
        System.out.println("-------------------------------");
        if (books.isEmpty()) {
            System.out.println("No books available.");
        } else {
            for (Book b : books) {
                System.out.println("ID: " + b.bookId + "\t| Title: " + b.bookName);
            }
        }
        System.out.println("-------------------------------");
    }
}

public class LibrarySystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Library System ---");
        
        Library myLibrary = new Library();
        
        System.out.print("How many books do you want to add to the library? ");
        int numBooks = scanner.nextInt();
        scanner.nextLine();
        
        for (int i = 0; i < numBooks; i++) {
            System.out.println("\nEnter details for Book " + (i + 1) + ":");
            System.out.print("Book ID: ");
            int id = scanner.nextInt();
            scanner.nextLine();
            System.out.print("Book Name: ");
            String name = scanner.nextLine();
            
            Book b = new Book(id, name);
            myLibrary.addBook(b);
        }
        
        System.out.println();
        myLibrary.displayBooks();
        
        scanner.close();
    }
}
