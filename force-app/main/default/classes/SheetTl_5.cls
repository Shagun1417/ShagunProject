//Get Total Amount of only those Opportunity whose Opportunity's close date falls in next 30 days 
//and OpportunityLineItem quantity is more than 50.
// and OpportunityLineItem quantity is more than 50.
public class SheetTl_5 {
    public static void mymethod(){
        //  List<Opportunity> oppList=[Select Amount,Id,(Select Quantity From OpportunityLineitems Where quantity > 50) From Opportunity];
        //for(Opportunity opp: oppList){
        //System.debug(oppList);
        map<ID,Decimal> m = new  map<ID,Decimal>();
        List<Aggregateresult> agList = [select  OpportunityId aid, sum(Quantity) cid from OpportunityLineItem  group by OpportunityId ];
        for(Aggregateresult r : agList){
            m.put( (ID)r.get('aid'), (Decimal)r.get('cid') );
          //  system.debug('key :'+m.keyset());
        //    system.debug('values :'+m.values());
           
        }
        Decimal sum=0;
          List<Opportunity> oppList= [Select Amount, Name, CloseDate from Opportunity where id IN: m.Keyset()];
        for(Opportunity opp:oppList){
        if(m.get(opp.ID)>5 && (opp.CloseDate < date.today()+30 && opp.CloseDate >= date.today()) ){
            //   if(m.get(opp.ID)>5){
                System.debug('opp Name  '+ opp.Name+' Amount  '+opp.Amount);
                  sum= sum+opp.Amount;
                  
            }
        }
        System.debug('Total Amount  '+ sum);
       //  system.debug('key :'+m.keyset());
      //   system.debug('values :'+m.values());
    }
}