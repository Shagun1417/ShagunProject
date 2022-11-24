//Print the Account Names in Alphabetical accending order.
public class Script_1_8 {
    public static void main()
    {
	List <Account> A1=[SELECT name from Account Order By name];
    for(Account A2:A1)
    {
        System.debug(A2);
    }
    }
}