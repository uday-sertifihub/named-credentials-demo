@isTest
public class HelloWorldTest {
    @isTest
    static void testSayHello() {
        // Create an instance of the HelloWorld class
        HelloWorld hw = new HelloWorld();
        
        // Call the sayHello method and store the result
        String result = hw.sayHello();
        
        // Verify the result is as expected
        System.assertEquals('Hello World!', result, 'The sayHello method did not return the expected result.');
    }
}