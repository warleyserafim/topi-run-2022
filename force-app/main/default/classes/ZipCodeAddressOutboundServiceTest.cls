/**
 * @author warleyalmeida - brq
 */

@isTest
public class ZipCodeAddressOutboundServiceTest {

    @isTest
    public static void givenValidZipCodeWhenGetZipCodeAddressThenReturnAccountWithBillingAddress() {

        String expectedZipCode = '01001000';

        Test.setMock(HttpCalloutMock.class, new ZipCodeAddressOutboundServiceMock());
        Test.startTest();

        ZipCodeAddresOutboundService service = new ZipCodeAddresOutboundService();

        Account account = service.findAddress(expectedZipCode);

        Test.stopTest();

        System.assertEquals(expectedZipCode, account.BillingPostalCode);
    }


    public class ZipCodeAddressOutboundServiceMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {

            String expectedZipCode = '01001000';

            String responseBody = '{"cep": "' + expectedZipCode + '", "logradouro": "Praça da Sé", "complemento": "lado ímpar", "bairro": "Sé", "localidade": "São Paulo", "uf": "SP", "unidade": "", "ibge": "3550308", "gia": "1004"}';

            HttpResponse response = new HttpResponse();

            response.setStatusCode(200);
            response.setBody(responseBody);

            return response;
        }
    }

}