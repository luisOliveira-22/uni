package lab05.ex2;


public interface Portion {
    public Temperature getTemperature();
    public State getState();
}

class FruitJuice implements Portion {
    private Temperature temperature = Temperature.COLD;
    private State state = State.Liquid;
    private String fruitName = "Orange";

    public Temperature getTemperature() {
        return temperature;
    }

    public State getState() {
        return state;
    }

    @Override
    public String toString() {
        return "FruitJuice: " + fruitName + ", Temperature " + temperature + ", State " + state;
    }
}

class Milk implements Portion {
    private Temperature temperature = Temperature.WARM;
    private State state = State.Liquid;

    public Temperature getTemperature() {
        return temperature;
    }

    public State getState() {
        return state;
    }

    @Override
    public String toString() {
        return "Milk: Temperature " + temperature + ", State " + state;
    }
}

class Tuna implements Portion {
    private Temperature temperature = Temperature.COLD;
    private State state = State.Solid;

    public Temperature getTemperature() {
        return temperature;
    }

    public State getState() {
        return state;
    }

    @Override
    public String toString() {
        return "Tuna: Temperature " + temperature + ", State " + state;
    }
}

class Pork implements Portion {
    private Temperature temperature = Temperature.WARM;
    private State state = State.Solid;

    public Temperature getTemperature() {
        return temperature;
    }

    public State getState() {
        return state;
    }

    @Override
    public String toString() {
        return "Pork: Temperature " + temperature + ", State " + state;
    }
}