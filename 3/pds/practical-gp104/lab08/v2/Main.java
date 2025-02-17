package v2;

public class Main {
    public static void main(String[] args) {
        
        ReaderInterface reader;
        String file = "v2/file.txt";

        System.out.println(">>> Text:");
        reader = new TextReader(file);
        print(reader);

        System.out.println(">>> Text without accents and punctuation:");
        reader = new NormalizationFilter(new TextReader(file));
        print(reader);

        System.out.println(">>> Text without vowels:");
        reader = new VowelFilter(new TermFilter(new TextReader(file)));
        print(reader);

        System.out.println(">>> Text with capital letters in the first and last character:");
        reader = new CapitalizationFilter(new VowelFilter(new TextReader(file)));
        print(reader);
    }

    private static void print(ReaderInterface reader) {
        while (reader.hasNext()) {
            System.out.println(reader.next());
        }
        System.out.println();
    }
    
}