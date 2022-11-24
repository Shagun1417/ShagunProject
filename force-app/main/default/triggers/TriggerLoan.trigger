/*Person Account
- Name (Text)
- Father's Name (Text)
- Address (Text)

Loan Data
- Name (Text)
- Loan Status [Picklist- Active, Inactive]
- Person (Lookup)
- Loan Taken Date (DateTime)
- Loan Amount (Number)

Q.1.1 Write a script to create 10 Person Account records and provide three loans to each person.
One person cannot take more than $10000 at once.

Q.1.2 Write a trigger to not let the person lend more than $50000 in total. 
Throw an error " You can not take a loan more than $50000."

Q.1.3 Write the test class to validate 

NOTE:- Count only those loan amounts that are active.*/

trigger TriggerLoan on Loan_Data__c (before insert, before update) {
    Set<Id> ptid=new Set<Id>();
    // Set<Id> drid=new Set<Id>();
    for(Loan_Data__c app:Trigger.new)
    {
        ptid.add(app.Person__c	);
        // drid.add(app.c);
    }
    // Integer tot=0;
    Decimal amt=0;
    List<Person__c> applist= [Select Id, Name,(Select id, Loan_Amount__c From Loans_Data__r) From Person__c Where id in : ptid];
    for(Person__c	 a: applist)
    {
       // Decimal d=a.Loans_Data__r.Loan_Amount__c;
        for(Loan_Data__c app1:Trigger.new)
        {
            // if(a.id== app1.Person__c)
            
       //       AggregateResult[] total = [SELECT SUM(Loan_Amount__c)tot FROM Loan_Data__c];
     //      Decimal tot = (Decimal)total.get('tot');
            // if(app1.Loan_Amount__c>50000 )
            //Integer   total_used = Total[0].get('expr0');
            //   for(AggregateResult pl:total){
            //   tot=0;
            //   tot=tot+integer.valueof(pl.get('total'));    }
            //   
            
            //   tot = integer.valueof(Total.get('Total'));  
            //  if(tot>50000 ){
             amt = app1.Loan_Amount__c + amt;
            if(amt>50000 && app1.Loan_Status__c=='Active' && a.id== app1.Person__c)
                app1.addError('Loan amount less the 50000');
        }
    System.debug('amt='+ amt);
    }
}