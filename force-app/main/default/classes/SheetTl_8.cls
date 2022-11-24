//" "Find atleast 5 Account from your ORG having highest number of Contacts and 
// and It should be displayed in ascending order.
// Create a map to store number of contacts in key and list of associated contacts in value.
// If two Accounts having the same number of Contacts 
// then it should display only one Account among them(Accounts having same no. of Contacts)."

public class SheetTl_8 {
    public static void myMethod(){
        // Integer num=0;
        //  List<String> SList=new List<String>{'red','green','blue'};
          List<String> SList=new List<String>();
        map<Id,Integer> m= new map<Id,Integer>();
        map<Integer,List<String>> ma= new map<Integer,List<String>>();
        // List<Account> accList=[Select Id,(Select Id, Name From Contacts) From Account Limit 10];
        List<Aggregateresult> agList= [select  AccountId aid, Count(Name) cid from Contact  Where AccountId!=NULL
                                       group by AccountId ORDER BY Count(Name) DESC Limit 5];
        for(Aggregateresult r : agList){
            m.put( (ID)r.get('aid'), (Integer)r.get('cid') );
            //    m1((Integer)r.get('cid'),(String) )
            // m.put( (Integer)r.get('cid'), );
            
        }
        
        //  List<String> SList=new List<String>();
        //  SList.addAll(m.keySet());
        String []str= new String[5];
        List<Account> acli = [select Id, Name, (Select Name From Contacts)  from Account where id IN :m.keyset() ];
        for(Account acc : acli){
             // System.debug('Account Name-  '+acc.Name);
            for(Contact con : acc.Contacts)
            {
                System.debug(con.Name);
                 
              //  System.debug(acc.Name);
                  //SList.add(con.Name);
                //Break;
                         //  ma.put(m.get(acc.Id), Con.Name);
               // str= con.LastName;
             //   if(ma.containKey(acc.Id)){     
                  //  List<String> SList= ma.get(m.get(acc.Id));
                 //  List<String> SList=new List<String>();
                SList.add(con.Name);
                // ma.put(m.get(acc.Id), SList);
            //    }             
            }
            System.debug('\n');
            ma.put(m.get(acc.Id), SList);
        }
        /* for(Integer i:ma.keyset())
{
System.debug(i.Keyset()+' => '+i.values());
}*/
        //System.debug(Slist);
        for(Integer i : ma.Keyset())
        {
        //System.debug(m.Keyset());
        System.debug(i+'  ==> '+ma.get(i));
    }}
}
// for(Account acc: accList){
//   for(Contact c : acc.Contacts){
//Id accid  =c.AccountId;
//    if(acc.Id==c.Id){
// ++num;
// }
//  conList.add(con.Id);
//   System.debug('num'+num +'  NameContact:-'+ c.Name +' Id--'+c.Id);
//  m.put(acc.Id,num);
// }
//}
// System.debug(m.Keyset());
// System.debug(m.values());
//for Sorting the map by the help of list
//    List<Id> aList = new List<Id>();
//aList.addAll(m.keySet());
//aList.sort();
//so here you will get sorted total base on key
/*for(Id a: aList)
{
System.debug( '::::::::::::: ' + m.get(a)) ;
}*/