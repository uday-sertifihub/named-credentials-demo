@isTest
public class NamedCredentialControllerTest {
    
    @isTest
    static void testCallApi() {
        // Set up mock response
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setHeader('Content-Type', 'application/json');
        mockResponse.setBody('[{"date":"2024-10-25","temperatureC":-4,"temperatureF":25,"summary":"[Free] Chilly"}]');
        mockResponse.setStatusCode(200);
        
        // Set up mock HTTP callout
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockResponse));
        
        // Instantiate the controller and call the method
        NamedCredentialController controller = new NamedCredentialController();
        controller.callPackagedApi();
        
        // Verify the response contains expected data
        System.assert(controller.response.contains('"date":"2024-10-25"'), 'Expected date not found in response');
        System.assert(controller.response.contains('"temperatureC":-4'), 'Expected temperatureC not found in response');
        System.assert(controller.response.contains('"summary":"[Free] Chilly"'), 'Expected summary not found in response');
    }
        
    // Mock HTTP response generator
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private HttpResponse response;
        
        public MockHttpResponseGenerator(HttpResponse response) {
            this.response = response;
        }
        
        public HttpResponse respond(HttpRequest req) {
            return response;
        }
    }
}