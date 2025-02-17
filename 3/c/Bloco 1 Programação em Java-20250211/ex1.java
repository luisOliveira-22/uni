import java.util.Scanner;

public class ex1 {

    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        System.out.print("\n>> Exercício 1.01\n");

        while(true){
            System.out.print("\n--- MENU ---\n");
            System.out.print("Type EXIT to end the program!\n");
            System.out.print("Write an operation <num> <op> <num>: ");
            String expression = sc.nextLine();

            if(expression.equalsIgnoreCase("EXIT")){
                System.out.print("Goodbye :)\n\n");
                break;
            }

            String[] values = expression.split("\\s+");
            if (values.length != 3) {
                System.err.print("Error: Invalid input! Must use format <num> <op> <num>.\n");
                continue;
            }

            try {
                double value1 = Double.parseDouble(values[0]);
                double value2 = Double.parseDouble(values[2]);
                String operation = values[1];
                double res;
                
                switch (operation) {
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
                            continue;
                        }
                        res = value1 / value2;
                        break;
                    default:
                        System.err.print("Error: Invalid operator. Use '+', '-', '*' ou '/'.\n");
                        continue;
                }
                
                System.out.printf("Result: %.2f\n", res);
            } catch (NumberFormatException e) {
                System.err.println("Error: Invalid input! Must insert valid numbers.");
            }
        }
    }
}