public with sharing class DynamicDataController {
    @AuraEnabled(cacheable=true)
    public static  List<Task> myMethod() {
return  [Select Subject From Task Where OwnerId= : UserInfo.getUserId()];

    }
    // public static string methodName(){
    //     try {
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
}
