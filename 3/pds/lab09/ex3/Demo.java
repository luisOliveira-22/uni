package lab09.ex3;
import java.awt.Color;

import lab09.ex3.startypes.*;

public class Demo {
    static int CANVAS_SIZE = 1200;
    static int STARS_TO_DRAW = 1000000;
    
    public static void main(String[] args) {
        Sky sky = new Sky();

        // https://astrobackyard.com/wp-content/uploads/2020/03/types-of-stars.jpg
        char[] starTypes = {'O', 'B', 'A', 'F', 'G', 'K', 'M'};
        char type;

		Runtime runtime = Runtime.getRuntime();
		long before = runtime.totalMemory() - runtime.freeMemory();

        for (int i = 0; i < STARS_TO_DRAW; i++) {
            type = starTypes[random(0, starTypes.length-1)];
            sky.placeStar(createStar(type));
        }
        sky.setSize(CANVAS_SIZE, CANVAS_SIZE);
        sky.setBackground(Color.BLACK);
        sky.setVisible(true);

        long after = runtime.totalMemory() - runtime.freeMemory();
		System.out.println("Used memory: " + (after - before) / 1024 / 1024 + " MB");

    }

    private static Star createStar(char type) {
        int x = random(0, CANVAS_SIZE);
        int y = random(0, CANVAS_SIZE);
        Star star=null;
        switch (type) {
        case 'O' : star = new Star(x, y, new OStar()); break;
        case 'A' : star = new Star(x, y, new AStar()); break;
        case 'B' : star = new Star(x, y, new BStar()); break;
        case 'F' : star = new Star(x, y, new FStar()); break;
        case 'G' : star = new Star(x, y, new GStar()); break;
        case 'K' : star = new Star(x, y, new KStar()); break;
        case 'M' : star = new Star(x, y, new MStar()); break;
        }
        return star;
    }

	private static int random(int min, int max) {
        return min + (int) (Math.random() * ((max - min) + 1));
    }
}