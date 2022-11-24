//Lwc sheet Q2
public class AccountRelatedObj {
    @auraEnabled
    public static List<Account> fetchAccount()
    {
        List<Account> accList=[SELECT Id,Name FROM Account LIMIT 10];
        return accList;
    }
    @auraEnabled
    public static List<Contact> getContacts(String accountId)
    {
        List<Contact> conList=[SELECT Id,LastName FROM Contact WHERE accountId=:accountId LIMIT 10];
        return conList;
    }
    @auraEnabled
    public static List<Opportunity> fetchOpportunity(String accountId)
    {
        List<Opportunity> oppList=[SELECT Id,Name FROM Opportunity WHERE accountId=:accountId LIMIT 100];
        return oppList;
    }  
}