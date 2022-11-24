/*Script - 
In Account Object create a Multi picklist "Working in (ASIA, EMA, NA, SA)".
Write a script to get the total "No of employees"  of all the Accounts working in ASIA and NA(North America)
Trigger  - 
Create 4 Pricebooks ASIA, EMA, NA and SA. Write a trigger on Opportunity 
which should not allow user to add a Pricebook in the Opportunity 
which is not present in Account Multipicklist Working in (ASIA, EMA, NA, SA)". */
trigger TriggerSheet_1_16 on Opportunity (before insert) {
Set<Id> accid= new Set<Id>();
    
    List<Account> acc= [SELECT Id From Account ];
        for(Account a: acc)
        {
            if(a.Working_in__c=='Asia'||a.Working_in__c=='EMA'||a.Working_in__c=='NA'||a.Working_in__c=='SA')
            {
                accid.add(a.id);
            }
        }
    for(Opportunity opp : Trigger.new)
    {
        for(Id a1:accid)
        if(opp.AccountId!=a1)
        {
            opp.addError('hellp');
        }
    }
}