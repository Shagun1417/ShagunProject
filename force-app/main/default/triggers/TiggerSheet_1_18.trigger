/*Script -
Create a look up[Lead] on product so that Products come over in related list of a Lead. 
Write script to create 3 Leads and 5 Products with Lead lookup field.
Trigger -
Write a Trigger to stop creating or updating Opportunities with
Account having "Working in = ASIA" and Already 2 Closed Won Opportunity under same Account.*/
trigger TiggerSheet_1_18 on Opportunity (before insert) {
   Set<id> acid=new set<id>();
        for(Opportunity opp:trigger.new){
           acid.add(opp.Accountid);
            }
            
    List<Account> acc= [select name,(Select id from Opportunities 
                                     where stagename='Closed won') from account where id in: acid and working_in__c='ASIA']; 
    for(account a:acc){   
    for(Opportunity opp1:trigger.new){
      if(a.Opportunities.size()>=2){           
            opp1.adderror('Can not create or update opp bcz parent acc have 2 or more closed won opp and acc woring in ASIA');  
          }
      }           
}
/*Set<Id> accid=new Set<Id>();
    for(Opportunity opp1: Trigger.new)
    {
        accid.add(opp1.AccountId);
    }
    List<Account>acc1=[Select id ,(Select id From Opportunities where  StageName = 'Closed Won') From Account WHERE ID IN:accid AND working_in__c='ASIA' ];
    for(Account ac:acc1)
    {
            for(Opportunity opp2: Trigger.new)
            {
                if(ac.Opportunities.size()>=2)
                {
                opp2.addError('');
                }
            }

    }*/
    
}