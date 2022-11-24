public with sharing class stripeAction {

    @AuraEnabled(cacheable=true)
    public static List<String> myMethod(string ids){
        List<string> str= new List<String>();
        system.debug('rwecord id'+ids);

       try{
        Account acc1 = [Select name, id, Consumer_Id__c from Account where id = : ids];
       
        if(acc1.Consumer_Id__c==null ){
            Http http=new Http();
            HttpRequest request =new HttpRequest();
            request.setEndpoint('https://api.stripe.com/v1/customers');
            request.setMethod('POST');
            request.setHeader('Authorization','Bearer sk_test_51M5RDnSGq1nWfbI5JmNAEsUQn0UD7qu2TGtRGVqXwagbzgWZE15jUsWqBo3VvtrJZ4nVvTjHuxHFYggN3z22470M001ouwkFB1');
            request.setBody('name='+acc1.name );//no set body for get 
            httpResponse response= http.send(request);
            getValue gvalue = (getValue)JSON.deserialize(response.getBody(),getValue.class);
 
        system.debug('Customer id'+gvalue.id);
        str.add(gvalue.id);
        str.add(gvalue.name);
try{
Account ac= new Account();
ac.id=ids;
ac.Consumer_Id__c=gvalue.id;
system.debug('C id in acc '+gvalue.id);
system.debug('Acc id '+ac.id);

update ac;
system.debug('C id in acc after updatwe '+ac.Consumer_Id__c);

}catch(DmlException e){
    system.debug('Error on update'+e.getMessage());
}
        
 
    }

        else{
        Http http=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.stripe.com/v1/customers/'+acc1.Consumer_Id__c);
            request.setMethod('GET');
            //request.getHeader('Content-type', );
            request.setHeader('Authorization','Bearer sk_test_51M5RDnSGq1nWfbI5JmNAEsUQn0UD7qu2TGtRGVqXwagbzgWZE15jUsWqBo3VvtrJZ4nVvTjHuxHFYggN3z22470M001ouwkFB1');
            
    
        httpResponse response= http.send(request);
        getValue gvalue = (getValue)JSON.deserialize(response.getBody(),getValue.class);
        
        System.debug('hello');
        str.add(gvalue.id);
        str.add(gvalue.name);
        
        //return str;
    
        }
   //  acc1.Consumer_Id__c=str1;
     //   update acc1;
        //System.debug(acc1.Consumer_Id__c);
       }catch(Exception ex){
        System.debug(' error --> '+ex.getMessage());
       }
       return str;

    }

public class getValue{
        public string id{get;set;}
        public string name{get;set;}
        public string email{get;set;}
    }


}

