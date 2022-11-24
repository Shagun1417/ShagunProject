//In Account Object create a Multi picklist ""Working in (ASIA, EMA, NA, SA)"" Multi picklist.
// Write a script to get the total Quantity of Products sold in only Accounts working in ASIA."
public class SheetTl_9 {
    public static void myMethod(){
        set<Id> idopp = new set<Id>();
        List<Account> accList=[Select Id,(Select Id From Opportunities ) from Account where Working_in__c='ASIA'];
        for(Account acc:accList){
            for(Opportunity opp : acc.Opportunities){
                idopp.add(opp.Id);
            }
        }
        map<Id,Decimal> m= new map<Id,Decimal>();
        List<AggregateResult> agList= [Select OpportunityId aid, Sum(Quantity) cid From OpportunityLineItem
                                       Where OpportunityId In:idopp Group by OpportunityId];  
        for(AggregateResult r: agList)
        {
            m.put((Id)r.get('aid'),(Decimal)r.get('cid'));
        }
        for(Id i :m.Keyset())
        {
            System.debug(i+'==> '+m.get(i));
        }
    }
}