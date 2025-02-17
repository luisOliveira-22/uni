package v2;

import java.util.LinkedList;

public class TermFilter extends FilterDecorator {
    private LinkedList<String> words = new LinkedList<String>();
    
    public TermFilter(ReaderInterface reader) {
        super(reader);
    }
    
    public boolean hasNext() {
        return !words.isEmpty() || super.hasNext();
    }
    
    public String next() {
        if (words.isEmpty()) {
            for(String word : super.next().split(" ")) {
                words.add(word);
            }
        }
        return words.remove();
    }
}
