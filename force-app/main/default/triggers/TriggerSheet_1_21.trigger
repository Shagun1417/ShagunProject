/*Create a CheckBox with 'Allow Multiple' on Account Objectwhen this CheckBox is Checkeduser can create Multiple Contacts
 *  within its Account associated and when it is UnChecked user cannot able to create Multiple Contacts.*/
trigger TriggerSheet_1_21 on Contact (before insert) {
Set<Id> cid=new Set<Id>();
    Integer i=0;
    for(Contact con : Trigger.new)
    {
       cid.add(con.accountId);
    }
    List<Account> acc = [SELECT Id, Allow_Multiple__c,(Select id From Contacts)From Account Where id in : cid];
       // List<Account> ac=[select id,Allow_multiple__c,(select id from contacts) from account where id in:sid];
       for(Account a:acc)
       {
           for(Contact con1 : a.Contacts)
           {
               if (a.Allow_Multiple__c== false)
               {
                   ++i;
               }
           }
       }
    for(Contact c: Trigger.new)
   if(i!=0)
   {
       c.addError('tick allow multipple to enter account');
   }

    
    
}