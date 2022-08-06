package demo.string;

import java.util.Date;

public class DemoString {

	public static void main(String[] args) {
		String name = "Mahatma Gandhi";
		int l = name.length();
		System.out.println(l);
		
		byte[] bt = {65,66,67,68,69,70,71,72,73,74,75};
		String alpha = new String(bt);
		System.out.println(alpha);
		
		for(int i=0; i<alpha.length(); i++) {
			System.out.println(i+" = "+alpha.charAt(i));
		}
		
		for(int i=alpha.length()-1; i>=0; i--) {
			System.out.println(alpha.charAt(i));
		}

		Date now = new Date();
		System.out.println(now);
	}

}
