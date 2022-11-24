//  Write a script to get all the Account having more than 10 opportunities 
//  whose status is closed won and the close date is between one month..
public class Script_2_6
{
    public static void myMethod()
    {
        Opportunity o=new  Opportunity();
        List<Opportunity> opp= [SELECT Account.Name From Opportunity WHERE StageName='Closed Won'  AND CloseDate > LAST_MONTH];
        Integer count;
        for(integer i = 0; i <opp.size(); i++) 
        {  
            count = 1;  
            for(integer j = i+1; j <opp.size(); j++)
            {  
                if(opp.get(i)==opp.get(j))                    
                {
                    count++;  
                }  
            }  
            if(count > 10 )  
                System.debug(opp.get(i));  
        }  
    }
}