package Ex1;
import java.util.Date;


public class Main{
    private static EmployeeInterface e; 

    public static void main(String[] args){
        e = new TeamLeader(new TeamMember(new Employee("Jane")));
        System.out.println(e.work());
        
        System.out.println(e.start(new Date()));
    }
}