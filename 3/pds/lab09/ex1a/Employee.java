package lab09.ex1a;

class Employee extends Person {

private double salary;
	
	public Employee(String n, double s) {
		super(n);
		salary = s;
	}

	public double getSalary() {
		return salary;
	}
}