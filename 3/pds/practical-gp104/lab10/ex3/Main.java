package ex3;

import java.util.Collection;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) {
        Collection <String> collection = new LinkedList<String>();
        Invoker invoker = new Invoker();

        String elem1 = "elem1";
        Command addCommand1 = new AddCommand<String>(elem1, collection);
        invoker.addCommand(addCommand1);
        System.out.println(collection);

        String elem2 = "elem2";
        Command addCommand2 = new AddCommand<String>(elem2, collection);
        invoker.addCommand(addCommand2);
        System.out.println(collection);

        invoker.undo();
        System.out.println(collection);

        Command removeCommand = new RemoveCommand<String>(elem2, collection);
        invoker.addCommand(removeCommand);
        System.out.println(collection);

        invoker.undo();
        System.out.println(collection);

        String elem3 = "elem3";
        Command addCommand3 = new AddCommand<String>(elem3, collection);
        invoker.addCommand(addCommand3);
        System.out.println(collection);

        invoker.undo();
        System.out.println(collection);

        Command removeCommand2 = new RemoveCommand<String>(elem2, collection);
        invoker.addCommand(removeCommand2);
        System.out.println(collection);

        invoker.undo();
        System.out.println(collection);
    }
}
