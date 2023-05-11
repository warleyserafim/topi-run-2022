/**
 * @author warleyalmeida - brq
 */


public class AccountZipCodeAddressPublisher {

    public void publish(List<Account> accounts) {


        // USANDO COM O @future
        // List<String> ids = new List<String>();

        // for (Account account : accounts) {
        //     ids.add(account.Id);
        // }

        // getAsyncZipCodeAddress(ids);

        System.enqueueJob(new GetAccountZipCodeAddressService(accounts));
    }

    //@deprecaded
    public static void getAsyncZipCodeAddress(List<String> ids) {
        AccountRepository repository = new AccountRepository();

        List<Account> accounts = repository.findById(ids);

        ZipCodeAddresOutboundService service = new ZipCodeAddresOutboundService();

        List<Account> accountsWithAddress = new List<Account>();
        for(Account account : accounts) {
            accountsWithAddress.add(service.findAccountAddress(account));
        }

        TriggerHandler.bypass('AccountTH');
        repository.store(accountsWithAddress);

        TriggerHandler.clearBypass('AccountTH');

    }
}