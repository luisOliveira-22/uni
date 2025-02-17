package lab09.ex2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Parking {
    private List<Person> parkedPeople;

    public Parking() {
        parkedPeople = new ArrayList<>();
    }

    public void allow(Person p) {
        parkedPeople.add(p);
    }

    public List<Person> parkedPeople() {
        return Collections.unmodifiableList(parkedPeople);
    }
}