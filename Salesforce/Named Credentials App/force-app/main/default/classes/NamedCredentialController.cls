public with sharing class NamedCredentialController {
    public String response { get; set; }
    public String manualApiEndpoint { get; set; }
    
    public NamedCredentialController() {
        response = '';
        manualApiEndpoint = 'manual_api_nc';
    }
    
    public void callApi(String endpoint) {
        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            
            Http http = new Http();
            HttpResponse res = http.send(req);
            
            if (res.getStatusCode() == 200) {
                response = res.getBody();
            } else {
                response = 'Error: ' + res.getStatus() + ' - ' + res.getBody();
            }
        } catch (Exception e) {
            response = 'Exception: ' + e.getMessage() + ' - ' + e.getStackTraceString();
        }
    }  
    
    public void callPackagedApi() {
        callApi('callout:daypack01__package_api_nc/WeatherForecast');
    }
    
    public void callUnpackagedApi() {
        callApi('callout:' + manualApiEndpoint + '/WeatherForecast');
    }
}