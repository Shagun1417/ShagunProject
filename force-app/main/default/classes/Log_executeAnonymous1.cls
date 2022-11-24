public class Log_executeAnonymous1 {}
    























/*    
//Print any Integer number in reverse order. Ex: 789234  => 432987
public class Script_2_2 {
public static void myMethod()   
{  
Integer num = 789234, reverse = 0;  
while(num != 0)   
{  
Integer remainder = math.mod(num, 10);  
reverse = reverse * 10 + remainder;  
num = num/10;  
}  
System.debug('The reverse of the given number is: ' + reverse);  
}  
}    

//WAP to enter a startDate='06:07:55 2-jan-2016' & endDate='07:08:55 5-feb-2016'
// and display the difference between two dates in Years, months, days, hours, minutes,seconds.
public class Script_2_3 {
        public static void myMethod()
    {
      //  Date d='06:07:55 2-jan-2016'-'07:08:55 5-feb-2016';
      //  DateTime currentDateTime = DateTime.newInstance(2020, 5, 18, 3, 25, 0)-DateTime.newInstance(2020, 5, 18, 3, 25, 0);
      DateTime Startdate=DateTime.newInstance(2016,01,02,6,7,55);
DateTime enddate=DateTime.newInstance(2016,02,05,7,8,55);
System.debug('Year');
System.debug(enddate.Year()-Startdate.Year());
System.debug('Month');
System.debug(enddate.Month()-Startdate.Month());
System.debug('Day');
System.debug(enddate.Day()-Startdate.Day());
System.debug('Hour');
System.debug(enddate.Hour()-Startdate.Hour());
System.debug('Minutes');
System.debug(enddate.Minute()-Startdate.Minute());
System.debug('second');
System.debug(enddate.second()-Startdate.second());
    }
}


//Write a Script to get all the Contacts having same email as any Salesforce User.Email

public class Script_2_4 {
    public static void myMethod()
    {
        User u=new User();
        contact c1= new contact();
        if(u.email==c1.email)
        {
            
            List<Contact> con=[SELECT Name, Email FROM Contact WHERE Email=:c1.Email];
            for(Contact c: con)
            {
                
                
                System.debug(c);
            }
        }}
    }


//Create several Accounts and Opportunites and products. 
//Write a Script to get all the Accounts having more than 2 Opportunites with Closed Won."

public class Script_2_5
{
    public static void myMethod()
    {
        Opportunity o=new  Opportunity();
        List<Opportunity> opp= [SELECT Account.Name From Opportunity WHERE StageName='Closed Won'];
      //  for( Opportunity o1:opp)
        {
            
           // System.debug(o1);
        }
        Integer count;
        for(integer i = 0; i <opp.size(); i++) 
        {  
            count = 1;  
            for(integer j = i+1; j <opp.size(); j++)
            {  
                if(opp.get(i)==opp.get(j))                    
                {
                    count++;  
                
            }  
        }  
        
        if(count > 2 )  
            System.debug(opp.get(i));  
    }  
}  
}


//  Write a script to get all the Account having more than 10 opportunities 
    //  whose status is closed won and the close date is between one month..
public class Script_2_6
{
public static void myMethod()
{
     Opportunity o=new  Opportunity();
        List<Opportunity> opp= [SELECT Account.Name From Opportunity WHERE StageName='Closed Won'  AND CloseDate > LAST_MONTH];
        Integer count;
        for(integer i = 0; i <opp.size(); i++) 
        {  
            count = 1;  
            for(integer j = i+1; j <opp.size(); j++)
            {  
                if(opp.get(i)==opp.get(j))                    
                {
                    count++;  
                }  
        }  
           if(count > 10 )  
            System.debug(opp.get(i));  
    }  
}
}


//Create a look up[Lead] on product so that Products come over in related list of a Lead. 
// Write script to create 3 Leads and 5 Products with Lead lookup field.

public class Script_2_7 {
    
    public Static void myMethod(){
        List<Lead> L1=new List<Lead>();
        
        for(Integer i=1;i<=3;i++){
            
            Lead L=new Lead();
            L.NumberOfEmployees=i;
            L.City='haridwar';
            
            L1.add(L);
        }
        insert L1;
        List<Product2> P1=new List<Product2>();
        
        for(Lead ld:L1){
            for(Integer i=1;i<=5;i++){
                Product2 P=new Product2();
                p.Id=ld.Id;
                P.Name='Red'+i;
                P.Family='Colour';
                P1.add(P);
            }
        }
        insert P1;
    }
}


//Create a Script to find out all the users in the systems who are having more than 20 Leads allocated[Owner] to them in month of feb 2019
public class Script_2_8 
{
public static void myMethod()
{
   
      List<AggregateResult> ld=[select owner.name from lead group by owner.name having count(id)>20];
         for(AggregateResult l:ld)
         {
            
        system.debug(l);
           
}
}
}


/*Create an Object "Event" (Name Default field and "Event Date" Date time field). Another Junction Object "Event Participant" with 3 fields
1. lookup Contact
2. lookup Event
3. multipicklist ("Attendee Contact","Presenter Contact", "Organizer Contact")
Write a script to create 10 "Event Participant" with Attendee picklist, 4 with Presenter, 2 with organizer.

public class Script_2_9 {
    
    public static void myMethod(){
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
    }*/






