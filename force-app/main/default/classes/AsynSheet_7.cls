//Create Batch to update the Account "Count" field(Create this field) with all the contacts related to that Account
global class AsynSheet_7 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,Count__c, (Select id from Contacts) from Account' );
    }
    global void execute(Database.BatchableContext bc, List<Account> records){
        for(Account acc: records){
            
            acc.Count__c=acc.contacts.size();
        }
        update records; 
        }  
    global void finish(Database.BatchableContext bc){
         }
}