package lab09.ex2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Company {

	public static User user;
	private List<Employee> emps = new ArrayList<>();
	private SocialSecurity socialSec = new SocialSecurity();
	private Insurance insurance = new Insurance();
	private Parking parking = new Parking();

	public void admitEmployee(Person p, double salary) {
		Employee e = new Employee(p, salary);
		emps.add(e);
		socialSec.regist(p);
		insurance.regist(p);
		if(salary > avgSalary())
			parking.allow(p);
	}

	private double avgSalary() {
		double sum = 0;
		for (Employee e : emps) {
			sum += e.getSalary();
		}
		return sum / emps.size();
	}
	
	public void paySalaries(int month) {
		for (Employee e : emps) {
			BankAccount ba = e.getBankAccount();
			ba.deposit(e.getSalary());
		}
	}
	
	public List<Employee> employees() {
		return Collections.unmodifiableList(emps);
	}

	public List<Person> insuredPeople() {
		return insurance.insuredPeople();
	}

	public List<Person> registeredPeople() {
		return socialSec.registeredPeople();
	}

	public List<Person> parkedPeople() {
		return parking.parkedPeople();
	}
}