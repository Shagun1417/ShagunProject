trigger TriggerAddPerson on Person__c (after insert) {
      set<id> pId =new set<id>();
        for(Person__c p: Trigger.new)
        {
            pId.add(p.id);
            
        }
        List<Loan_Data__c> dList = new List<Loan_Data__c>();
       List<Loan_Data__c> ld=[Select id, Loan_Amount__c From Loan_Data__c Where Person__c in : pId];
        {
             Loan_Data__c ld1= new Loan_Data__c();
           // ld1.Person__c=
        ld1.Loan_Amount__c=0;
             ld1.Name= 'abc';
             DList.add(ld1);
             
        }
         
      Insert DList;
       
    }