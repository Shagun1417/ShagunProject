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