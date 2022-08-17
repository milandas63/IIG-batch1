import java.text.SimpleDateFormat;
import java.util.Date;

public class PrintDate {
	public static void main(String[] args) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println(sdf.format(today));

		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(today));
	}
	
	SimpleDateFormat sdf;
	public String getDateByISO(String iso, Date dt) {
		String rValue;

		if(iso.equalsIgnoreCase("IN")) {
			sdf = new SimpleDateFormat("dd-MM-yyyy");
			rValue = sdf.format(dt);
		} else if(iso.equalsIgnoreCase("US")) {
			
		}
		return null;
	}

	public String getIndianDate(Date dt) {
		return getDateByISO("IN",dt);
	}
	public String getAmericanDate(Date dt) {
		return getDateByISO("US",dt);
	}
}
