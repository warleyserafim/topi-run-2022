/**
 * @author warleyalmeida - brq
 */

 // TODO REPOSITORY DEVE TRAZER O DADO PURO
 
 // OS METODOS DE STORE, CREATE, INSERTORUPDATE E DELETE ESTAO NA CLASSE ABSTRATA
 // TODOS OS METODOS DENTRO DE UMA CLASSE REPOSITORY ELAS TEM QUE SER VIRTUAL
 // Upsert quando executo o codigo sem o ID ele cria um novo, quando executado com o ID ele faz o update, entao
 // nao e necessario ter os metodos Create e Update pois o Upsert ja faz um ou outro.

public virtual class AccountRepository extends AbstractRepository {

    virtual
    public List<Account> findByName(String name){
        return [ SELECT Id, 
                    Name, (Select Id, FirstName, LastName from Contacts)
                    FROM Account
                    WHERE Name = :name
                ];
    }

    virtual
    public List<Account> findByCity(String city){
        return [ SELECT Id, 
                    Name, (Select Id, FirstName, LastName from Contacts)
                    FROM Account
                    WHERE BillingCity = :city
                ];
    }

    virtual
    public Account create(Account account){
        insert account;
        return account;
    }

}
