package Mediator;

public class Main{
    public static void main(String[] args){
        Mediator mediator = new Mediator();
        Colleague c1 = new Colleague(mediator, "Afonso");
        Colleague c2 = new Colleague(mediator, "Luís");
        Colleague c3 = new Colleague(mediator, "David");
        mediator.addColleague(c1);
        mediator.addColleague(c2);
        mediator.addColleague(c3);
        c1.sendMessage();
        c2.sendMessage();
        c1.sendMessage();
        c2.sendMessage();
        c3.sendMessage();
    }
}