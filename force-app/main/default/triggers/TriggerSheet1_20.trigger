// Write a trigger on Contact and fill its Mailing Address with its Account's Shipping Address.
trigger TriggerSheet1_20 on Contact (after insert, after update) {
    
 List<Contact> C1=new List<Contact>();
    List<Account> A=[SELECT Name, ShippingCountry, ShippingPostalCode, ShippingCity from Account];
    for(Account A2:A){
        for(Contact C:trigger.new){
            Contact C2=new Contact();
             C2.LastName=A2.Name;
            C2.MailingCountry=A2.ShippingCountry;
            C2.MailingPostalCode=A2.ShippingPostalCode;
            C2.MailingCity=A2.ShippingCity;
        
            C1.add(C2);
        }
    }
    insert C1;
}