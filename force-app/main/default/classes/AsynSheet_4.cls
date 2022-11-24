//Create Batch class to create 5 new Opportunities daily
global class AsynSheet_4 implements Database.Batchable<sObject> {
 global Database.QueryLocator start(Database.BatchableContext bc){
 return Database.getQueryLocator('Select id From Account Limit 5' );
 }
 global void execute(Database.BatchableContext bc, List<Account> records){
List<Opportunity> opList=new List<Opportunity>();
     for(Account ac:records)
{
    Opportunity opp=new Opportunity();
    opp.StageName='Closed Won';
    opp.Name='AsynSheet_4';
    opp.CloseDate= System.today();
    opp.AccountId=ac.id;
    opList.add(opp);
}
     Insert opList; 
 }
 global void finish(Database.BatchableContext bc){

 }
}
//database.executeBatch(new AsynSheet_4());