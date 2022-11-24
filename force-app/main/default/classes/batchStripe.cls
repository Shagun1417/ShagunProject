global  class batchStripe implements Database.Batchable<sObject> ,Database.AllowsCallouts, Database.Stateful {

    global Database.QueryLocator start(Database.BatchableContext bc){

        return Database.getQueryLocator([Select id, Consumer_Id__c, name From Account Where Id='0015i00000TtMM1AAN']);
        }

       
        global void execute(Database.BatchableContext bc, List<Account> records){
            List<Account> accList = new List<Account>();
            for(Account a :records){
    if(a.Consumer_Id__c==null){
        Http http=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.stripe.com/v1/customers');
        request.setMethod('POST');
        request.setHeader('Authorization','Bearer sk_test_51M5RDnSGq1nWfbI5JmNAEsUQn0UD7qu2TGtRGVqXwagbzgWZE15jUsWqBo3VvtrJZ4nVvTjHuxHFYggN3z22470M001ouwkFB1');
        request.setBody('name='+a.name );//no set body for get 
        httpResponse response= http.send(request);
        getValue gvalue = (getValue)JSON.deserialize(response.getBody(),getValue.class); 


    Account acc =new Account();
    acc.Id= a.id;
    acc.Consumer_Id__c=gvalue.id;
        accList.add(acc);

        }
        }
        update accList;

        }  
        global class getValue{
            public string id{get;set;}
            public string name{get;set;}
    }
    global void finish(Database.BatchableContext bc){

    }
}
