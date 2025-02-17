package v2;

public class VowelFilter extends FilterDecorator {

    public VowelFilter(ReaderInterface reader) {
        super(reader);
    }
    
    public boolean hasNext() {
        return super.hasNext();
    }
    
    public String next() {
        return super.next().replaceAll("[aeiouAEIOU]", "");
    }
}