/*//Create 20 new Accounts Records in salesforce with atleast 5 fields filled.
//Sheet Script-1, Q-1
public class Script_1_1 {
    public static void myMethod()
    {

             List<Account> aList=new List<Account>();
             for(Integer i=1;i<=5;i++)
        {
              Account ac=new Account();
            ac.Name='amit'+i;
            ac.AccountNumber='10'+i;
            ac.Phone='123456789'+i;
          	ac.Website='WWW.String.com';
			ac.Site='WWW.Google.com';
            aList.add(ac);
        }
    Insert aList;
    }
}


//Sheet Script-1, Q-2
//Create 10 Contacts with diferent Account(LookUp) values(Relationship with no same 2 accounts) in them.
public class Script_1_2 {
    public static void myMethod()
    {
        List<Contact> conList=new List<Contact>();
        List<Account> aList = [Select id from Account LIMIT 10];
  		for(Account a: aList)
        {
             Contact con=new Contact();
            con.LastName='Singh';
            con.AccountId= a.id;
            con.Email='abc@gmail.com';
            conList.add(con); 
            
        }
        //Insert conList;
        System.debug(conList);
           }
}



//Sheet Script-1, Q-3
//Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
public class Script_1_3 {
    public static void myMethod()
    {
List<Opportunity> opList=new List<Opportunity>();
        for(Integer i=1;i<=10;i++)
        {
Opportunity opp=new Opportunity();            
           opp.StageName= 'Closed won';
            opp.CloseDate=Date.newInstance(2022,08,01);
            opp.Name= 'Singh'; 
            opList.add(opp);
        }
        Insert opList;
        
           }}


//Sheet Script-1, Q-4
//Create 5 Products with different Product Names, Discrption & Family
public class Script_1_4 {
    public static void myMethod()
    {
        List<String> productName=new List<String>{'soup','tea','coffee','fruits','ball'};
        List<String> description=new List<String>{'soup good','tea hot','coffee cold','fruits fresh','ball play'};
        List<Product2> pList=new List<Product2>();
            for(Integer i=0;i<5;i++)
        {
            Product2 p=new Product2();            
            p.Name= productName[i];
        	p.Description= description[i];
            pList.add(p);
            }
        Insert pList;

    }
}


//Delete all contacts belonging to Accounts Name FIELD having 'A' in them.
public class Script_1_5 {
public static void myMethod()
{
    //we are acessing the parent data (account) From child( contact)
List<Contact> AList= [select name, Account.name from Contact where Account.name like '%A%' LIMIT 3];
//System.debug(AList);
  delete Alist;
}
}


//Update all Opportunity with future Closed Date by Opportunity Name=Opportunity Name + ' Updated'

public class Script_1_6 {
public static void myMethod()
{
    //List<Opportunity> oppList1=new List<Opportunity>();
    List<Opportunity> oppList=[SELECT Name,CloseDate FROM Opportunity LIMIT 10] ;
    for(Opportunity o:opplist)
    {	
    //Opportunity opp=new Opportunity();
    o.CloseDate= Date.newInstance(2022, 8, 15);
    o.Name=o.Name+'Updated';
    }
    
  //System.debug(oppList1);
	Update oppList;
}
}


// Display the current salesforce user details 'Name', 'Number' & 'EmailId' and Current Company information.
public class Script_1_7 {
    public static void main(){
        System.debug(Userinfo.getName());
        System.debug(Userinfo.getUserEmail());
        System.debug(Userinfo.getOrganizationName());
    }
}

//Print the Account Names in Alphabetical accending order.
public class Script_1_8 {
    public static void main()
    {
	List <Account> A1=[SELECT name from Account Order By name];
    for(Account A2:A1)
    {
        System.debug(A2);
    }
    }
}


//"Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'"
public class Script_1_9 
{
    public static void main()
    {
        List<Account> A1=[SELECT name from Account];
        for(Account A2:A1)
        {
            System.debug(A2.name.reverse());
        }
    }
}


//Write a script to get all the opportunity name 
//if opportunity' account name is same as the ContactRole Account name and Opportunity is Closed won or closed lost.
public class Script_1_10 
{
    public Static void main()
    {
        List<opportunity> Op1=[SELECT name, Account.name, (SELECT id, contact.account.name from OpportunityContactRoles) from opportunity Where Stagename='Closed Won' or Stagename='Closed lost'];
        for(opportunity op:Op1)
        {
            for(OpportunityContactRole opcr : op.OpportunityContactRoles)
            {
                if(op.account.name==opcr.contact.account.name)
                {
                    System.debug(op.Name);
                }
            }
        }
    }
}
*/