//Write a trigger on Opportunity to create a new Case with all case fields should have default values 
//whenever an Opporutnity is getting closed lost.
trigger TiggerSheet_1_12 on Opportunity (after insert) {
for(Opportunity opp1:trigger.new){
        
        if(opp1.Stagename=='Closed lost'){
            Contact con= new Contact();
            con.LastName='TriggerQ12';
            con.AccountId=opp1.AccountId;
            insert con;
            
            case ca= new case();
              ca.AccountId=opp1.AccountId;
              ca.ContactId=con.id;
              ca.Origin='Email';
    
            Insert ca;
        } 
            
        }    
}


//Write a Trigger to Stop creating any more Plan records with location 'A'
// if we have Travel Hours more than 100 for any specific location 'A'. Example
//If total hours of all the Plans for A is 90 and B is 70 and C is 100 and 
//> a new Plan is getting created with A hours 5. Trigger should not stop as total hours will become 95
//> a new Plan is getting created with B hours 45. Trigger should stop as total hours will become 105.


/*trigger TiggerSheet_1_13 on Plan__c (before insert) {
List<string> loc=new List<string>();  
    decimal tot=0;
    for(Plan__C p:trigger.new){
        loc.add(p.location__C);
    }
       
    List<AggregateResult> total= [select sum(Travelling_hours__c) sumOfHours from plan__c where Location__c in:loc group by Name ];
    for(AggregateResult pl:total){
        tot=0;
        tot=tot+integer.valueof(pl.get('sumOfHours'));  
         for(Plan__C p1:trigger.new){
         if((tot+p1.Travelling_hours__c)>100){
             p1.adderror('Limit exceeded');
         }
    }     
    } 
}*/