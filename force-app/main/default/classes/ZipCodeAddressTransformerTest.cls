/**
 * @author warleyalmeida - brq
 */

@isTest
public  class ZipCodeAddressTransformerTest {

    @isTest
    public static void givenZipCodeAddressResponseWhenConvertThenReturnNewAccountWithBillingAddress() {
        // given
        String payload = ' { "cep": "01001000", "logradouro": "Praça da Sé", "complemento": "lado ímpar", "bairro": "Sé", "localidade": "São Paulo", "uf": "SP", "unidade": "", "ibge": "3550308", "gia": "1004", "ddd": "11", "siafi": "7107" } ';

        ZipCodeAddressResponse response = ZipCodeAddressResponse.fromJson(payload);

        Test.startTest();
        ZipCodeAddressTransformer transformer = new ZipCodeAddressTransformer();

        // when
        Account account = transformer.toAccount(response);


        // then

        Test.stopTest();

        System.assertEquals(response.logradouro, account.BillingStreet);
        System.assertEquals(response.localidade, account.BillingCity);
        System.assertEquals(response.uf, account.BillingState);
        System.assertEquals(response.cep, account.BillingPostalCode);

        
    }

}