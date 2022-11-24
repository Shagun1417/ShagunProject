public class Temperature {
    public  Decimal FahrenheitToCelsius(Decimal d)
    {
        Decimal cs= (d-32)*5/9;
        return cs.setScale(2);
    }

}