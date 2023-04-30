/**
 * @author warleyalmeida - brq
 */

@isTest
public class ZipCodeAddressOutboundServiceTest {

    @isTest
    public static void givenValidZipCodeWhenGetZipCodeAddressThenReturnAccountWithBillingAddress() {

        String payload = '{"cep": "01001000", "logradouro": "Praça da Sé", "complemento": "lado ímpar", "bairro": "Sé", "localidade": "São Paulo", "uf": "SP", "unidade": "", "ibge": "3550308", "gia": "1004"}';
        String expectedZipCode = '01001000';

        Test.setMock(HttpCalloutMock.class, new DefaultHttpCalloutMock(payload));
        Test.startTest();

        ZipCodeAddresOutboundService service = new ZipCodeAddresOutboundService();

        Account account = service.findAddress(expectedZipCode);

        Test.stopTest();

        System.assertEquals(expectedZipCode, account.BillingPostalCode);
    }

}