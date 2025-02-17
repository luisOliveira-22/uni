package Mediator;

import java.util.ArrayList;
import java.util.List;

class Mediator {
    private List<Colleague> colleagues;

    public Mediator() {
        this.colleagues = new ArrayList<>();
    }

    public void addColleague(Colleague colleague) {
        this.colleagues.add(colleague);
    }

    public void sendMessage(String message, Colleague sender) {
        for (Colleague colleague : colleagues) {
            if (colleague != sender) {
                colleague.receiveMessage(message);
            }
        }
    }
}

