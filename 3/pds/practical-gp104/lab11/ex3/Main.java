package ex3;

public class Main {
    public static void main(String[] args) {
        ATC atc = new ATC();

        Cessna cessna = new Cessna("123", atc);
        atc.registerFlight(cessna);
        Boeing747 boeing747 = new Boeing747("321", atc);
        atc.registerFlight(boeing747);
        AirbusA321 airbusA321 = new AirbusA321("456", atc);
        atc.registerFlight(airbusA321);

        atc.notify("Take off", cessna);
        atc.notify("Clear to land", boeing747);
        atc.notify("Hold", airbusA321);
    }
}