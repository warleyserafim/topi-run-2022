/**
 * @author warleyalmeida - brq
 */

public class ZipCodeAddressTransformer {
    

    public Account  toAccount(ZipCodeAddressResponse response) {

        Account account = new Account();
        account.BillingStreet = response.logradouro;
        account.BillingCity = response.localidade;
        account.BillingState = response.uf;
        account.BillingPostalCode = response.cep;
        return account;
    }
}