/**
 * @author warleyalmeida - BRQ
 */

@isTest
public class LeadFixtureFactory {

    public static Lead createLead(String lastName, String documentNumber, City__c city) {
        return createLead(newLead(lastName, documentNumber, city));
    }

    public static Lead newLead(String lastName, String documentNumber, City__c city) {
        return new Lead (LastName = lastName,
                        Company = 'Teste Company',
                        DocumentNumber__c = documentNumber,
                        City__c = city.Id,
                        State = city.State__c);

    }

    public static Lead createLead(Lead lead){
        insert lead;
        return lead;
    }

    public static Lead fromJson(String payload) {
        return (Lead) JSON.deserialize(payload, Lead.class);

    }


    public static Map<String, SObject> integratedScenario() {
        Map<String, SObject> records = new Map<String, SObject>();

        City__c city = CityFixtureFactory.createCity('Santa Catarina', 'SP', 12345);

        records.put('city', city);

        Lead lead = createLead('Warley name', '05436421199', city);

        records.put('lead', lead);

        return records;
    }

}