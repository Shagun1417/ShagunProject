public with sharing class test {

   @AuraEnabled(cacheable=true)
public static  List<Account>  testFun() {
List<Account> accList = [Select Id, Name From Account limit 5];
return accList;

    }
}