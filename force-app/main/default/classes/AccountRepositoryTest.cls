/**
 * @author warleyalmeida - brq
 */

@isTest
public class AccountRepositoryTest {

    
    
    @isTest
    public static void givenValidAccountNameWhenFindByNameThenReturnStoredAccount() {

        // given
        Account account = AccountFixtureFactory.createAccount('BISSOLINO');


        // when
        AccountRepository repository = new AccountRepository();
        List<Account> storedAccounts = repository.findByName('BISSOLINO');

        // then
        System.assertEquals(1, storedAccounts.size());
        Account storedAccount = storedAccounts.get(0);

        System.assertEquals(account.Id, storedAccount.Id);
    }


    @isTest
    public static void givenNotCreatedCityWhenFindAccountByCityThenNotReturnAccounts() {

        // given

        // when
        AccountRepository repository = new AccountRepository();
        List<Account> storedAccounts = repository.findByCity('São Paulo');

        // then
        System.assert(storedAccounts.isEmpty(), 'Não e esperado retorno de Contas para a cidade São Paulo');

    }

    @isTest
    public static void givenAccountWithBillingCityWhenFindByCityThenReturnMoreThanOneAccounts() {



        // given

        List <Account> accounts = new List<Account>{
            AccountFixtureFactory.newAccount('BISSOLINO'),
            AccountFixtureFactory.newAccount('BISSOLINO2')
        };

        insert accounts;

        // when

        AccountRepository repository = new AccountRepository();
        List<Account> storedAccounts = repository.findByCity('São Paulo');

        // then
        System.assert(!storedAccounts.isEmpty(), 'Esperado uma lista de Contas para a cidade São Paulo');
        System.assertEquals(2, storedAccounts.size());

        Account fisrtAccount = storedAccounts.get(0);

        System.assertEquals(accounts.get(0).Id, fisrtAccount.Id);


    }


    @isTest
    public static void givenValidAccountWhenCreateThenReturnAccountWithId() {

        // given
        Account account = AccountFixtureFactory.newAccount('BISSOLINO');

        // when
        AccountRepository repository = new AccountRepository();
        Account storedAccount = repository.create(account);

        // then
        System.assertNotEquals(null, storedAccount.Id);
    }
}