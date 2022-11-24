//Create 20 new Accounts Records in salesforce with atleast 5 fields filled.
//Sheet Script-1, Q-1
public class Script_1_1 {
    public static void myMethod()
    {

             List<Account> aList=new List<Account>();
             for(Integer i=1;i<=5;i++)
        {
              Account ac=new Account();
            ac.Name='amit'+i;
            ac.AccountNumber='10'+i;
            ac.Phone='123456789'+i;
          	ac.Website='WWW.String.com';
			ac.Site='WWW.Google.com';
            aList.add(ac);
        }
    Insert aList;
    }

}