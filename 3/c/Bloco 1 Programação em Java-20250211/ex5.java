public class ex5 {
    public static void main(String[] args) {
        while(in.hasNextLine()){
            while(scline.hasNext()){
                if(!text.equals("and")){
                    // ...
                    long number = numberTable.get(text);

                    if(number <= acum){
                        result += acum;
                        acum = 01;
                    }

                    if(acum != 0 && number > acum){
                        acum *= number;
                    }
                    else{
                        acum = number;
                    }
                }
            }
        }
        scline.close();
        result += acum;
        System.out.println(line + " -> " + result);
    }

    // ...
}
