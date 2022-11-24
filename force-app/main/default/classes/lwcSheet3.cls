public class lwcSheet3 {
    @AuraEnabled
    public static void getOpportunity(string oppId, date closeDateOpp) {
        opportunity opp = new opportunity();
        opp.Id=oppId;
        opp.CloseDate= closeDateOpp;
        update opp;
        System.debug(opp);

    }
}