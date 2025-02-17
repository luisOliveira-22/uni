package lab09.ex1b;

class Employee {

private double salary;
private Person person;
	
	public Employee(Person p, double s) {
		person = p;
		salary = s;
	}

	public double getSalary() {
		return salary;
	}

	public BankAccount getBankAccount() {
		return person.getBankAccount();
	}
}