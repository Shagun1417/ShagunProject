@isTest
public class TemperatureTest {
    @isTest
    public static void FahrenheitToCelsius()
    {
    Temperature t=new Temperature();
  Decimal num=   t.FahrenheitToCelsius(70);
        System.assertEquals(21.11,num,'hi');
        }
}