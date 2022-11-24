public class Demo {
    public void valueMethod()
    {
        String websiteUrl ='www.apex.com';
        System.debug('Before call value' +websiteUrl);
        passByValue( websiteUrl);
         System.debug('After call value' +websiteUrl);
    }
    private void passByValue(String websiteUrlValue)
    {
        websiteUrlValue='www.salesforce.com';
    }

}