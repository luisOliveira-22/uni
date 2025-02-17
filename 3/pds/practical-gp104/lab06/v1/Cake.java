package v1;

public class Cake {
    private Shape shape;
    private String cakeLayer;
    private int numCakeLayers;
    private Cream midLayerCream;
    private Cream topLayerCream;
    private Topping topping;
    private String message;
    
    //.. restantes métodos

    public Cake(Shape shape, String cakeLayer) {
        this.shape = shape;
        this.cakeLayer = cakeLayer;
    }

    public void setShape(Shape shape) {
        this.shape = shape;
    }

    public void setCakeLayer(String cakeLayer) {
        this.cakeLayer = cakeLayer;
    }

    public void addLayer() {
        numCakeLayers++;
    }

    public void setMidLayerCream(Cream midLayerCream) {
        this.midLayerCream = midLayerCream;
    }

    public void setTopLayerCream(Cream topLayerCream) {
        this.topLayerCream = topLayerCream;
    }

    public void setTopping(Topping topping) {
        this.topping = topping;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        String midLayerCreamOutput = "";
        if (midLayerCream != null) {
            midLayerCreamOutput = " and " + midLayerCream + " cream";
        }
        return cakeLayer + " cake with " + numCakeLayers + " layers" + midLayerCreamOutput + ", topped with " + topLayerCream + " cream and " + topping + ". Message says: \"" + message + "\".";
    }
}
