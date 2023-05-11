/**
 * @author warleyalmeida - brq
 */


public class GetAccountZipCodeAddressService implements Queueable, Database.AllowsCallouts {

    AccountRepository repository;
    List<Account> accounts;
    ZipCodeAddresOutboundService service;


    public GetAccountZipCodeAddressService(List<Account> accounts) {
        this.repository = new AccountRepository();
        this.accounts = accounts;
        this.service = new ZipCodeAddresOutboundService();

    }

    public void execute(QueueableContext context) {


        List<Account> accountsWithAddress = new List<Account>();
        for(Account account : accounts) {
            accountsWithAddress.add(service.findAccountAddress(account));
        }

        save(accountsWithAddress);       

    }

    private void save(List<Account> accounts) {

        TriggerHandler.bypass('AccountTH');

        repository.store(accounts);

        TriggerHandler.clearBypass('AccountTH');

    }
}