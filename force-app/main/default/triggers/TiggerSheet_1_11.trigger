//Write a Trigger to create a default Contact, Case, Opporunity and Contact Role. 
//whenever an Account is created with Number of Employees > 100. 
//Make sure the Contact is in contact field of Case as well as related to Opporutnity inn Contact Role.
trigger TiggerSheet_1_11 on Account (before insert) {
    for(Account acc:Trigger.new)
    {
        if(acc.NumberOfEmployees>100)
        {
           Contact con=new Contact();
           con.AccountId=acc.Id;
            con.LastName='Trigger_11';
            Insert con;
            
            Opportunity opp= new Opportunity();
            opp.AccountId=acc.Id;
            opp.Name='Trigger_11';
            opp.CloseDate=System.Today();
            opp.StageName='Closed won';
            insert opp;
                 
            OpportunityContactRole ocr = new OpportunityContactRole();
            ocr.ContactId = acc.Id;
            ocr.OpportunityId=acc.Id;
            insert ocr;
            
            Case cs = new Case();
            cs.ContactId= cs.Id;
            cs.AccountId= cs.Id;
            insert cs;
            
            }
            }

}