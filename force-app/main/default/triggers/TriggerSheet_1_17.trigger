/*Script - 
Create several Contacts with both Mailing and Shipping Address value filled. 
Make sure your current user details from Setup>> User>> details have adress value filled in too.
Write a Script to get all the contacts having same Billing Country in Address as Current User Address Billing Country.
Trigger - 
Create a checkbox field "SAME COUNTRY AS USER & COMPANY" in Contact. 
Write Trigger to throw error when a Contact is getting inserted in Salesforce having 
Country same as User country and Company country*/

trigger TriggerSheet_1_17 on Contact (before insert) {
 set<id> userid=new set<id>();
        userid.add(userinfo.getUserId());
    
    List<User> use = [SELECT Country FROM User where id in:userid];
    
    for(User us:use){
    for(contact con:trigger.new){
          
        if(con.SAME_COUNTRY_AS_USER_COMPANY__c==true || con.MailingCountry==us.country){
            con.adderror('Not allowed same country as user');      
        }     
    }
}
}