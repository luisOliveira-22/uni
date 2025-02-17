package lab09.ex3.startypes;
import java.awt.Color;

public class FStar extends StarType{
    
    public FStar() {
        super(5, new Color(230, 252, 252));
        this.description = "This is a long description of the B type star....";
        // This would store the values of physical properties for each type of star
        this.physicalProperties = new Float[10];
    }
}