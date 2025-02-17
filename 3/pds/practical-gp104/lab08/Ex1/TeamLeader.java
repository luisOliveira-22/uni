package Ex1;

import java.util.Date;

public class TeamLeader extends EmployeeRole{
    
    public TeamLeader(EmployeeInterface e){
        super(e);
    }

    public String plan(){
        return " and planning";
    }
    
    public String start(Date d){
        return super.start(d);
    }

    public String terminate(Date d){
        return super.terminate(d);
    }

    public String work(){
        return super.work() + plan();
    }
}