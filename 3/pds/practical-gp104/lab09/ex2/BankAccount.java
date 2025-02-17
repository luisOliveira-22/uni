package lab09.ex2;

interface BankAccount {
	void deposit(double amount);
	boolean withdraw(double amount);
	double balance();
}