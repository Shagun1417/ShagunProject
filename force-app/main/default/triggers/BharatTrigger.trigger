trigger BharatTrigger on Opportunity (after insert) {
Set<id> oppId = new Set<id>();
    for(Opportunity opp : Trigger.new)
    {
        oppId.add(opp.AccountId);
       }
    List<Account> accList = [Select id, Remaining_Amount__c, Total_Amount__c from Account Where id in: oppId];
    for(Account a: accList)
    {
            for(Opportunity opp : Trigger.new)
            {
                a.Remaining_Amount__c= a.Total_Amount__c - opp.Amount;
            }
        update accList;

    }
    
}