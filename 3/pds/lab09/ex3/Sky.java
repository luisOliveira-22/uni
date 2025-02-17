package lab09.ex3;
import javax.swing.*;

import lab09.ex3.startypes.StarType;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

public class Sky extends JFrame {
    private List<StarType> starTypes = new ArrayList<>();
    private List<Star> stars = new ArrayList<>();

    public void placeStar(Star star) {
        // Check if the star type's class is in the list of star types
        for (StarType starType : starTypes) {
            if (starType.getClass() == star.getType().getClass()) {
                star.setStarType(starType);
                stars.add(star);
                return;
            }
        }
        starTypes.add(star.getType());
        stars.add(star);
        
        System.out.println(starTypes.size());
    }

    @Override
    public void paint(Graphics graphics) {
        for (Star star : stars) {
            star.draw(graphics);
        }
    }
}