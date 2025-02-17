package ex3;

import java.util.Collection;

public class AddCommand<T> implements Command {
    private final T elem;
    private final Collection<T> collection;

    public AddCommand(T elem, Collection<T> collection) {
        this.elem = elem;
        this.collection = collection;
    }

    public void execute() {
        collection.add(elem);
    }

    public void undo() {
        collection.remove(elem);
    }
}