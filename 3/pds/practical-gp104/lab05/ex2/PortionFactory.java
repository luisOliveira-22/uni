package lab05.ex2;

class PortionFactory {
    public static Portion create(String foodType, Temperature cold) {
        if (foodType.equals("Beverage") && cold.equals(Temperature.COLD))
            return new FruitJuice();
        if (foodType.equals("Beverage") && cold.equals(Temperature.WARM))
            return new Milk();
        if (foodType.equals("Meat") && cold.equals(Temperature.COLD))
            return new Tuna();
        if (foodType.equals("Meat") && cold.equals(Temperature.WARM))
            return new Pork();
        return null;
    }
}