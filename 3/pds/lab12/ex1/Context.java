package ex1;

public class Context {
    private SortingStrategy strategy;

    public Context(SortingStrategy strategy) {
        this.strategy = strategy;
    }

    public void setStrategy(SortingStrategy strategy) {
        this.strategy = strategy;
    }

    public SortingStrategy getStrategy() {
        return strategy;
    }

    public void sort(Phone[] phones) {
        strategy.sort(phones);
    }
}