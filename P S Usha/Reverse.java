
public class Reverse {

	public static void main(String[] args) {
		String str ="Hello World";
		Reverse obj = new Reverse();
		obj.reverse(str);
}
	void reverse(String str)
{
   if ((str==null)|| (str.length() <=1))
	   System.out.println(str);
   else
{
System.out.print(str.charAt(str.length() -1));
reverse (str.substring(0, str.length()-1));
     }
	   
  }
}
