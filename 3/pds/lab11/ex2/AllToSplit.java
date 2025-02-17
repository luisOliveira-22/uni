package ex2;

abstract class Employee {
	protected String name;
	public abstract String getName();
}

class Programmer extends Employee {
	public Programmer(String name) {
		this.name = name;
	}
	@Override
	public String getName() {
		return name;
	}
}

class NullProgrammer extends Employee {
	@Override
	public String getName() {
		return "Not Available";
	}
}

class EmployeeFactory {
	public static final String[] names = { "Mac", "Linux", "Win" };

	public static Employee getEmployee(String name) {
		for (int i = 0; i < names.length; i++) {
			if (names[i].equalsIgnoreCase(name)) {
				return new Programmer(name);
			}
		}
		return new NullProgrammer();
	}
}