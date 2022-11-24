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

public class AddLoan {
public  static void myMethod()
{
      // Set<Id> ptid=new Set<Id>();
        List<Loan_Data__c> ldList = new List<Loan_Data__c>();
    List<Person__c> pList = [Select Name, Id From Person__c];
    for(Person__c p:pList)
    {
        for(Integer i=0;i<=2;i++)
        {
            Loan_Data__c ld = new Loan_Data__c();
            ld.Person__c=p.id;
            ld.Name='loan'+i;
            ld.Loan_Amount__c=1000;
            ld.Loan_Status__c='Active';
            
            
            ldList.add(ld);
        }
     //   insert ldList;
       // ptid.add(p.id);
    }
     insert ldList;
}
}