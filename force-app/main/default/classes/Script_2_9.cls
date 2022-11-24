/*Create an Object "Event" (Name Default field and "Event Date" Date time field). Another Junction Object "Event Participant" with 3 fields
1. lookup Contact
2. lookup Event
3. multipicklist ("Attendee Contact","Presenter Contact", "Organizer Contact")
Write a script to create 10 "Event Participant" with Attendee picklist, 4 with Presenter, 2 with organizer.*/

public class Script_2_9 {
    
    public static void myMethod(){
      List<Event__c> eCreate = new List<Event__c>();
        for(Integer i=0;i<=9;i++){
            Event__c e= new Event__c();
            e.Name= 'event'+i;
            e.Event_Date__c= System.today();
            eCreate.add(e);
            }
        Insert eCreate;
        
        List<id> evntl=new List<id>();
        List<id> conid=new List<id>();
        List<Event_Participant__c> evpartlist=new List<Event_Participant__c>();
        
        List<Event__c> evlist=[Select id from Event__c];
        
        for(Event__c ev:evlist){
            evntl.add(ev.id);      
        }
        List<Contact> conlist=[Select id from Contact limit 10];
        for(Contact co:conlist){
            conid.add(co.id);   
        }
        
        for(integer i=0;i<=9;i++){
            Event_Participant__c epobj=new Event_Participant__c();
            epobj.Contact__c=conid[i];
            epobj.name='abcd'+i;
            epobj.Event__c=evntl[0];
            if(i<=3){
                epobj.About_Contact__c='Attendee Contact';
            }
            else if(i>=4 && i<=7){
                epobj.About_Contact__c='Presenter Contact';
            }
            else if(i>7){
                epobj.About_Contact__c='Organizer Contact';
            }
            evpartlist.add(epobj);
            
        }
        insert evpartlist;    
        
    }    
    
}