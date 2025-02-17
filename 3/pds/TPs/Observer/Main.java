package Observer;

public class Main{
    public static void main(String[] args){
        WeatherData weatherData = new WeatherData();

        CurrentConditionsDisplay currentDisplay = new CurrentConditionsDisplay();

        StatisticsDisplay statisticsDisplay = new StatisticsDisplay();

        weatherData.registerObserver(currentDisplay);
        weatherData.registerObserver(statisticsDisplay);

        weatherData.setMeasurements(28,65);
        weatherData.setMeasurements(22,70);
        weatherData.setMeasurements(26,90);
    }
}