import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class UseMathClass {
	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println(Math.min(243, 342));
		System.out.println(Integer.parseInt("25"));
		System.out.println(Math.pow(2, 3));
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy Y");
		System.out.println(sdf.format(dt));
		
		Calendar c = Calendar.getInstance();
		Class c1 = Class.forName("java.lang.String");
	}
}

class Class_A {
	
}