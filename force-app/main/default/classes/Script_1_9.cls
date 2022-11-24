//"Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'"
public class Script_1_9 
{
    public static void main()
    {
        List<Account> A1=[SELECT name from Account];
        for(Account A2:A1)
        {
            System.debug(A2.name.reverse());
        }
    }
}