trigger MyTrigger on Opportunity (after insert, after update) {
    List<Task>TaskList=new List<Task>();
    for(Opportunity opp: Trigger.New)
    {
     if(opp.StageName=='Closed Won')
    {
       TaskList.add(new Task(Subject='Follow up test task', Whatid=opp.id));
        
    }}
if(TaskList.Size()>0)
{
    insert TaskList;
}
}