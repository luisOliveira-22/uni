package ex2;

public class VeggieBurgerHandler extends Handler {
    public void handleRequest(String request) {
        if (request.equals("veggie burger"))
            System.out.println("BurgerChef: Starting to cook " + request + ". Out in 19 minutes!");
        else {
            System.out.println("BurgerChef: I can't cook that.");
            super.handleRequest(request);
        }
    }
}