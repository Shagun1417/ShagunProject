//Create a future method to increase the price of all the products in Product object by $ 0.25.
public class ProductPrice 
{
    @future
public static void IncreasePrice(List<Id> proIds)
{
    List<Product2> proList= [SELECT Id From Product2 WHERE Id IN: proIds];
    for(Product2 pro : proList)
    {
        
        PricebookEntry pbe = new PricebookEntry();
        
        pbe.UnitPrice = pbe.UnitPrice + 0.25;
    }
    
}
  
}