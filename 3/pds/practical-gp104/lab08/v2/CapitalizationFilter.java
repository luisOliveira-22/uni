package v2;

public class CapitalizationFilter extends FilterDecorator {

    public CapitalizationFilter(ReaderInterface reader) {
        super(reader);
    }
    
    public boolean hasNext() {
        return super.hasNext();
    }
    
    public String next() {
        String s = super.next();
        String first = s.substring(0, 1);
        String last = s.substring(s.length() - 1);

        return first.toUpperCase() + s.substring(1, s.length() - 1).toLowerCase() + last.toUpperCase();
    }   
}