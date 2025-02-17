package ex3;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Book book1 = Book.getInstance("The Lord of the Rings", "J. R. R. Tolkien", 1954, 1);
        Book book2 = Book.getInstance("The Hobbit", "J. R. R. Tolkien", 1937, 2);
        Book book3 = Book.getInstance("Harry Potter", "J. K. Rowling", 1997, 3);

        Library library = Library.getInstance();

        library.addBook(book1);
        library.addBook(book2);
        library.addBook(book3);

        while (true) {
            System.out.println(library);

            
            System.out.print(">> ");
            String input = scanner.nextLine();
            String[] inputArray = input.split(",");

            Book book = library.getBook(Integer.parseInt(inputArray[0]));
            try {
                library.operation(book, Integer.parseInt(inputArray[1]));
            }
            catch (Exception e) {
                System.out.println("Operation not available");
            }
            System.out.println();
        }
    }

    
}