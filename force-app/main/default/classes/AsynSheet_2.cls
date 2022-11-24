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
}*/