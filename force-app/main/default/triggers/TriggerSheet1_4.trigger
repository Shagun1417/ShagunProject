//On Contact to update the Account Name field with contact Last Name, concatenated in the end.
// Example: If you Create A Contact whose FirstName='Sarthak' and LastName='Saxena' and the Accountname ='Tata',
// Then Account name must become 'TataSaxena'.
trigger TriggerSheet1_4 on Contact (After insert)
{
    
    set<id> aid= new set<id>();
    string last;
    for(Contact con : Trigger.New)
    {
        aid.add(con.AccountId);
     last=con.LastName;     
    }
    
    List<Account> acl= [select name from account where id in:aid];
    
    for(account a:acl){
        
        a.name=a.name+ ' '+last;
        update acl;
    }
    
}