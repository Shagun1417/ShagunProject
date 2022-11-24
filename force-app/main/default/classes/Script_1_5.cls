//Delete all contacts belonging to Accounts Name FIELD having 'A' in them.
public class Script_1_5 {
public static void myMethod()
{
    //we are acessing the parent data (account) From child( contact)
List<Contact> AList= [select name, Account.name from Contact where Account.name like '%A%' LIMIT 3];
//System.debug(AList);
  delete Alist;
}
}