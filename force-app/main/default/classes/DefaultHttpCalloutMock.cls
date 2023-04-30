/**
 * @author warleyalmeida - brq
 */

public class DefaultHttpCalloutMock implements HttpCalloutMock {

    String payload;
    Integer statusCode;

    public DefaultHttpCalloutMock(String payload) {
        this.payload = payload;
        this.statusCode = 200;       
    }

    public DefaultHttpCalloutMock(String payload, Integer statusCode) {
        this.payload = payload;
        this.statusCode = statusCode;
    }


    public HttpResponse respond(HttpRequest request) {
       
        HttpResponse response = new HttpResponse();
        response.setStatusCode(statusCode);
        response.setBody(payload);

        return response;
    }
}