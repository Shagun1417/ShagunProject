public with sharing class LwcSheet7 {
    @AuraEnabled
    public static Integer  LwcMethod(String UserName, Integer Password) {
    Integer count=0;
        List<Contact> conList = [SELECT  User_Name__c, Password__c FROM Contact Where User_Name__c =:UserName AND Password__c=:Password];
        for(Contact con:conList)
        {
            if(conList.size()>0)
            {
                count++;
            }
        }
        return count;
    }
}