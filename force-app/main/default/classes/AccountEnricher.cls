/**
 * @author warleyalmeida - brq
 */

public class AccountEnricher {

    public AccountEnricher() {

    }

    public void enrichWithFormatedDocumentNumber(List<Account> accounts){
        for (Account account : accounts) {
            BrazilianDocument brazilianDocument = new BrazilianDocument(account.DocumentNumber__c);

            if (brazilianDocument.isCpf()) {
                account.DocumentNumber__c = brazilianDocument.getFormattedCpf();
            } else {
                account.DocumentNumber__c = brazilianDocument.getFormattedCnpj();
            }
        }
    }
}