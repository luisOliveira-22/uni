package ex3;

import java.util.Collection;
import java.util.LinkedList;

public class Invoker {
    private final Collection<Command> commands = new LinkedList<Command>();

    public void addCommand(Command command) {
        commands.add(command);
        command.execute();
    }

    public void undo() {
        if(!commands.isEmpty()) {
            Command command = ((LinkedList<Command>) commands).removeLast();
            command.undo();
        }
    }
}
