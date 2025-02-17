package lab09.ex1b;

interface BankAccount {
	void deposit(double amount);
	boolean withdraw(double amount);
	double balance();
}