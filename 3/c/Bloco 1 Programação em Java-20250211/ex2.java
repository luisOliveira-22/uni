import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ex2 {

    // operation = value operator value
    //
    // operator -> +, -, *, /, =
    //
    // value -> number
    // value -> variable
    // value -> operation
    //
    // variable -> value
    // variable -> operation | operator != "="

    static Scanner sc = new Scanner(System.in);
    static Map<String, Double> variables = new HashMap<>();
    
    public static void main(String[] args) {
        System.out.print("\n>> Exercício 1.02\n");

        while(true){
            System.out.print("\n--- MENU ---\n");
            System.out.print("Type EXIT to end the program!\n");
            System.out.print("User input: ");
            String input = sc.nextLine();

            if(input.equalsIgnoreCase("EXIT")){
                System.out.print("Goodbye :)\n\n");
                break;
            }

            try{
                if (input.contains("=")) {
                    processAssignment(input);
                } else {
                    processExpression(input);
                    System.out.print("Result: " + processExpression(input) + "\n");
                }
            }catch (Exception e) {
                System.err.print("Error: " + e.getMessage() + "\n");
            }
        }
    }

    private static void processAssignment(String input){
        
        double num = 0;
        String var = "";

        String[] values = input.trim().split("=");
        
        if(values.length > 2){
            System.err.print("Error: Input with too much \"=\"!\n");
        }
        
        if(values[0].matches("^[a-zA-Z].*")){
            var = values[0];
        }else{
            System.err.print("Error: Variable must start with letter!\n");
        }
        
        String[] expression = values[1].split("\\s+");
        if(expression.length % 2 == 0){
            System.err.print("Error: Invalid expression!\n");
        }
        else{
            num = processExpression(values[1]);
        }
        
        variables.put(var, num);
    }

    private static double processExpression(String input){
        String[] values = input.split("\\s+");

        if(values.length == 1){
            // condiçao de ser variavel em vez de numero
            // ...

            return Double.parseDouble(values[0]);
        }
        else if(values.length == 3){
            return calcExpression(values[0], values[1], values[2]);
        }
        else{
            double beggining = calcExpression(values[0], values[1], values[2]);
            String auxiliar = Double.toString(beggining) + values[3] + values[4];
            processExpression(auxiliar);
        }
        return 0;
    }

    private static double calcExpression(String token1, String token2, String token3){
        double res = 0;
        try{
            // condiçao de serem variaveis em vez de numeros
            // ...

            double value1 = Double.parseDouble(token1);
            String operator = token2; 
            double value2 = Double.parseDouble(token3);

            switch (operator) {
                case "+":
                    res = value1 + value2;
                    break;
                case "-":
                    res = value1 - value2;
                    break;
                case "*":
                    res = value1 * value2;
                    break;
                case "/":
                    if (value2 == 0) {
                        System.err.print("Error: Can't be divided by 0.\n");
                    }
                    res = value1 / value2;
                    break;
                default:
                    System.err.print("Error: Invalid operator. Use '+', '-', '*' ou '/'.\n");
            }
        }catch (Exception e) {
            System.err.println("Error: Invalid input! Must insert valid numbers.");
        }
        return res;
    }
}