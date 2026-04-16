@isTest
public class stripeActionTest {

    @isTest
   public   static void  testCreateStripeCustomer() {
       // Test.setMock(HttpCalloutMock.class, new StripeMock());

        // Create test Account (without Consumer_Id__c)
        Account acc = new Account(
            Name = 'Test Account',
            Email__c = 'test@gmail.com'
        );
        insert acc;

        // Create Contact
        Contact con = new Contact(
            LastName = 'Test Contact',
            Email = 'test@gmail.com',
            AccountId = acc.Id
        );
        insert con;

       // Test.startTest();

        // Call method
        List<String> result = stripeAction.myMethod(acc.Id);

        //Test.stopTest();

        // Verify result
        System.assert(result != null);
    }
    
    
    
    @isTest
   public   static void  testCreateStripeCustomer1() {
       // Test.setMock(HttpCalloutMock.class, new StripeMock());

        // Create test Account (without Consumer_Id__c)
        Account acc = new Account(
            Name = 'Test Account',
            Email__c = 'test@gmail.com'
        );
        insert acc;

        // Create Contact
        Contact con = new Contact(
            LastName = 'Test Contact',
            Email = 'test@gmail1.com',
            AccountId = acc.Id
        );
        insert con;

       // Test.startTest();

        // Call method
        List<String> result = stripeAction.myMethod(acc.Id);

        //Test.stopTest();

        // Verify result
        System.assert(result != null);
    }

    @isTest
    static void  testExistingStripeCustomer() {
       // Test.setMock(HttpCalloutMock.class, new StripeMock());

        // Create Account with Consumer_Id__c
        Account acc = new Account(
            Name = 'Test Account 2',
            Email__c = 'test2@gmail.com',
            Consumer_Id__c = 'cus_12345'
        );
        insert acc;

      //  Test.startTest();

        // Call method
        List<String> result = stripeAction.myMethod(acc.Id);

      //  Test.stopTest();

        System.assert(result != null);
    }

    @isTest
    static void  testFutureMethod() {
      //  Test.setMock(HttpCalloutMock.class, new StripeMock());

        Account acc = new Account(
            Name = 'Future Test',
            Email__c = 'future@gmail.com'
        );
        insert acc;
        Contact con = new Contact(AccountId= acc.Id,LastName='singh', Email='abc@gmail.com');
         insert con;
     //   Test.startTest();

        stripeAction.updateAccount(acc.Id, 'cus_test_999');

       // Test.stopTest();

        // Verify update
        Account updatedAcc = [SELECT Consumer_Id__c FROM Account WHERE Id = :acc.Id];
      //  System.assertEquals('cus_test_999', updatedAcc.Consumer_Id__c);
    }
    
    
    
}