//BrainStroming Question
trigger StudentRecord on Student2__c (before insert) {
    Score__c s=new Score__c();
 //   List<Score__c>lst=newList<Score__c>();
// s.Subject__c[]STring=new 
    
    for(Student2__c stu: Trigger.New)
   {
       stu.Percentage__c=(stu.Total_Marks__c/5);
    //  if()
      // stu.Highest_Scoring_Subject__c=
      
   }
}