//if account is having the contact or opportunity then account not able to delete by ram niwasaan
trigger ContactNotDelete on Account (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
      Set<Id> accid=new Set<Id>();
        for(Account acc: Trigger.old)
        {
            accid.add(acc.Id);
        }
    List<Account> accList=[Select id,(Select Id from Contacts),(Select Id from Opportunities) From Account where id in:accid];
        for(Account acc:accList){
            if(acc.Contacts.size()>0||acc.Opportunities.size()>0){
          acc.addError('cannot delete the Account ');      
            }
          }
        }
    }