/**
 * @author warleyalmeida - brq
 */

@isTest
public class LeadCtrlTest {


    @isTest
    public static void givenValidLeadRequestWhenCreateLeadThenReturnCreatedLead(){


        City__c city = CityFixtureFactory.createCity('SJC', 'SP', 133255);
        String payload = '{"LastName": "New Lead Bisso", "DocumentNumber__c": "33237948349", "Company": "New Wsa Company", "City__r": {"IbgeCode__c": "133255"}, "State": "SP"}';

        Lead lead = LeadFixtureFactory.fromJson(payload);

        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();

        Test.startTest();

        LeadCtrl.create(lead);

        Test.stopTest();

        System.assertEquals(200, RestContext.response.statusCode);
        Blob response = RestContext.response.responseBody;
        Lead storedLead = LeadFixtureFactory.fromJson(response.toString());
        System.assert(storedLead.Id != null);


    }

    @isTest
    public static void givenLeadWithInvalidCityRequestWhenCreateLeadThenReturnErrorMessageAndLead (){


        String payload = '{"LastName": "New Lead Bisso", "DocumentNumber__c": "33237948349", "Company": "New Wsa Company", "City__r": {"IbgeCode__c": "133255"}, "State": "SP"}';

        Lead lead = LeadFixtureFactory.fromJson(payload);

        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();

        Test.startTest();

        LeadCtrl.create(lead);

        Test.stopTest();

        System.assertEquals(400, RestContext.response.statusCode);

        Blob response = RestContext.response.responseBody;

        System.debug(response.toString());

        LeadCtrl.LeadErrorResponse errorResponse = (LeadCtrl.LeadErrorResponse ) JSON.deserialize(response.toString(), LeadCtrl.LeadErrorResponse.class);

        System.assert(errorResponse != null);
        System.assert(errorResponse.message != null);



    }

    @isTest
    public static void givenUnExpectedExceptionWhenCreateLeadThenReturnErrorMessageAndLead (){


        RestContext.response = new RestResponse();

        Test.startTest();
        LeadCtrl.leadRepository = null;

        LeadCtrl.create(new Lead());

        Test.stopTest();

        System.assertEquals(400, RestContext.response.statusCode);

        Blob response = RestContext.response.responseBody;

        System.debug(response.toString());

        LeadCtrl.LeadErrorResponse errorResponse = (LeadCtrl.LeadErrorResponse ) JSON.deserialize(response.toString(), LeadCtrl.LeadErrorResponse.class);

        System.assert(errorResponse != null);
        System.assert(errorResponse.message != null);



    }

    @isTest
    public static void givenValidLeadIdWhenRequestShowThenReturnLead() {

        Map<String,SObject> records = LeadFixtureFactory.integratedScenario();
        Lead expectedLead = (Lead) records.get('lead');

        RestContext.request = new RestRequest();
        RestContext.request.params.put('Id', expectedLead.Id);

        Test.startTest();

        Lead storedLead = LeadCtrl.show();

        Test.stopTest();


        System.assertEquals(expectedLead.Id, storedLead.Id);
        System.assert(storedLead.City__c != null);

    }
 
}