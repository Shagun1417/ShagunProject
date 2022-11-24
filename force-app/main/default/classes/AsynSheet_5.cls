//Schedule the above class to run 4 times every day at after every 6 hours. 
global class AsynSheet_5 implements Schedulable {
 
    global void execute(SchedulableContext sc){
        database.executebatch(new AsynSheet_4());

 }
 
}
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