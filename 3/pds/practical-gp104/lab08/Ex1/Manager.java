package Ex1;

import java.util.Date;

public class Manager extends EmployeeRole{
    
    public Manager(EmployeeInterface e){
        super(e);
    }

    public String manage(){
        return " and managing";
    }
    
    public String start(Date d){
        return super.start(d);
    }

    public String terminate(Date d){
        return super.terminate(d);
    }

    public String work(){
        return super.work() + manage();
    }

   

}