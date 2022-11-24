//trigger to check if last name is invalid
trigger MyTrigger1 on Contact (before insert) {
//check contacts prior to insert or update for valid data
for(Contact c : Trigger.New)
{
    if(c.LastName=='INVALIDNAME')
{
    c.AddError('The last Name '+c.LastName+'is not allowed for DML');
    }
}
}