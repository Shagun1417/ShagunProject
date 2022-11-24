//Print any Integer number in reverse order. Ex: 789234  => 432987
public class Script_2_2 {
public static void myMethod()   
{  
Integer num = 789234, reverse = 0;  
while(num != 0)   
{  
Integer remainder = math.mod(num, 10);  
reverse = reverse * 10 + remainder;  
num = num/10;  
}  
System.debug('The reverse of the given number is: ' + reverse);  
}  
}