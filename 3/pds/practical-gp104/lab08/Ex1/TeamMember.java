package Ex1;

import java.util.Date;

public class TeamMember extends EmployeeRole{
    
    public TeamMember(EmployeeInterface e){
        super(e);
    }

    public String collaborate(){
        return " and collaborating";
    }
    
    public String start(Date d){
        return super.start(d);
    }

    public String terminate(Date d){
        return super.terminate(d);
    }

    public String work(){
        return super.work() + collaborate();
    }
}