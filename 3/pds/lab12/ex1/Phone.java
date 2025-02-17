package ex1;

public class Phone {
    private String name;
    private String processor;
    private double price;
    private int memory;

    public Phone(String name, String processor, double price, int memory) {
        this.name = name;
        this.processor = processor;
        this.price = price;
        this.memory = memory;
    }

    public String getName() {
        return name;
    }

    public String getProcessor() {
        return processor;
    }

    public double getPrice() {
        return price;
    }

    public int getMemory() {
        return memory;
    }

    @Override
    public String toString() {
        return "Phone [memory=" + memory + ", name=" + name + ", price=" + price + ", processor=" + processor + "]";
    }
}