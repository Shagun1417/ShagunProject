//Update all Opportunity with future Closed Date by Opportunity Name=Opportunity Name + ' Updated'

public class Script_1_6 {
public static void myMethod()
{
    //List<Opportunity> oppList1=new List<Opportunity>();
    List<Opportunity> oppList=[SELECT Name,CloseDate FROM Opportunity LIMIT 2] ;
    for(Opportunity o:opplist)
    {	
    //Opportunity opp=new Opportunity();
    o.CloseDate= Date.newInstance(2022, 8, 15);
    o.Name=o.Name+'Updated';
    }
    
  //System.debug(oppList1);
	Update oppList;
}
}