import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ex2 {

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
        String[] values = input.trim().split("\\s*=\\s*");
    
        if (values.length != 2) {
            System.err.println("Error: Invalid assignment format.");
            return;
        }
    
        String var = values[0].trim();
        String expression = values[1].trim();
    
        // Verifica se a variável é válida (começa com letra e não é um número)
        if (!var.matches("^[a-zA-Z][a-zA-Z0-9]*$")) {
            System.err.println("Error: Variable must start with a letter and contain only letters or digits.");
            return;
        }
    
        try {
            double result = processExpression(expression);
            variables.put(var, result);
        } catch (Exception e) {
            System.err.println("Error: Invalid expression in assignment.");
        }
    }
    

    private static double processExpression(String input){
        String[] values = input.split("\\s+");

        if(values.length == 1){
            // condiçao de ser variavel em vez de numero
            if (variables.containsKey(values[0])) {
                return variables.get(values[0]);
            }
            // Tenta converter para número
            try {
                return Double.parseDouble(values[0]);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Error: Undefined variable or invalid number.");
            }

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

    private static double calcExpression(String token1, String operator, String token2) {
        double value1, value2;
    
        // Se os tokens forem variáveis, pega o valor armazenado
        if (variables.containsKey(token1)) {
            value1 = variables.get(token1);
        } else {
            value1 = Double.parseDouble(token1);
        }
    
        if (variables.containsKey(token2)) {
            value2 = variables.get(token2);
        } else {
            value2 = Double.parseDouble(token2);
        }
    
        switch (operator) {
            case "+":
                return value1 + value2;
            case "-":
                return value1 - value2;
            case "*":
                return value1 * value2;
            case "/":
                if (value2 == 0) {
                    throw new ArithmeticException("Error: Division by zero.");
                }
                return value1 / value2;
            default:
                throw new IllegalArgumentException("Error: Invalid operator. Use '+', '-', '*' or '/'.");
        }
    }
    
}