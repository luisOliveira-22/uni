package lab09.ex2;

import java.util.ArrayList;
import java.util.List;

public class SocialSecurity {
    private List<Person> registeredPeople;

    public SocialSecurity() {
        registeredPeople = new ArrayList<>();
    }

    public void regist(Person p) {
        registeredPeople.add(p);
    }

    public List<Person> registeredPeople() {
        return registeredPeople;
    }
}