import java.util.List;

public class Vector {
    
    private List<Integer> numbers;
    private Double num;

    public Vector(List<Integer> numbers){
        this.numbers = numbers;
    }

    public Vector(double num){
        this.num = num;
    }

    @Override
    public String toString(){
        if(num != null){
            return String.valueOf(num);
        }
        String string = "[";
        for(int i = 0; i < numbers.size(); i++){
            string += String.valueOf(numbers.get(i));
            if(i != numbers.size() - 1)
                string += ",";
        }
        string += "]";
        return string;
    }
}