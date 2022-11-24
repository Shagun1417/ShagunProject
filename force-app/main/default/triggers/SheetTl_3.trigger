//"Create a field on Account called “Out_of_Zip”, checkbox, default off
//Assignment:
//When a Billing Address is modified, get the new Postal Code. Then check which Contacts on 
///the Account are outside that Postal Code. If 1 or more Contacts are outside of the Postal Code,
//mark Out_of_Zip as TRUE."
//
//not done error in before update or update dml
trigger SheetTl_3 on Account ( After update) {
  // map<ID, Account> m = new  map<ID, Account>();
  List<Id> accid=new List<Id>();
    for(Account acc: Trigger.new){
        //m.put(acc.Id,acc);
        accid.add(acc.Id);
    }
    
        List<Account> updateField = new List<Account>();
        List<Account> accList= [Select Out_of_Zip__c, BillingPostalCode,
                                (Select MailingPostalCode From Contacts) From Account Where id In: accid];  
    for(Account a: accList)
    {
       // Integer count;
        for(Contact con:a.Contacts){
            System.debug(a.BillingPostalCode);
             System.debug(con.mailingPostalCode);
     //       if(m.get(a.Id).BillingPostalCode==con.MailingPostalCode)
            if(a.BillingPostalCode!=con.MailingPostalCode)
            {
                  System.debug('if'+con.mailingPostalCode);
            a.Out_of_Zip__c=True;   
               
            }
            else
            {
                 System.debug('else'+con.mailingPostalCode);
                //  a.Out_of_Zip__c=True;   
            }
            
       }
    //updateField.add(a);
   
    } 
     update accList;
    
}