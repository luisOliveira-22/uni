package lab09.ex3;

import java.awt.Graphics;

import lab09.ex3.startypes.StarType;

public class Star {
    private int x;
    private int y;
    private StarType type;

    public Star(int x, int y, StarType type) {
        this.x = x;
        this.y = y;
        this.type = type;
    }

    public StarType getType() {
        return type;
    }

    public void setStarType(StarType type) {
        this.type = type;
    }

    public void draw(Graphics g) {
        type.draw(g, x, y);
    }

}