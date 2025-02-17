package Ex3;

import java.util.ArrayList;
import java.util.List;

public class Caixa extends Component {
    private String name;
    private double weight;
    private List<Component> children = new ArrayList<>();

    public Caixa(String name, double weight) {
        this.name = name;
        this.weight = weight;
    }

    public void add(Component c) {
        children.add(c);
    }

    public double getWeight() {
        return getTotalWeight();
    }

    public void draw() {
        System.out.println(indent.toString() + "* Caixa '" + name + "' [ Weight: " + weight + " ; Total: " + getTotalWeight() + "]");
        indent.append("  ");
        for (Component child : children) {
            child.draw();
        }
        indent.setLength(indent.length() - 2);
    }

    private double getTotalWeight() {
        double totalWeight = weight;
        for (Component child : children) {
            totalWeight += child.getWeight();
        }
        return totalWeight;
    }
}