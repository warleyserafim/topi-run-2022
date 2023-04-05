/**
 * @author warleyalmeida - BRQ
 */
@isTest
public  class LeadRepositoryTest {
   
    @isTest
    public static void givenValidLeadWhenFindByNameThenReturnCreatedLead(){
        Map<String, SObject> records = LeadFixtureFactory.integratedScenario();

        City__c city = (City__c) records.get('city');

        Lead lead = (Lead) records.get('lead');

        LeadRepository repository = new LeadRepository();


        List<Lead> leads = repository.findByLastName(lead.LastName);

        System.assertEquals(city.Id, leads.get(0).City__c);
    }
}