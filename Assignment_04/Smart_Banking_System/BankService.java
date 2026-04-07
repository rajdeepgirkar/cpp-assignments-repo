package Smart_Banking_System;

public interface BankService {
    void deposit(double amount) throws Exception;

    void withdraw(double amount) throws Exception;
}
