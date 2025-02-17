package Ex1;

import java.util.Date;

public class EmployeeRole implements EmployeeInterface{
    private EmployeeInterface e;

    public EmployeeRole(EmployeeInterface e){
        this.e = e;
    }

    public String start(Date d) {
        return e.start(d);
    }

    public String terminate(Date d) {
        return e.terminate(d);
    }

    public String work() {
        return e.work();
    }
}