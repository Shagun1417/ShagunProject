//Create a trigger on Opportunity to add all the Contacts having the same Account as Opportunity.
//Account into the Opportunity "Contact Roles"
//Example:- Account: Birla have 3 Contacts: ajay,amar,anuj 
//Then while creating an Opportunity for Birla add ajay,amar & anuj to Opportunity Contact roles--T

trigger TriggerSheet_1_7 on Opportunity (After insert) {
   if(Trigger.isInsert && Trigger.isAfter){
        set<id> acid = new Set<id>();
                List<id> opid = new List<id>();

        for(Opportunity opp:Trigger.new){
            acid.add(opp.AccountId);
            opid.add(opp.id);
            
        }
       
      List<Account> acList=[select name,(select id from contacts) from account where id in:acid];
        for(Account ac:acList){
            for(Contact co:ac.contacts){

OpportunityContactRole ocr= new OpportunityContactRole();
                ocr.ContactId=co.id;
                ocr.OpportunityId=opid[0];
                insert ocr;
            }
            
        }
   }}
    /*
Set<Id> accid=new Set<Id>();
    List<id> oppList=new List<id>();
    for(Opportunity opp:Trigger.new)
    {
        accid.add(opp.AccountId);
        oppList.add(opp.id);
        
    }
    List<Account> acc= [SELECT name,id,(SElect id , name From Contacts) from Account Where id in:accid];
    for(Account a:acc)
    {
        for(Contact c: a.contacts)
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.ContactId = c.id;
        ocr.OpportunityId= oppList[0];
        insert ocr;
    }
}*/