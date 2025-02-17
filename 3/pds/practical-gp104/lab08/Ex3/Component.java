package Ex3;

abstract class Component {
    public static StringBuffer indent = new StringBuffer();
    public abstract void draw();
    public abstract double getWeight();
}