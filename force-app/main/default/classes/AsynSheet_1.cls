//Write a Batch class to delete accounts created in 10 days before.
global class AsynSheet_1 implements Database.Batchable<sObject> {
 global Database.QueryLocator start(Database.BatchableContext bc){
 return Database.getQueryLocator('select id From Account Where CreatedDate = Today  Limit 1' );
 }
 global void execute(Database.BatchableContext bc, List<Account> records){
Delete records; 
 }
 global void finish(Database.BatchableContext bc){

 }
}