//On Opportunity to alert the user when an Opportunity is being closed with no Opportunity line items in it.
trigger TriggerSheet_6 on Opportunity (before insert) {

   Set<id> oppid= new Set<id>();
    
    For(Opportunity op:trigger.new){
   oppid.add(op.id);
        
    }
           integer count=0;
    
    List<Opportunity> oplist=[select id,(select id from OpportunityLineItems) from Opportunity where id in:oppid];
    for(Opportunity o:oplist){
        for(OpportunityLineItem opl:o.OpportunityLineItems){
              count++;   
        }                             
    }
     For(Opportunity op1:trigger.new){
         if(count==0 && op1.StageName=='Closed won'){
             op1.adderror('Stage is closed without any OLI');
         }
    }
}