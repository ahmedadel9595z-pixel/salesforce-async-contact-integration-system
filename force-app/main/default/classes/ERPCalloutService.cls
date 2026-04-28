public class ERPCalloutService {

    public static HttpResponse sendContact(Contact con) {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:ERP_API/contacts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        req.setBody(JSON.serialize(con));

        Http http = new Http();

        return http.send(req);
    }
}