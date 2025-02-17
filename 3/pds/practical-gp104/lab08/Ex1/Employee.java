package Ex1;

import java.util.Date;

public class Employee implements EmployeeInterface{
    private String name;

    public Employee(String name){
        this.name = name;
    }

    public String start(Date d){
        return "Employee " + name + " started working on: " + d;
    }

    public String terminate(Date d){
        return "Employee " + name + " was terminated on: " + d;
    }

    public String work(){
        return "Employee " + name + " is working";
    }

}