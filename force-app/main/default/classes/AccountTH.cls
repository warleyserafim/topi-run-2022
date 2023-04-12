/**
 * @author warleyalmeida - brq
 */

public with sharing class AccountTH extends TriggerHandler {


    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountFilter filter;
    AccountValidator validator;
    AccountEnricher enricher;


    public AccountTH() {
        this( (List<Account>) Trigger.new, 
                (Map<Id, Account>) Trigger.oldMap);

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
        this.enricher = new AccountEnricher();
    }

    public AccountTH(List<Account> newAccounts, Map<Id,Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

    }

    override
    public void beforeInsert() {
        //Somente Metodo 
        validateDocumentNumber();
        enricherAccounts();
    }

    override
    public void beforeUpdate() {
        validateDocumentNumber();
        enricherAccounts();
    }

    override
    public void afterInsert() {
        
    }

    override
    public void afterUpdate() {
        
    }


    public void validateDocumentNumber() {
        List<Account> filterdAccounts = filter.filterByChangedDocumentNumber(newAccounts, oldAccounts);

        validator.isValidDocuments(filterdAccounts);
    }

    public void enricherAccounts() {
        enricher.enrichWithFormatedDocumentNumber(newAccounts);
    }
}