/**
 * @author warleyalmeida - BRQ
 */

 @isTest
public class CityFixtureFactory {
    
    public static City__c createCity (String name, String state, Integer ibgeCode) {
        return createCity(newCity(name,state,ibgeCode));
    }

    public static City__c newCity (String name, String state, Integer ibgeCode) {
        return new City__c (
            CityName__c = name,
            State__c = state,
            IBGECode__C = ibgeCode
        );
    }

    public static City__c createCity (City__C city) {
        insert city;
        return city;
    }
}