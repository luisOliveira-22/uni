package v2;

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedList;

public class TextReader implements ReaderInterface {
    private LinkedList<String> text = new LinkedList<String>();
    
    public TextReader(String filename) {
        try {
            Scanner scanner = new Scanner(new File(filename));
            while (scanner.hasNextLine()) {
                text.add(scanner.nextLine());
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public boolean hasNext() {
        return !text.isEmpty();
    }
    
    public String next() {
        return text.remove();
    }
}