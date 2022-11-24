//triggersheet_1   On Account to create a 'Default' (number of contacts= numbers of employee) 
//contact every time an account is created
trigger AddContactTrigger on Account (After insert)
{
    List<Contact> con=new List<Contact>();
for(Account acc: Trigger.New)
{
Integer c= acc.NumberOfEmployees;
for(Integer i=0;i<c;i++)
{
Contact c1= new Contact();
c1.LastName=acc.Name+i;
c1.AccountId=acc.Id;
con.add(c1);
}
Insert con;
}}
/*
    List<Contact>con1=new List<Contact>();
    for(Account acc : Trigger.new)
    {
        Decimal n = acc.NumberofLocations__c;
        for(Decimal i=1;i<=n;i++)
        {
            Contact con = new Contact();
            con.AccountId=acc.Id;
            con.LastName= 'Singh'+ i;
            con1.add(con);
        }
        
    }
    insert con1;
}*/