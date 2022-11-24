//Sheet Script-1, Q-3
//Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
public class Script_1_3 {
    public static void myMethod()
    {
List<Opportunity> opList=new List<Opportunity>();
        for(Integer i=1;i<=10;i++)
        {
Opportunity opp=new Opportunity();            
           opp.StageName= 'Closed won';
            opp.CloseDate=Date.newInstance(2022,08,01);
            opp.Name= 'Singh'; 
            opList.add(opp);
        }
        Insert opList;
        
           }}