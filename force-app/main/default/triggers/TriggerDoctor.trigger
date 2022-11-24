trigger TriggerDoctor on Appointment__c (before insert) {
    Set<Id> ptid=new Set<Id>();
    Set<Id> drid=new Set<Id>();
  //Date da=[Select Appointment_Date__c From Appointment__c limit 1][0].Appointment_Date__c;
   Date da= date.newInstance(2022,8,31);
    for(Appointment__c app:Trigger.new)
    {
        ptid.add(app.Patients__c);
        drid.add(app.Doctor__c);
    }
    List<Patient__c> applist= [Select Id, Name,(Select id From Appointments__r ) From Patient__c Where id in : ptid];
    for(Patient__c a: applist)
    {
        for(Appointment__c app1:Trigger.new)
        {
            if(a.Appointments__r.size()>1 )
                app1.addError('patient have appointment before');
        }
    }
    List<Doctor__c> dlist= [Select Id, Name,(Select id, Appointment_Date__c From Appointments__r ) From Doctor__c Where id in : drid];     
    for(Doctor__c d: dlist)
    {
        for(Appointment__c app1:Trigger.new)
        {
            if(d.Appointments__r.size()>1 && d.Id==app1.Doctor__c && da==app1.Appointment_Date__c )
                app1.addError('Cant enter more then 1 pateint on this date ');
        }
        
        //Where Appointment_Date__c=
        //dfo
        
    }
}