package ex2;

public class PastaHandler extends Handler {
    public void handleRequest(String request) {
        if (request.equals("Pasta Carbonara"))
            System.out.println("PastaChef: Starting to cook " + request + ". Out in 14 minutes!");
        else {
            System.out.println("PastaChef: I can't cook that.");
            super.handleRequest(request);
        }
    }
}