package ex2;

public class PizzaHandler extends Handler {
    public void handleRequest(String request) {
        if (request.equals("PLAIN Pizza, no toppings"))
            System.out.println("PizzaChef: Starting to cook " + request + ". Out in 7 minutes!");
        else {
            System.out.println("PizzaChef: I can't cook that.");
            super.handleRequest(request);
        }
    }
}