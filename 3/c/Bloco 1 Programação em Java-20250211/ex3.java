import java.util.Stack;
import java.util.Scanner;

public class ex3 {

    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        System.out.print("Reverse Polish Notation Calculator\n");
        String input = sc.nextLine();
        String[] values = input.split("\\s+");

        Stack<Double> stack = new Stack<>();

        // percorrer o input
        for(String value : values){
            // colocar o número na stack
            try {
                double num = Double.parseDouble(value);
                stack.push(num);
            // nao sendo número, tratamos do valor como um operador e procedemos a um cálculo
            } catch (NumberFormatException e) {
                if(stack.size() < 2){
                    System.err.print("Not enough numbers!\n");
                    return;
                }
                
                // retiramos os dois últimos valores da stack
                double value1 = stack.pop();
                double value2 = stack.pop();

                switch (value) {
                    case "+":
                        stack.push(value1 + value2);
                        break;
                    case "-":
                        stack.push(value1 - value2);
                        break;
                    case "*":
                        stack.push(value1 * value2);
                        break;
                    case "/":
                        if (value2 == 0) {
                            System.err.println("Error: Division by zero.");
                            return;
                        }
                        stack.push(value1 / value2);
                        break;
                    default:
                        System.err.println("Error: Invalid operator '" + value + "'.");
                        return;
                }
            }
            System.out.println("Stack: " + stack);
        }
    }
}
