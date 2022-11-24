@isTest
public class Covid19Test {
   @isTest
        public static void patientNew()
    {
    Covid19 c=new Covid19();
        Integer NumberOfPatientInCity;
         Integer NumberOfPatientInCountry;
        c.patientNew();
        System.assertEquals(1, NumberOfPatientInCity);
        System.assertEquals(1, NumberOfPatientInCountry );
    }
}