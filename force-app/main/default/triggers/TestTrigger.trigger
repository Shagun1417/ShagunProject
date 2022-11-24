trigger TestTrigger on Account (After insert) {
List<Account> accList= new List<Account>();
    if(trigger.isbefore && trigger.isinsert)
 for(Account acc : Trigger.new)
    {
        
    }
  //  acc.addError('');

}