package Observer;

import java.util.ArrayList;
import java.util.List;

class StatisticsDisplay implements Observer {
    private List<Float> temperatures = new ArrayList<>();
    private List<Float> humidities = new ArrayList<>();

    @Override
    public void update(float temperature, float humidity) {
        temperatures.add(temperature);
        humidities.add(humidity);
        display();
    }

    public void display() {
        float avgTemp = calculateAverage(temperatures);
        float avgHumidity = calculateAverage(humidities);
        System.out.println("Average Temperature: " + avgTemp + "F, Average Humidity: " + avgHumidity + "%");
    }

    private float calculateAverage(List<Float> values) {
        float sum = 0;
        for (float value : values) {
            sum += value;
        }
        return sum / values.size();
    }
}