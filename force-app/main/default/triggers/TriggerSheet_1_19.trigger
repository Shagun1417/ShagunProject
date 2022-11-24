/*Script - 
Create a Script to find out all the users in the systems
who are having more than 20 Leads allocated[Owner] to them in month of Dec 2017
Trigger - 
Write a Trigger on lead to show error message when a lead is getting allocated[Owner] to a user 
when the Owner User has reached the limit of 30 Lead owner in a particular month.*/

trigger TriggerSheet_1_19 on Lead (before insert, before update) {
 Integer count=0;
    List<Lead> leadlist= [select id,owner.Name from lead where CreatedDate=THIS_MONTH];
    For(lead led:leadlist){
        
        if(led.owner.name==userinfo.getName()){
        count++;
        } }
    for(Lead led1:trigger.new){
        If(count>=11){
            led1.adderror('Limit exceeded');
        }
    }  
}