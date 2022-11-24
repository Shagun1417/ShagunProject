trigger Sendemail on Contact (after insert) {}
/* List<Messaging.SingleEmailMessage> maillist = new list<Messaging.SingleEmailMessage>();
     for(Contact con: Trigger.New)
    {
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        string[] em=new string[]{con.Email};
      mail.setSubject('Test trigger email');
              mail.setPlainTextBody('Test trigger email body');
        mail.setToAddresses(em);

        maillist.add(mail);
        if(!maillist.isEmpty()){
            Messaging.sendEmail(maillist);
        }
    }

}*/