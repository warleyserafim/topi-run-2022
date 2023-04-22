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

    public List<Account> createListAccount( List<Account> accounts)
    {
        AccountRepository repository = new AccountRepository();

        List<Account> createdListAccount = repository.create( new List<Account> {
            new Account( Name = 'Warley Serafim', Category__c = 'Premium', DocumentNumber__c = '51792689071', AnnualRevenue = 1.5000000, BillingCity = 'Saõ Paulo'),
            new Account( Name = 'Diogo Serafim', Category__c = 'Standard', DocumentNumber__c = '23964569038', AnnualRevenue = 4.5000000, BillingCity = 'Saõ Paulo'),
            new Account( Name = 'Rafael Serafim', Category__c = 'Basic', DocumentNumber__c = '14594388094', AnnualRevenue = 6.5000000, BillingCity = 'Saõ Paulo')

            }
        );

        return createdListAccount;
    }
}