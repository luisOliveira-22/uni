package ex3;

public class Boeing747 extends Flight {

    public Boeing747(String flightNumber, ATCInterface atc) {
        super(flightNumber, atc);
    }

    @Override
    public void receive(String message) {
        System.out.println("Boeing747 received: " + message);
    }
    
}