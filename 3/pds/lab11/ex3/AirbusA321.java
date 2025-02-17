package ex3;

public class AirbusA321 extends Flight {

    public AirbusA321(String flightNumber, ATCInterface atc) {
        super(flightNumber, atc);
    }

    @Override
    public void receive(String message) {
        System.out.println("AirbusA321 received: " + message);
    }
    
}
