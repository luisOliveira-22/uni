package lab05.ex2;

public class Container {
    public static Container create(Portion portion) {
        if (portion.getState().equals(State.Liquid) && portion.getTemperature().equals(Temperature.COLD))
            return new PlasticBottle(portion);
        if (portion.getState().equals(State.Liquid) && portion.getTemperature().equals(Temperature.WARM))
            return new TermicBottle(portion);
        if (portion.getState().equals(State.Solid) && portion.getTemperature().equals(Temperature.COLD))
            return new PlasticBag(portion);
        if (portion.getState().equals(State.Solid) && portion.getTemperature().equals(Temperature.WARM))
            return new Tupperware(portion);
        return null;
    }
}

class PlasticBottle extends Container {
    private Portion portion;

    public PlasticBottle(Portion portion) {
        this.portion = portion;
    }

    @Override
    public String toString() {
        return "PlasticBottle with portion = " + portion;
    }
}

class Tupperware extends Container {
    private Portion portion;

    public Tupperware(Portion portion) {
        this.portion = portion;
    }

    @Override
    public String toString() {
        return "Tupperware with portion = " + portion;
    }
}

class TermicBottle extends Container {
    private Portion portion;

    public TermicBottle(Portion portion) {
        this.portion = portion;
    }

    @Override
    public String toString() {
        return "TermicBottle with portion = " + portion;
    }
}

class PlasticBag extends Container {
    private Portion portion;

    public PlasticBag(Portion portion) {
        this.portion = portion;
    }

    @Override
    public String toString() {
        return "PlasticBag with portion = " + portion;
    }
}