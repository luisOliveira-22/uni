package ex2;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> requests = new ArrayList<>();
        requests.add("veggie burger");
        requests.add("Pasta Carbonara");
        requests.add("PLAIN Pizza, no toppings");
        requests.add("sushi nigiri and sashimi");
        requests.add("salad with tuna");
        requests.add("strawberry ice cream and waffles dessert");

        Handler requestHandler =
                new SushiHandler().setSuccessor(
                    new PastaHandler().setSuccessor(
                        new VeggieBurgerHandler().setSuccessor(
                            new PizzaHandler().setSuccessor(
                                new VeggieBurgerHandler().setSuccessor(
                                    new DessertHandler())))));
        for (String request : requests) {
            System.out.println("Can I please get a " + request + "?");
            requestHandler.handleRequest(request);
            System.out.println();
        }            
    }
}