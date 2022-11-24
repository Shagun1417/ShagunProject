//Test class to test the trigger
@isTest
public class MyTrigger1Test {
    @isTest
    static void CreateInlidContact()
    {
        contact con = new contact(FirstName='John', LastName='INVALIDNAME');
    
    Test.startTest();
        Database.SaveResult result= Database.insert(con,false);
        Test.stopTest();
        System.assert(!result.isSuccess());
    }
}