///Update the above trigger to delete the Last Name from the Account field 
//when a Contact is deleted without deleteing the other Last name.
trigger TriggerSheetNew_1_5 on Contact (after update, after delete) {
 /*   if(Trigger.isdelete)
    {
        Set<Id> accid= new Set<Id>();   
        for(Contact con: Trigger.old)
        {
            accid.add(con.AccountId);
        }
        List<Account> acc =[SELECT Name From Account WHERE Id=:accid];
            for(Account a: acc)
        {
            for(Contact c: Trigger.old)
            {
               Account acc2=new Account();
                String[]str= a.name.split(c.LastName);
                a.Name=str[0];
                
                
            }
            Update a;
        }
    }*/
    if(Trigger.isdelete)
    {
        Set<id> conid = new Set<id>();
        for(Contact con:Trigger.old)
        {
            conid.add(con.AccountId);
        }
        List<Account> acc=[SELECT Name From Account WHERE Id=:conid];
        for(Account a: acc) 
        {
            for(Contact c: Trigger.old)
            {
              // Account acc = new Account();
                String[]str=a.name.split(c.Lastname);
                a.Name=str[0];
            }
            update a;
        }
    }

}