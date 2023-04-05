/**
 * @author warleyalmeida - BRQ
 */

public class LeadRepository extends AbstractRepository {
    

    public List<Lead> findByLastName(String name) {
        return [
            SELECT Id, LastName,City__c
            FROM Lead
            WHERE LastName = :name
        ];
    }
}