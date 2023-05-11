/**
 * @author warleyalmeida - brq
 */

public with sharing class AccountTH extends TriggerHandler {


    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountFilter filter;
    AccountValidator validator;
    AccountEnricher enricher;
    EventEnricher eventEnricher;
    AccountZipCodeAddressPublisher publisher;



    public AccountTH() {
        this( (List<Account>) Trigger.new, 
                (Map<Id, Account>) Trigger.oldMap);

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
        this.enricher = new AccountEnricher();
        this.eventEnricher = new EventEnricher();
        this.publisher = new AccountZipCodeAddressPublisher();
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
        enricherAccountsForPremium();
    }

    override
    public void beforeUpdate() {
        validateDocumentNumber();
        enricherAccounts();
        enricherAccountsForPremium();
    }

    override
    public void afterInsert() {
        publishGetAccountZipCodeAddress();
        
    }

    override
    public void afterUpdate() {
        publishGetAccountZipCodeAddress();
        
    }


    public void validateDocumentNumber() {
        List<Account> filterdAccounts = filter.filterByChangedDocumentNumber(newAccounts, oldAccounts);

        validator.isValidDocuments(filterdAccounts);
    }

    public void enricherAccounts() {
        enricher.enrichWithFormatedDocumentNumber(newAccounts);
    }

    public void enricherAccountsForPremium() {
        List<Account> filterAccounts = filter.filterByClientPremium(newAccounts, oldAccounts);

        eventEnricher.enrichEventForClientPremiunAndAnnualRevanueOneMillion(filterAccounts);
    }


    public void publishGetAccountZipCodeAddress() {
        //Filtrar somente contas com BillingPostalCode != null
        //Filtrar somente contas com BillingPostalCode modificados


        publisher.publish(this.newAccounts);
    }
}