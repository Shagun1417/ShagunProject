public class Log_executableAnonymousAsyn {}









/*Write a Batch class to delete accounts created in 10 days before.
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

//Schedule the above class to run every day at 12:00 PM
global class AsynSheet_2 implements Schedulable {
 
    global void execute(SchedulableContext sc){
        database.executebatch(new AsynSheet_1());

 }
 
}
//anamous 
//String str= '0 17 0 24 8 ? 2022';
//System.schedule('Ape3', str, new AsynSheet_2());
//
//
//abort in annamous
/* List<CronTrigger> JOBIDLIST = [select id from CronTrigger];

for(CronTrigger job:JOBIDLIST )
{
   System.abortJob(job.id);
}



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
//
//
/*Schedule the above class to run 4 times every day at after every 6 hours. 
global class AsynSheet_5 implements Schedulable {
 
    global void execute(SchedulableContext sc){
        database.executebatch(new AsynSheet_4());

 }
 
}*/
//String str= '0 0 0,6,12,18 * * ? 2022';
//System.schedule('Apex5', str, new AsynSheet_5());
//
//
//abort
////abort in annamous
/* List<CronTrigger> JOBIDLIST = [select id from CronTrigger];

for(CronTrigger job:JOBIDLIST )
{
   System.abortJob(job.id);
}*/


/*Create Batch to update the Account "Count" field(Create this field) with all the contacts related to that Account
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
}*/

/*
Q8 Write the Script to Schedule the above class to run in every 5 minutes.
global class AsynSheet_8 implements Schedulable {
 
    global void execute(SchedulableContext sc){
        database.executebatch(new AsynSheet_7());

 }
 
}*/
//for annonous window
//String str =  '0 5 * * * ?';
//System.schedule('Apex7', str, new AsynSheet_8());
//
//
/*Q 11 Create a batch Class which should run every day 00:00 and fetch all the Leads created yesteday not having a Phone number. 
Send an Email to the system Admin with the list of those Leads with details

global class AsynSheet_11 implements Database.Batchable<sObject> {
        global Database.QueryLocator start(Database.BatchableContext BC){

            return Database.getQueryLocator('select id,name from account where createddate=Last_n_days:10 and phone=null');
        }
      
       global void execute(Database.BatchableContext BC, List<account> leadList){
             
  List<Messaging.SingleEmailMessage> maillist=new list<Messaging.SingleEmailMessage>();
       
              
   Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
  
            string[] emai=new String[]{userinfo.getUserEmail()};
                String s='';
            integer i=1;
            for(Account ld:leadList){
               s+=string.valueOf(i)+' : '+ld.id+'  '+ld.name+'\n'; 
                i++;
            }
    mail.settoaddresses(emai);
    mail.setsubject('Lead list');
    mail.setplaintextbody(s);
maillist.add(mail);
        if(!maillist.isempty()){
        Messaging.sendEmail(maillist);
          
    
        }
       }    
       global void finish(Database.BatchableContext BC){
       }
}*/
//for annonous window
//database.executeBatch(new AsynSheet_11() );