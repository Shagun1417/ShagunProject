public with sharing class anshuFun {
    @AuraEnabled(cacheable=true)
    public static List<Account> anshuFun() {
        List<Account> acli = [SELECT Id,Name FROM Account];
        return acli;

    }
}