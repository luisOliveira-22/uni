package Ex3;

public class Conserva extends Component {
    private String name;
    private double weight;

    public Conserva(String name, double weight) {
        this.name = name;
        this.weight = weight;
    }

    public void draw() {
        System.out.println(indent.toString() + "Conserva '" + name + "' - Weight : " + weight);
    }

    public double getWeight() {
        return weight;
    }
}