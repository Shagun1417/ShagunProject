//"create a checkbox field on contact ""copy address to contact"". Write a script to find all the contact
//with this field as true and copy the billing address from account in its related contact in which the
//field is true."
public class ScriptTl_2 {
    public static void myMethod(){
        Set<Id> conId= new Set <Id>();
List<Contact> conList= [Select AccountId from Contact where Copy_Address_To_Contact__c = true AND AccountId!=null];
        for(Contact con : conList){
            conId.add(con.AccountId);
        }
        List<Contact>updateList=new List<Contact>();
       List<Account> accList =[Select BillingAddress, BillingStreet, BillingPostalCode, BillingCity, BillingState,
                               BillingCountry,  (select id from Contacts)  FROM Account Where ID IN: conId];
         for(Account acc: accList){
            for(Contact con: acc.Contacts ){
               // if(con.AccountId == acc.Id){
                    con.MailingStreet=acc.BillingStreet;
                  con.MailingPostalCode=acc.BillingPostalCode;
                    con.MailingCity=acc.BillingCity;
                    con.MailingState=acc.BillingState;
                    con.MailingCountry=acc.BillingCountry;                   
             updateList.add(con);
             //   }
            }
             
        }     
        update updateList;
}
}