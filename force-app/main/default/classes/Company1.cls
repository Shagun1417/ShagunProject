public class Company1 {
    public String companyName;
   public Integer y=7;
    //privateInenerClass
    private class Client
    {
        
        public String clientName;
         public String website;
         public String email;
         public Long phone;
        Client(String clientName,String website,String email,Long phone)
        {
            this.clientName=clientName;
            this.website=website;
            this.email=email;
            this.phone=phone;
        }
    }
    
    private List<Client> customers=new List<Client>();
    
    public void addNewCustomer(String name,String website,String email, Long phone)
    {
        Client customer = new Client(name,website,email,phone);
            customers.add(customer);
    }
    public void getAllCustomer()
    {
        for(Client customer:customers)
        {
            System.debug(customer.clientName );
           System.debug(customer.website);
        }
        
    } 

}