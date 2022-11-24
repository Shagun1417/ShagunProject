//Sheet Script-1, Q-2
//Create 10 Contacts with diferent Account(LookUp) values(Relationship with no same 2 accounts) in them.
public virtual class Script_1_2 {
    public virtual void myMethod()
    {
        List<Contact> conList=new List<Contact>();
        List<Account> aList = [Select id from Account LIMIT 10];
  		for(Account a: aList)
        {
             Contact con=new Contact();
            con.LastName='Singh';
            con.AccountId= a.id;
            con.Email='abc@gmail.com';
            conList.add(con); 
            
        }
        //Insert conList;
        System.debug(conList);
           }

}