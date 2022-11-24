trigger TestTrigger3 on OpportunityLineItem (After insert, After update) {
    map<ID,Decimal> m = new  map<ID,Decimal>();
    List<Aggregateresult> agList = [select  OpportunityId aid, sum(Quantity) cid from OpportunityLineItem  group by OpportunityId ];
    for(Aggregateresult r : agList){
        m.put( (ID)r.get('aid'), (Decimal)r.get('cid') );
    }
   // system.debug('key :'+m.keyset());
    //system.debug('values :'+m.values());
    set<ID> setId = new set<Id>();
    for(OpportunityLineItem op : trigger.new){ 
        setId.add(op.OpportunityId);
    } 
    map<ID,Decimal> ma = new  map<ID,Decimal>();
    List<Opportunity> opList = [Select Accountid ,id from Opportunity where id IN :setId]; 
    for(Opportunity opId : opList){
        ma.put(opId.Accountid,m.get(opId.id));
    }
    //system.debug('key :'+ma.keyset());
     //system.debug('values :'+ma.values());
    
    List<Account> updateField = new List<Account>();
    List<Account> acli = [select Name ,Total_Quantity__c from Account where id IN :ma.keyset()];
    for(Account ac : acli ){
        System.debug('name : '+ac.Name);
        //System.debug('get : '+ma.get(ac.id));
        ac.Total_Quantity__c=ma.get(ac.id);
        //      System.debug( ac.Total_Quantity__c);
        updateField.add(ac);
    }
    if(!updateField.isEmpty()){
        update updateField;
    }
}