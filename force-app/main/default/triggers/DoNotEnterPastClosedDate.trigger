//Trigger Q2 On Opportunity do not let the user insert Opportunities with past closed Date 
//with following Message "Please enter a future Closed Date"
trigger DoNotEnterPastClosedDate on Opportunity (before insert)
{
    for(Opportunity opp: Trigger.New)
    {
        if(opp.CloseDate<Date.Today())
        {
            opp.addError('Please enter a future Closed Date');
        }
    }
    

}