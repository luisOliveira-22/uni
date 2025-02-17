package ex3;

import java.util.ArrayList;

public class Library {
    private static Library instance = null;
    private ArrayList<Book> books;

    private Library() {
        this.books = new ArrayList<Book>();
    }

    public static Library getInstance() {
        if (Library.instance == null) {
            Library.instance = new Library();
        }

        return Library.instance;
    }

    public void addBook(Book book) {
        if (!this.books.contains(book)) {
            this.books.add(book);
            return;
        }

        throw new RuntimeException("Book already exists");
    }

    public Book getBook(int ISBN) {
        for (Book book : this.books) {
            if (book.getISBN() == ISBN) {
                return book;
            }
        }

        throw new RuntimeException("Book not found");
    }

    public void operation(Book book, int operation) {
        switch (operation) {
            case 1:
                book.register();
                break;
            case 2:
                book.request();
                break;
            case 3:
                book._return();
                break;
            case 4:
                book.rent();
                break;
            case 5:
                book.cancel();
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

    public void removeBook(Book book) {
        if (this.books.contains(book)) {
            this.books.remove(book);
            return;
        }

        throw new RuntimeException("Book not found");
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("*** Library ***").append("\n");
        for (Book book : this.books) {
            sb.append(book).append("\n");
        }
        sb.append(">> <book>, <operation: (1)register; (2)request; (3)return; (4)rent; (5)cancel");
        return sb.toString();
    }

}