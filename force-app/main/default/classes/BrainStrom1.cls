/*"Create a custom object named Student and create following fields-
 Roll number, Email , Name, Total Marks, Percentage, Highest Scoring Subject, Lowest Scoring Subject
 
 Create one more custom object named Score with fields-
 Student (Lookup to Student object)
 Subject (Required)
 Marks (Not greater than 100)
 
 Write a script in apex to calculate Total marks, Percentage, highest scoring subject,
lowest scoring subject of Score records related to a student Object."*/
public class BrainStrom1 {
    public static void myMethod()
    {
       List<Student2__c> s=new List <Student2__c>();
         Decimal mar=0;
       // Decimal []a=new Decimal[2];
       List<Decimal> d=new  List<Decimal>();
        Map<String,Decimal> Scr2 = new Map<String,Decimal>();
       List<Score__c> sc=[SELECT  Mark__c, Name FROM Score__c   ];
    for(Score__c sc1: sc)
    {
         mar = sc1.Mark__c +mar;
        d.add(sc1.Mark__c);
        scr2.put(sc1.Name,sc1.Mark__c);
    }
        //Mark__c Integer mar = sc.Mark__c;
      //List<Integer> mar= sc;
   
   System.debug('total marks' +mar);    
           System.debug(scr2);    

    
        List<Student2__c> s1=[SELECT id FROM Student2__c Where name='rihan'];
        for(Student2__c s2:s1)
        {
          //  Score__c sc=new Score__c();
          // s2.Id= sc.Id;
            s2.Total_marks__c= mar ;
            s2.Percentage__c= mar/2;
               if(d[0]>d[1])
       {
           s2.Highest_Scoring_Subject__c='English';
          
       }
               if(d[1]<d[0])
       {
          
           s2.Lowest_Scoring_Subject__c='Maths';
       }
           
                
           s.add(s2);
        }
        System.debug(s);
        
        }

}