@isTest
public class ScriptTest_1_2 {
@isTest
    public static void myMethodTest()
    {
        Account acc=new account();
        acc.Name='shagunn';
        insert acc;
        
        contact con=new contact();
        con.AccountId=acc.Id;
        con.LastName='Singh';
          //  con.AccountId= a.id;
            con.Email='abc@gmail.com';
         //   conList.add(con);
         insert con; 
         
     Script_1_2.myMethod();   
    }
}