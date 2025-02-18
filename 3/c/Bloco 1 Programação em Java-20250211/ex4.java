import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ex4 {

    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {

        Map<String, Integer> numberMap = new HashMap<>();

        String filePath = "bloco1/numbers.txt";

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while((line = br.readLine()) != null){
                String[] parts = line.split(" - ");
                if(parts.length == 2){
                    int num = Integer.parseInt(parts[0]);
                    String word = parts[1];
                    numberMap.put(word, num);
                }
            }
        } catch (IOException e) {
            System.err.println("Erro ao ler o ficheiro: " + e.getMessage());
            return;
        }

        System.out.print("(ex: eight million two hundred thousand five hundred twenty-four)\n");
        System.out.print("Enter a sentence and a few numbers: ");
        String input = sc.nextLine();
        String[] values = input.split("\\s+");

        String result = "";

        // Processar a substituição das palavras pelos números
        // ...
    }
}