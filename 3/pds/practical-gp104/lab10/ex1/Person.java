package ex1;

class Person {
	
	private String name;
	private int id;

	public Person(String n, int id) {
		name = n;
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public String toString() {
		return name + " | " + id;
	}
}