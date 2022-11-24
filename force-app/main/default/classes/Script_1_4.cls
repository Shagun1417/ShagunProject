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