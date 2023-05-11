/**
 * @author warleyalmeida - brq
 */

public class AccountValidator {


    public AccountValidator() {
    }


    public void isValidDocuments (List<Account> accounts) {
        BrazilianDocument brazilianDocument;

        for(Account account : accounts) {
            brazilianDocument = new BrazilianDocument(account.DocumentNumber__c);
            
            if(!brazilianDocument.isValid()) {
                account.DocumentNumber__c.addError('Documento Invalido');
            }
        }
    }
}