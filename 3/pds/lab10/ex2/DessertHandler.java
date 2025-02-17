package ex2;

public class DessertHandler extends Handler {
    public void handleRequest(String request) {
        if (request.equals("strawberry ice cream and waffles dessert"))
            System.out.println("DessertChef: Starting to cook " + request + ". Out in 17 minutes!");
        else {
            System.out.println("DessertChef: I can't cook that.");
            super.handleRequest(request);
        }
    }
}