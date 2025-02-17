package ex2;

public class SushiHandler extends Handler {
    public void handleRequest(String request) {
        if (request.equals("sushi nigiri and sashimi"))
            System.out.println("SushiChef: Starting to cook " + request + ". Out in 14 minutes!");
        else {
            System.out.println("SushiChef: I can't cook that.");
            super.handleRequest(request);
        }
    }
}