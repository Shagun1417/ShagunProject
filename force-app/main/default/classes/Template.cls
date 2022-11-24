public class Template {
    public static void sendEmailWithoutTemplate(){
        List<Messaging.SingleEmailMessage> mailList=new List<Messaging.SingleEmailMessage>();
        
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses=new String[]{'shagun.singh@cloudanalogy.com'};
    String subject='Tesxt';
String body='hellp Shagun Singh';
mail.setToAddresses(toAddresses);
mail.setSubject(subject);
mail.setPlainTextBody(body);
        mailList.add(mail);
        if(!mailList.isEmpty())
        {
Messaging.sendEmail(mailList);

        }}}