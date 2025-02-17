package lab09.ex2;

class Employee {

private double salary;
private Person person;
private int empCard;
	
	public Employee(Person p, double s) {
		person = p;
		salary = s;
		empCard = (int)(Math.random() * 1000000);
	}

	public int getEmpCard() {
		return empCard;
	}

	public double getSalary() {
		return salary;
	}

	public BankAccount getBankAccount() {
		return person.getBankAccount();
	}
}