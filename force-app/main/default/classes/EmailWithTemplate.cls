public class EmailWithTemplate {
    public static void sendEmailWithTemplate(){
        List<Messaging.SingleEmailMessage> mailList=new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemp=[SELECT Id,Subject,Body FROM EmailTemplate WHERE Name='DDN template'];
        Contact con=[Select id,Name FROM Contact WHERE LastName='Singh'];
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//String[] toAddresses=new String[]{'shagun.singh@cloudanalogy.com'};
   // String subject='Tesxt';
//String body='hellp Shagun Singh';
mail.setTemplateId(emailTemp.Id);
mail.setTargetObjectId(con.Id);
//mail.setPlainT(body);
        mailList.add(mail);
        if(!mailList.isEmpty())
        {
Messaging.sendEmail(mailList);

        }}}