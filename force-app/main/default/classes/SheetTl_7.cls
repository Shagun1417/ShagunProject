/*"Write a Script to get all the Products Name(in a list) which were sold with Quantity(Opportunitylineitem) > 100
 *  under their Opportunities(CLOSED WON only).
Note - Consider Only that OpportunityLineItems whose first enterd Quantity value > 100.
For example - OpportunityLineItem - OppL1 (Product - p)-> Quantity = 120
 OppL2 (Product - p1)-> Quantity = 80
 OpplL3 (Product - p1) -> Quantity = 30
Only OppL1 should be considered for ProducName."*/

public class SheetTl_7 {
    public static void myMethod(){
      Decimal num;
        List<String> strList=new List<String>();
   List<Opportunity> oppList=[Select Id,Name,(Select Id, Name, Quantity from OpportunityLineItems) 
                              From Opportunity where StageName='Closed won'];     
        for(Opportunity opp:oppList){
            for(OpportunityLineItem oli:opp.OpportunityLineItems){
            num= oli.Quantity;
               //System.debug(oli.Name);
                if(oli.Quantity>100)
                {
                    strList.add(oli.Name);
                }
                Break;
            }
        }
        System.debug(strList);
    }
}