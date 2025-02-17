package ex3;

import java.util.Collection;

public class RemoveCommand<T> implements Command {
    private final T elem;
    private final Collection<T> collection;

    public RemoveCommand(T elem, Collection<T> collection) {
        this.elem = elem;
        this.collection = collection;
    }

    
    public void execute() {
        collection.remove(elem);
    }

    public void undo() {
        collection.add(elem);
    }
    
}
