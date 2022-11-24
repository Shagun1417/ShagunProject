//"Create 2 custom lookup fileds ""AccountLookup"" and ""ContactLookup"" in Lead . 
//If the Lead status is ""Working-Contacted"" or ""Closed-Converted"" and
//Number of Employees are greater than 100, than a contact should be inserted in 
//Lead's ""ContactLookup"" and the contact's parent account should be in Lead's ""AccountLookup""."

public class SheetTl_6 {
    public static void myMethod(){
       // List<Id> idList=new List<Id>();
        Id i;
        Id cid;
        List<Account> accList=[Select Id,(Select Id from Contacts) from Account Limit 1];
        for(Account acc : accList){
            for(Contact con: acc.Contacts){
                cid=con.Id;
            }
      // idList.add(acc.Id);
      i=acc.Id;
        }
        List<Lead> lList=[Select  AccountLookup__c, ContactLookup__c from Lead
                          Where (Status = 'Working - Contacted' OR Status ='Closed - Converted') AND NumberOfEmployees>150];
        for(Lead l:lList){
            l.AccountLookup__c=i;
            l.ContactLookup__c=cid;
           // System.debug(l.Name);
        }
        Update lList;
    }
}