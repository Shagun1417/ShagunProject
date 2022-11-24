@isTest
public class Script_1_6Test {
    @isTest
    public static void main()
    {
        //  Opportunity opp=new Opportunity();
        List<Opportunity> opp1=new  List<Opportunity>();
        for(Integer i=0;i<=1;i++)
        {
          Opportunity opp=new Opportunity();
            opp.Name='Shagun'+i;
            opp.CloseDate=date.newInstance(2022,8,31);
            opp.StageName='Closed Won';
         opp1.add(opp);
            
        }
        insert opp1;
        
        Script_1_6.myMethod();
    }
}