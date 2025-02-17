public class Fraction {
    private int numerator;
    private int denominator;

    public Fraction(int n, int d) {
        assert(d != 0);
        this.numerator=n;
        this.denominator=d;
    }

    public Fraction(int num) {
        this.numerator=num;
        this.denominator=1;
    }

    public int getNumerator() {
        return numerator;
    }

    public int getDenominator() {
        return denominator;
    }


    public void setNumerator(int num) {
        this.numerator = num;
    }

    public void setDenominator(int num) {
        this.denominator = num;
    }
    
    public void add(Fraction f) {
        this.denominator = denominator * f.getDenominator();
        this.numerator = (numerator*denominator) + (f.getNumerator()*denominator);
    }

    public void sub(Fraction f) {
        this.denominator = denominator * f.getDenominator();
        this.numerator = (numerator*denominator) - (f.getNumerator()*denominator);
    }

    public void mul(Fraction f) {
        this.numerator = numerator * f.getNumerator();
        this.denominator = denominator * f.getDenominator();
    }

    public void div(Fraction f) {
        this.numerator = numerator * f.getDenominator();
        this.denominator = denominator * f.getNumerator();
    }
    
    @Override
    public String toString() {
        return String.valueOf(numerator) + '/' + String.valueOf(denominator);
    }
   
    public static Fraction parse(String num) {
        String[] nums = num.split("/");
        int numerator = Integer.parseInt(nums[0]);    
        int denominator = Integer.parseInt(nums[1]);
        
        Fraction f = new Fraction(numerator, denominator);
        return f;
    }

}
