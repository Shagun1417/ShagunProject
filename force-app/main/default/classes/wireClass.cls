public class wireClass {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
      List<Account> accList= [Select Id, Name From Account  limit 5];
        return accList;
    }
}