package lab09.ex3.startypes;
import java.awt.*;

public abstract class StarType {

    private int size;
    private Color color;
    protected String description;
    protected Float[] physicalProperties;

    public StarType(int size, Color color) {
        this.size = size;
        this.color = color;

    }

    public void draw(Graphics g, int x, int y) {
        g.setColor(color);
        g.fillOval(x, y , size, size);
    }
}