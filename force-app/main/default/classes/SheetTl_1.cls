//"Create custom fields
 //  - TotalMoney(currency) on Order
   //- Money(currency) on OrderItem
//Write a script to create orderItems for order with the help of custom pricebook and count the money and put into TotalMoney."
public class SheetTl_1 {
    public static void myMethod(){
        Decimal num =0;
         List<Order> orList=new List<Order>();
        List<Order> oList= [Select Total_Money__c,(Select Money__c from OrderItems) from Order];
        for(Order o:oList){
            for(OrderItem oi: o.OrderItems){
                if(oi.Money__c!=null){
                     num=num+oi.Money__c;
                    System.debug(num );
               // o.Total_Money__c=oi.Money__c;
                }
                    System.debug(oi.Money__c);
            }
             o.Total_Money__c=num;
            System.debug(o.Total_Money__c);
           // orList.add(o);
        }
//Insert oList;
     Update oList;
    }
}