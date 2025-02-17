package lab09.ex1a;

public class ProxyBankAccount implements BankAccount {
    private BankAccount bankAccount;

    public ProxyBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }

    @Override
    public void deposit(double amount) {
        bankAccount.deposit(amount);
    }

    @Override
    public boolean withdraw(double amount) {
        if (Company.user.equals(User.OWNER))
            return bankAccount.withdraw(amount);
        else 
            return false;
    }

    @Override
    public double balance() {
        if (Company.user.equals(User.OWNER)) {
            return bankAccount.balance();
        } else {
            throw new UnsupportedOperationException();
        }
    }
}