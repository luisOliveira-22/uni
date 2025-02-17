package ex3;

public abstract class Flight {
    private ATCInterface atc;

    public Flight(String flightNumber, ATCInterface atc) {
        this.atc = atc;
    }

    public abstract void receive(String message);
}