/**
 * @author warleyalmeida - brq
 */

public  class AccountFilter {

    private Decimal ANNUAL_REVENUE = 1.000000;
    public List<Account> filterByChangedDocumentNumber(List<Account> newAccounts, Map<Id,Account> oldAccounts){

        List<Account> filteredAccounts = new List<Account>();

        for ( Account newAccount : newAccounts ){

            if (oldAccounts == null || oldAccounts.isEmpty()) {
                filteredAccounts.add(newAccount);
                continue;
            }
            
            Account oldAccount = oldAccounts.get(newAccount.Id);

            if (oldAccount != null && (oldAccount.DocumentNumber__c != newAccount.DocumentNumber__c)) {
                filteredAccounts.add(newAccount);
            }
        }

        return filteredAccounts;

    }

    // INDEXAR POR NUMERO DE DOCUMENTO

    public Map<String, Account> indexByDocumentNumber (List<Account> accounts) {
        
        Map<String, Account> indexedAccount = new Map<String, Account>();

        for (Account account : accounts ) {
            indexedAccount.put(account.DocumentNumber__c, account);
        }

        return indexedAccount;
    }

    // AGRUPAR POR ESTADO
    public Map<String, List<Account>> groupByState (List<Account> accounts) {
        
        Map<String, List<Account>> groupedAccount = new Map<String, List<Account>>();

        for (Account account : accounts ) {
            if (!groupedAccount.containsKey(account.BillingState)) {
                groupedAccount.put(account.BillingState, new List<Account>());
            }

            groupedAccount.get(account.BillingState).add(account);
        }

        return groupedAccount;
    }

    public List<Account> filterByClientPremium(List<Account> newAccounts, Map<Id,Account> oldAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        for ( Account newAccount : newAccounts ){

            if (oldAccounts == null || oldAccounts.isEmpty()) {
                filteredAccounts.add(newAccount);
                continue;
            }
            
            Account oldAccount = oldAccounts.get(newAccount.Id);

            if (oldAccount != null && (oldAccount.Category__c == 'Premium' && oldAccount.AnnualRevenue > ANNUAL_REVENUE )) {
                filteredAccounts.add(newAccount);
            }
        }

        return filteredAccounts;
    }
}