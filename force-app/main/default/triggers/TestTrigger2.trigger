trigger TestTrigger2 on OpportunityLineItem (After insert, After update) {
    List<OpportunityLineItem> olpList=new List<OpportunityLineItem>();
    Set<id> oliId= new Set<id>();
    Set<id> acid= new Set<id>();
    List<OpportunityLineItem> oliList=new  List<OpportunityLineItem>();
    Id oli;
    Map<Id, List<OpportunityLineItem>> m1 = new Map<Id,  List<OpportunityLineItem>>();
    
    decimal count=0;
    
    For(OpportunityLineItem op:trigger.new){
       // count=op.Quantity;
        oliId.add(op.OpportunityId);  
        //   m1.put(op.Id, op.);
        
    }
    List<OpportunityLineItem> opl1=[Select Quantity from OpportunityLineItem where Opportunityid in: oliId];
    for(OpportunityLineItem o1:opl1)
    {
       count= count + o1.Quantity;
    }
    //   integer count=0;
    
    List<Opportunity> oplist=[select id, AccountId from Opportunity where id in:oliId];
    for(Opportunity o:oplist){ 
        //for(OpportunityLineItem oli:o.OpportunityLineItems){
        //count++;    
        //     List<OpportunityLineItem> oliList=[Select id, Quantity from OpportunityLineItem where OpportunityId in: o.id];
        //  oliList.add
        acid.add(o.AccountId);  
     //   m1.put(o.Id,oliList );
      //  oli=o.Id;
    }
    
     List<Account> updateField = new List<Account>();
    List<Account> accList =[Select id, Total_Quantity__c From account Where id in: acid];    
    for(Account acc: accList )
    {
        acc.Total_Quantity__c= count;
        
updateField.add(acc);
    
}
    update updateField;
}