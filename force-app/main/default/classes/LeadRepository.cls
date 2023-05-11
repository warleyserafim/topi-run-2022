/**
 * @author warleyalmeida - BRQ
 */

public virtual class LeadRepository extends AbstractRepository {
    
    virtual
    public List<Lead> findByLastName(String name) {
        return [
            SELECT Id, LastName,City__c
            FROM Lead
            WHERE LastName = :name
        ];
    }


    virtual
    public Lead findById(String Id){

        List<Lead> leads = [
            SELECT Id, LastName,City__c
            FROM Lead
            WHERE Id = :Id
        ];

        return leads.isEmpty() ? null : leads.get(0);
    }
}