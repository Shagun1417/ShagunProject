public class Log_executeAnonymousTr {
             
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
/*
 Module
    1-On Account to create a 'Default' (number of contacts= numbers of employee) contact every time an account is created
    
    2-On Opportunity do not let the user insert Opportunities with past closed Date with following Message 
    "Please enter a future Closed Date"
    
    3-On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$
    
    4-On Contact to update the Account Name field with contact Last Name, concatenated in the end. Example: 
    If you Create A Contact whose FirstName='Sarthak' and LastName='Saxena' and the Accountname ='Tata',
    Then Account name must become 'TataSaxena'.
    
    5-Update the above trigger to delete the Last Name from the Account field 
    when a Contact is deleted without deleteing the other Last name.
    
    6-On Opportunity to alert the user when an Opportunity is being closed with no Opportunity line items in it.
    
    7-"Create a trigger on Opportunity to add all the Contacts having the same Account as Opportunity.
    Account into the Opportunity ""Contact Roles""
    Example:- Account: Birla have 3 Contacts: ajay,amar,anuj Then while creating an Opportunity for 
    Birla add ajay,amar & anuj to Opportunity Contact roles--T"
    
    8-On campaign to close all the opportunities associated with the campaign when campaign status is completed. 
    Example:Opportunities having line items in it must be closed won and opportunities having no line item must be closed lost.
    Send all the details of All associated opportunities.
    
    9-Bulkify the above trigger.
    
    10-Write a Trigger to stop add more than 2 Opportunity line Items records in an Opportunity.
    
    11-Write a Trigger to create a default Contact, Case, Opporunity and Contact Role.
    whenever an Account is created with Number of Employees > 100. 
    Make sure the Contact is in contact field of Case as well as related to Opporutnity inn Contact Role.
    
    12-Write a trigger on Opportunity to create a new Case with all case fields should have default values 
    whenever an Opporutnity is getting closed lost.
    
    13-"Write a Trigger to Stop creating any more Plan records with location 'A' 
    if we have Travel Hours more than 100 for any specific location 'A'. Example
    If total hours of all the Plans for A is 90 and B is 70 and C is 100 and 
    > a new Plan is getting created with A hours 5. Trigger should not stop as total hours will become 95
    > a new Plan is getting created with B hours 45. Trigger should stop as total hours will become 105."\
    
    14-"Please solve the script question first.
    Script - 
    Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field).
	Another Junction Object ""Event Participant"" with 3 fields
    1. lookup Contact
    2. lookup Event
    3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
    Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer.
    Write a trigger to make sure No Event is having the same Contact registered as Attendee twice
    Explanation : A user is not allowed to create Two Event participant with same contact Lookup value under same Event ."
    
    15-"Script - 
    Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field).
	Another Junction Object ""Event Participant"" with 3 fields
    1. lookup Contact
    2. lookup Event
    3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
    Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer.
    Trigger - 
    Write a trigger to stop creating ""Event Participant""
    if a Contact is registering for 2 Events happening in Same day ie. Event Date is same."
    
    16-"Script - 
    In Account Object create a Multi picklist ""Working in (ASIA, EMA, NA, SA)"".
    Write a script to get the total ""No of employees""  of all the Accounts working in ASIA and NA(North America)
    Trigger  - 
    Create 4 Pricebooks ASIA, EMA, NA and SA. 
    Write a trigger on Opportunity which should not allow user to add a Pricebook in the Opportunity
    which is not present in Account Multipicklist Working in (ASIA, EMA, NA, SA)"". "
    
   17-"Script - 
    Create several Contacts with both Mailing and Shipping Address value filled. 
    Make sure your current user details from Setup>> User>> details have adress value filled in too. 
    Write a Script to get all the contacts having same Billing Country in Address as Current User Address Billing Country.
    Trigger - 
    Create a checkbox field ""SAME COUNTRY AS USER & COMPANY"" in Contact. 
    Write Trigger to throw error when a Contact is getting inserted in Salesforce having Country same as User country
    and Company country"
    
    18-"Script -
    Create a look up[Lead] on product so that Products come over in related list of a Lead.
    Write script to create 3 Leads and 5 Products with Lead lookup field.
    Trigger -
    Write a Trigger to stop creating or updating Opportunities with Account having ""Working in = ASIA"" and 
    Already 2 Closed Won Opportunity under same Account."
    
    19-"Script - 
    Create a Script to find out all the users in the systems
    who are having more than 20 Leads allocated[Owner] to them in month of Dec 2017
    Trigger - 
    Write a Trigger on lead to show error messagewhen a lead is getting allocated[Owner] to a user
    when the Owner User has reached the limit of 30 Lead owner in a particular month."
    
     20-Write a trigger on Contact and fill its Mailing Address with its Account's Shipping Address.
    
    21-Create a CheckBox with 'Allow Multiple' on Account Object when this CheckBox is Checked user can create Multiple Contacts 
    within its Account associated and when it is UnChecked user cannot able to create Multiple Contacts.
    

  1-On Account to create a 'Default' (number of contacts= numbers of employee) contact every time an account is created
"trigger TriggerSheetQ1 on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter)
    {
        List<contact> clst = new List<contact>(); 
        for(account a: trigger.new)
        {
            contact c = new contact();
            c.AccountId = a.id; 
            c.firstname='Amit';
            c.LastName = 'Shah';
            clst.add(c);
        }
        insert clst;
    }
}"
"trigger TriggerSheetQ2 on Opportunity (before insert) {
    if(trigger.isInsert && trigger.isBefore)
    {
        for(opportunity op : trigger.new)
        {
            if(op.CloseDate < date.today())
            {
                op.adderror('Please enter a future Closed Date');
            }
        }
    }"
"trigger TriggerQ3 on Product2 (after insert) {

    set<id> pid= new set<id>();
List<PricebookEntry> pbe= new List<PricebookEntry>();
    List<Pricebook2> stand= [select id from Pricebook2 where IsStandard=true limit 1];
    for(Pricebook2 pb2: stand){      
       For(Product2 pd:trigger.new){
     PricebookEntry pentry= new PricebookEntry();
        
        pentry.product2id=pd.id;
        pentry.pricebook2id=pb2.id;
                pentry.UnitPrice=1;
pentry.IsActive=true;
        
           pbe.add(pentry);
    }      
    }
   insert pbe;   
}"
"trigger TriggerQ4 on Contact (after insert,before delete) {

    if(trigger.isinsert){
    Set<id> acid= new set<id>();
    for(contact con:trigger.new){
        acid.add(con.AccountId);         
    }
    List<account> aclist=[select name from account where id in: acid];
    for(account ac:aclist){
for(contact con1:trigger.new){
    if(con1.AccountId==ac.Id){
    ac.name=ac.name+' '+con1.LastName;
    }   }
    }update aclist;
 }           
}"
"trigger TriggerQ4 on Contact (after insert,before delete) {

         if(trigger.isDelete){
             Set<id> acid2= new set<id>();
         
         for(Contact c:trigger.old){
             
             acid2.add(c.accountid);
         }
         List<Account> aco=[select name from account where id in:acid2];
         for(account a:aco)
         {
             for(Contact co:trigger.old){
             String[] nam=a.name.split(co.LastName);
                 
             a.name=nam[0];
             
         }         
         }update aco;

     }
    
}"
"trigger TriggerQ6 on Opportunity (before update) {

    Set<id> opid= new Set<id>();
    
    For(Opportunity op:trigger.new){
   opid.add(op.id);
        
    }
                 integer count=0;
 
    List<Opportunity> oplist=[select id,(select id from OpportunityLineItems) from Opportunity where id in:opid];
    for(Opportunity o:oplist){

            for(OpportunityLineItem oli:o.OpportunityLineItems){
        count++;                
            }
    }
     For(Opportunity op1:trigger.new){
         if(count==0 && op1.StageName=='Closed won'){
             op1.adderror('Stage is closed without any OLI');
         }   
    }     
}"
"trigger TriggerQ7 on Opportunity (after insert) {

    set<id> oaid= new set<id>();

    for(Opportunity opp:trigger.new){
        
oaid.add(opp.accountid);             
    
    }  
    List<OpportunityContactRole> ocrole= new List<OpportunityContactRole>();
    List<Contact> conlist= [select id from contact where accountid in:oaid];
    for(Contact c:conlist){
         for(Opportunity opp1:trigger.new){
             if(opp1.AccountId==c.AccountId){
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.OpportunityId=opp1.id;
        ocr.ContactId=c.id;    
        ocrole.add(ocr);
             }}}
    insert ocrole;    
}"
"trigger TriggerQ8 on Campaign (after update) {

    set<id> cid= new set<id>();
    integer count=0;
    for(Campaign cm:trigger.new){       
        cid.add(cm.id);        
    }
    
    List<Opportunity> op= [select id,stagename,Campaign.status,(select id from OpportunityLineItems) 
                           from Opportunity where CampaignId in:cid];   
    for(Opportunity o:op){
            count= 0;
        for(OpportunityLineItem oli:o.OpportunityLineItems){
            count++;
        }
             if(o.campaign.status=='Completed'){
            if(count>0){
                o.stagename='Closed won';
            }   
            else{
                o.stagename='Closed Lost';
            }                    
        }
    }
    update op; 
}"

"trigger Triggersheet10 on OpportunityLineItem (before insert) {

   set<id> opid= new set<id>();
    
    for(OpportunityLineItem opline:trigger.new){
      opid.add(opline.opportunityid);  
                 }  
    
    List<Opportunity> op=[select id,(select id from OpportunityLineItems) from Opportunity where id in:opid];
    for(Opportunity o:op){
       for(OpportunityLineItem opline1:trigger.new){
           if(o.OpportunityLineItems.size()>=2){
               opline1.adderror('cannot add more the 2 OLI');
           }
        
       }}    
}"
"trigger Trigger11 on Account(after insert) {
    
    List<contact> conlist= new List<Contact>();
    List<Case> caselist= new List<Case>();
    List<Opportunity> opplist= new List<Opportunity>();
    List<OpportunityContactRole> conrolelist= new List<OpportunityContactRole>();
    
    List<id> accid=new List<id>();
    List<id> conid=new List<id>();
    List<id> opid=new List<id>();
    
    for(Account ac:trigger.new){
        if(ac.NumberOfEmployees>=200){
            accid.add(ac.id);
             Contact con= new Contact();          
        con.lastname='Trigger11';
        con.accountid=ac.id;
        conlist.add(con);
        }
    }
     
    insert conlist;
    List<contact> cono=[select id from contact where id in:conlist];
    for(Contact c:cono){
        conid.add(c.id); 
    }
    for(integer k=0;k<accid.size();k++){
        Opportunity opp= new Opportunity();
        opp.name='Trigger11';
        opp.accountid=accid[k];
        opp.stagename='Closed won';
        opp.closedate=system.today();
        opplist.add(opp);
    }
    insert opplist;
    List<Opportunity> oppo=[select id from Opportunity where id in:opplist];
    for(Opportunity o:oppo){
        opid.add(o.id); 
    }
    for(integer l=0;l<accid.size();l++){            
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.contactid=conid[l];
        ocr.opportunityid=opid[l];
        conrolelist.add(ocr);
    }
    insert conrolelist;
    
    for(integer j=0;j<accid.size();j++){ 
        case cs= new case();
        cs.contactid=conid[j];
        cs.Accountid=accid[j];
        cs.Origin='Email';
        caselist.add(cs);
    }
    insert caselist;
}"
"trigger TriggerQ12 on Opportunity (after insert) {

    
    List<Case> caselist=new List<case>();
     for(Opportunity opp1:trigger.new){
        
        if(opp1.Stagename=='Closed lost'){
            Contact co= new Contact();
            co.LastName='TriggerQ12';
            co.AccountId=opp1.AccountId;
            insert co;
            
            case ca= new case();
    ca.AccountId=opp1.AccountId;
    ca.ContactId=co.id;
    ca.Origin='Email';
    caselist.add(ca);
    Insert caselist;       
        }    
         }  
}"
"trigger TriggerQ13 on Plan__c (before insert) {
List<string> loc=new List<string>();  
    decimal tot=0;
    for(Plan__C p:trigger.new){
        loc.add(p.location__C);
    }
       
    List<AggregateResult> total= [select sum(Travelling_hours__c) sumOfHours from plan__c where Location__c in:loc group by Name ];
    for(AggregateResult pl:total){
        tot=0;
        tot=tot+integer.valueof(pl.get('sumOfHours'));  
         for(Plan__C p1:trigger.new){
         if((tot+p1.Travelling_hours__c)>100){
             p1.adderror('Limit exceeded');
         }
    }     
    } 
}"
"trigger TriggerQ14 on Event_Participant__c (before insert) {

    Set<Id> eid=new set<id>();  

    for(Event_Participant__c ep:trigger.new){
        
        eid.add(ep.event__c);     
    }
        List<Event_Participant__c> eplist=[select contact__c from Event_Participant__c where Event__c in:eid];
    for(Event_Participant__c e:eplist){
    
         for(Event_Participant__c ep1:trigger.new){
        
             if(e.Contact__c==ep1.contact__c){
                 ep1.adderror('Participant already registered in this event');
       }        
   }        
    }}"
"trigger TriggerQ15 on Event_Participant__c (before insert,before update) {
    set<id> con= new Set<id>();
        set<id> tim= new Set<id>();
integer tf=0;
    for(Event_Participant__c newEvp:trigger.new){
        con.add(newEvp.Contact__c);
 tim.add(newEvp.Event__c);
    }  
        List<Event__c> etime=[select Event_date_time__c from Event__c where id in:tim];
        List<Event_Participant__c> eptp=[select event__r.Event_date_time__c from Event_Participant__c where contact__c in:con];
    for(Event__c evt:etime){
    tf=0;
    for(Event_Participant__c e:eptp){
        if(evt.Event_date_time__c.format('dd:MM:yyyy').equals(e.event__r.Event_date_time__c.format('dd:MM:yyyy'))){
            tf++;
        }
    }}
      for(Event_Participant__c newEvp2:trigger.new){
          
          if(tf!=0){
                        newEvp2.adderror('Already scheduled for another event on that day');
        }      }}"

"trigger TriggerQ17 on Contact (before insert,before update) {
    
    set<id> userid=new set<id>();
        userid.add(userinfo.getUserId());
    
    List<User> use = [SELECT Country FROM User where id in:userid];
    
    for(User us:use){
    for(contact con:trigger.new){
          
        if(con.Same_country_as_user__c==true || con.MailingCountry==us.country){
            con.adderror('Not allowed same country as user');      
        }     
    }
    }
}"
"trigger TriggerQ18 on Opportunity (before insert,before update) {
   Set<id> acid=new set<id>();
        for(Opportunity opp:trigger.new){
           acid.add(opp.Accountid);
            }
            
    List<Account> acc= [select name,(Select id from Opportunities 
                               where stagename='Closed won') from account where id in: acid and working_in__c='ASIA']; 
    for(account a:acc){   
    for(Opportunity opp1:trigger.new){
      if(a.Opportunities.size()>=2){           
            opp1.adderror('Can not create or update opp bcz parent acc have 2 or more closed won opp and acc woring in ASIA');  
          }
      }           
    }}"
"trigger TriggerQ19 on Lead (before insert) {

    Integer count=0;
    List<Lead> leadlist= [select id,owner.Name from lead where CreatedDate=THIS_MONTH];
    For(lead led:leadlist){
        
        if(led.owner.name==userinfo.getName()){
        count++;
        } }
    for(Lead led1:trigger.new){
        If(count>=20){
            led1.adderror('Limit exceeded');
        }
    }  
}"
"trigger TriggerQ20 on Contact (before insert,before update) {
  
     List<Id> accIds = new List<Id>();
        for(Contact con: trigger.new){
            if(con.AccountId != null){
               accIds.add(con.AccountId);
            }
        }
        List<Account> accList =[Select ShippingAddress,ShippingStreet,ShippingPostalCode,ShippingCity,ShippingState,ShippingCountry 
                    FROM Account Where ID IN: accIds];
        for(Account acc: accList){
            for(Contact con: trigger.new){
                if(con.AccountId == acc.Id){
                    con.MailingStreet=acc.ShippingStreet;
                  con.MailingPostalCode=acc.ShippingPostalCode;
                    con.MailingCity=acc.ShippingCity;
                    con.MailingState=acc.ShippingState;
                    con.MailingCountry=acc.ShippingCountry;                   
                }
            }
        }     
        update accList;
}"
"trigger Trigger21 on Contact (before insert) {
    integer tf=0;

    set<id> sid= new Set<id>();
    for(Contact c:trigger.new){
      sid.add(c.accountid);
        }               
    List<Account> ac=[select id,Allow_multiple__c,(select id from contacts) from account where id in:sid];
    for(Account a:ac){
        for(Contact cont:a.contacts){
            if(a.Allow_Multiple__c==false){
                tf++;
            }
        }}
    for(Contact c1:trigger.new){
              if(tf!=0){
            c1.adderror('Check ""Allow Multiple"" from Account to create multiple contact with relate of that Account');



*/