package ex3;

import java.util.ArrayList;
import java.util.List;

public class ATC implements ATCInterface {
    private List<Flight> flights;

    public ATC() {
        flights = new ArrayList<Flight>();
    }

    public void registerFlight(Flight flight) {
        flights.add(flight);
    }

    @Override
    public void notify(String message, Flight receiver) {
        for (Flight flight : flights) {
            if (flight == receiver) {
                flight.receive(message);
            }
        }
    }
    
    
}
