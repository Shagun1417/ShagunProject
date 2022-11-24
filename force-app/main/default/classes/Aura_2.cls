//Created a page that will show all accounts with its opportunity and Contacts in picklist value.
public class Aura_2 {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        accList=[Select Id, Name From Account Limit 5];
        return accList;
    }
    @AuraEnabled
    public static List<Contact> getContacts(String accId){
        list<Contact >conList=[Select Id, Name From Contact where id=: accid];
        
        return conList;
    }
    
}