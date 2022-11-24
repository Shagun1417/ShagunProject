public class CreateSObject {
    public static void main()
    {
        SObject sObj=new Account();
       // sObj.Name='Shagun'; ERRor
        sObj.put('Name' ,'Shagun');
  //Error     System.debug(sObj.get(Name));
     //Error   sObj.get
     System.debug(sObj.get('Name'));
 String str = (String)sObj.get('Name');    
    }

}