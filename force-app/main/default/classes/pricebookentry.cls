//On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$

public class pricebookentry {
    
    public static void myMethod()
    {
       /* Product2 pro = new Product2();
        pro.name = 'Laptop';
        pro.isActive= true;
        insert pro;*/
        
        //List<id> sid = new List<id>();
     //   id sp = [select id from Pricebook2 where isStandard=true limit 1].id;
        
      //  pricebookentry pbe = new pricebookentry();
    //    pbe.Pricebook2Id=sp;
      //  pbe.Product2Id=pro.id;
       // pbe.UnitPrice= 1;
        //insert pbe;
        
        List<Opportunity> oppList= [Select id, (Select id FRom OpportunityLineItems) From Opportunity Where StageName='Closed Won'];
        for(Opportunity opp: oppList)
        {
            for(OpportunityLineItem o:opp.OpportunityLineItems)
            {
                if(opp.OpportunityLineItems.size()==0)
                    opp.addError('hello');
            }
        }
        
    }
}