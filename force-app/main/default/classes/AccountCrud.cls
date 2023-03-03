/**
 * @author: warleyalmeida - brq
 */

public class AccountCrud {
    public AccountCrud() {

    } 

    public List<Account> findAccountsByName(String name){
        return [ SELECT Id, 
                    Name, (Select Id, FirstName, LastName from Contacts)
                    FROM Account
                    WHERE Name = :name
                ];
    }

    public Account findById(String id){
        return [ SELECT Id, Name
                    FROM Account
                    WHERE Id = :id
                ];
    }

    public Account findByName(String name){
        return [ SELECT Id, 
                    Name, (Select Id, FirstName, LastName from Contacts)
                    FROM Account
                    WHERE Name = :name
                ];
    }

    
}
