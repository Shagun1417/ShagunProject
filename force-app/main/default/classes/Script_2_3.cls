//WAP to enter a startDate='06:07:55 2-jan-2016' & endDate='07:08:55 5-feb-2016'
// and display the difference between two dates in Years, months, days, hours, minutes,seconds.
public class Script_2_3 {
        public static void myMethod()
    {
      //  Date d='06:07:55 2-jan-2016'-'07:08:55 5-feb-2016';
      //  DateTime currentDateTime = DateTime.newInstance(2020, 5, 18, 3, 25, 0)-DateTime.newInstance(2020, 5, 18, 3, 25, 0);
      DateTime Startdate=DateTime.newInstance(2016,01,02,6,7,55);
DateTime enddate=DateTime.newInstance(2016,02,05,7,8,55);
System.debug('Year');
System.debug(enddate.Year()-Startdate.Year());
System.debug('Month');
System.debug(enddate.Month()-Startdate.Month());
System.debug('Day');
System.debug(enddate.Day()-Startdate.Day());
System.debug('Hour');
System.debug(enddate.Hour()-Startdate.Hour());
System.debug('Minutes');
System.debug(enddate.Minute()-Startdate.Minute());
System.debug('second');
System.debug(enddate.second()-Startdate.second());
    }

}