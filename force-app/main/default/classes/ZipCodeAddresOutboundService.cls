/**
 * @author warleyalmeida - brq
 */

public class ZipCodeAddresOutboundService {

    private static final String ZIPCODE_ADDRESS_URL = 'https://viacep.com.br/ws/';
    ZipCodeAddressTransformer transformer;

    public ZipCodeAddresOutboundService() {
        this.transformer = new ZipCodeAddressTransformer();

    }

    public Account findAddress(String zipCode) {

        Http http = new Http();

        HttpResponse response = http.send(buildRequest(zipCode));

        ZipCodeAddressResponse zipCodeAddressResponse = buildZipCodeAddressResponse(response);

        return this.transformer.toAccount(zipCodeAddressResponse);

    }


    public HttpRequest buildRequest(String zipCode) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ZIPCODE_ADDRESS_URL + zipCode + '/json/');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json; charset=utf-8');
        return request;
    }


    public ZipCodeAddressResponse buildZipCodeAddressResponse(HttpResponse response) {

        if (response.getStatusCode() != 200) return null;

        return (ZipCodeAddressResponse) JSON.deserialize(response.getBody(), ZipCodeAddressResponse.class);


    }
}