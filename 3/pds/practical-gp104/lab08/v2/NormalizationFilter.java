package v2;

import java.text.Normalizer;

public class NormalizationFilter extends FilterDecorator {

    public NormalizationFilter(ReaderInterface reader) {
        super(reader);
    }
    
    public boolean hasNext() {
        return super.hasNext();
    }
    
    public String next() {
        return Normalizer.normalize(super.next(), Normalizer.Form.NFD).replaceAll("\\p{IsPunctuation}", "");
    }
}
