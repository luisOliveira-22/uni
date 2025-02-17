package ex3;

public class Book {
    private String title;
    private String author;
    private int year;
    private int ISBN;
    private Status status;

    private Book(String title, String author, int year, int ISBN) {
        this.title = title;
        this.author = author;
        this.year = year;
        this.ISBN = ISBN;
        this.status = new Status();
    }

    public int getISBN() {
        return ISBN;
    }

    public Status getStatus() {
        return status;
    }

    public void register() {
        this.status.register();
    }

    public void request() {
        this.status.request();
    }

    public void _return() {
        this.status._return();
    }

    public void rent() {
        this.status.rent();
    }

    public void cancel() {
        this.status.cancel();
    }


    @Override
    public String toString() {
        return String.format("%2d  %-25s  %-17s  [%-10s]\n", ISBN, title, author, status);

    }

    public static Book getInstance(String title, String author, int year, int ISBN) {
        return new Book(title, author, year, ISBN);
    }
}