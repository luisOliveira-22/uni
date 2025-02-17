package Ex3;

public class Bebida extends Component {
    private String name;
    private double weight;

    public Bebida(String name, double weight) {
        this.name = name;
        this.weight = weight;
    }

    public void draw() {
        System.out.println(indent.toString() + "Bebida '" + name + "' - Weight : " + weight);
    }

    public double getWeight() {
        return weight;
    }
}