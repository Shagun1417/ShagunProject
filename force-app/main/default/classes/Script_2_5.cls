//Create several Accounts and Opportunites and products. 
//Write a Script to get all the Accounts having more than 2 Opportunites with Closed Won."

public class Script_2_5
{
    public static void myMethod()
    {
        Opportunity o=new  Opportunity();
        List<Opportunity> opp= [SELECT Account.Name From Opportunity WHERE StageName='Closed Won'];
        //  for( Opportunity o1:opp)
        {
            
            // System.debug(o1);
        }
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
            
            if(count > 2 )  
                System.debug(opp.get(i));  
        }  
    }  
}