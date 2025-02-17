package ex3;

public class Cessna extends Flight {

    public Cessna(String flightNumber, ATCInterface atc) {
        super(flightNumber, atc);
    }

    @Override
    public void receive(String message) {
        System.out.println("Cessna received: " + message);
    }
    
}