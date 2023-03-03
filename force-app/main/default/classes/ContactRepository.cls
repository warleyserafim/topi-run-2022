/**
 * @author warleyalmeida - brq
 */

 // OS METODOS DE STORE, CREATE, INSERTORUPDATE E DELETE ESTAO NA CLASSE ABSTRATA

public virtual class ContactRepository extends AbstractRepository {
    
    public Contact findById(String id) {
        return [SELECT Id, FirstName FROM Contact WHERE Id = :id];
    }


    public List<Contact> findByIds(List<String> ids) {
        return [SELECT Id, FirstName FROM Contact WHERE Id = :ids];
    }
}
