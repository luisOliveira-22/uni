package v2;

public class FilterDecorator implements ReaderInterface {
    private ReaderInterface reader;

    public FilterDecorator(ReaderInterface reader) {
        this.reader = reader;
    }

    public boolean hasNext() {
        return reader.hasNext();
    }

    public String next() {
        return reader.next();
    }
}