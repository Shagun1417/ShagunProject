//Create a Script to find out all the users in the systems who are having more than 20 Leads allocated[Owner] to them in month of feb 2019
public class Script_2_8 
{
    public static void myMethod()
    {
        
        List<AggregateResult> ld=[select owner.name from lead group by owner.name having count(id)>20];
        for(AggregateResult l:ld)
        {
            
            system.debug(l);
            
        }
    }
}