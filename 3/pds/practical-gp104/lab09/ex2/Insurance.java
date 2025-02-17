package lab09.ex2;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

public class Insurance {
    private List<Person> insuredPeople;

    public Insurance() {
        insuredPeople = new ArrayList<>();
    }

    public void regist(Person p) {
        insuredPeople.add(p);
    }

    public List<Person> insuredPeople() {
        return Collections.unmodifiableList(insuredPeople);
    }
}