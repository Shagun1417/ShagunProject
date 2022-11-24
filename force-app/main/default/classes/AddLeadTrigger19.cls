public class AddLeadTrigger19 {
public static void myMethod()
{
    List<Lead> l= new List<Lead>();
    for(Integer i=0;i<=5;i++)
    {
        Lead l1=new Lead();
        l1.LastName='Trigger19'+i;
        l1.Company='Trigger19Company'+i;
        l.add(l1);
       
    }
    Insert l;
}
}