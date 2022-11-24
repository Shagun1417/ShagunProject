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

public class AddPerson {
public  static void myMethod()
{
   
             List<Person__c> aList=new List<Person__c>();
             for(Integer i=1;i<=10;i++)
        {
              Person__c ac=new Person__c();
            ac.Name='abc'+i;
            ac.Father_Name__c= 'xyz'+i;
            ac.Address__c='mno'+i;
            
          
            aList.add(ac);
        }
    Insert aList;
    
    
    }
}