import java.util.Scanner;
public class Recursion2
{
String reverse(String s)
{
if(s.length() == 0)
      return " ";
  return s.charAt(s.length()-1) + reverse(s.substring(0,s.length()-1));
}
public static void main(String[ ] arg)
{
Recursion2 rev=new Recursion2();
Scanner sc=new Scanner(System.in);
System.out.print("Enter a string : ");
String  str=sc.nextLine();
System.out.println("Reverse of a String  :"+rev.reverse(str));
}
}
