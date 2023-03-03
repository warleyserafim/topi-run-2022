/**
* @author warleyalmeida - brq
 */


 // OS METODOS DENTRO DE UM FIXTURE FACTORY DEVEM SER STATICOS

@isTest
public class AccountFixtureFactory {
    // new Intance
    // Create


    public static Account createAccount(String name){
        return createAccount(newAccount(name));
    }

    public static Account newAccount(String name) {
        return new Account(Name = name,
        BillingCity = 'São Paulo'
        );

    }


    public static Account createAccount(Account account) {
        insert account;
        return account;
    }

}