/*
 * Write a program to count the number of vowels used in a given string?
 */

public class VowelCount {
	static String text = "Quick Brown Fox Jumps Over The Lazy Dog";
	//                    qUICK bROWN fOX jUMPS oVER tHE lAZY dOG
	//static String text = "We are student of Java Technology";

	public static void main(String[] args) {
		char[] vowels = {'A','E','I','O','U','a','e','i','o','u'};
		char each;
		int count = 0;
		for(int i=0; i<text.length(); i++) {
			each = text.charAt(i);
			for(int j=0; j<vowels.length; j++) {
				if(each==vowels[j]) {
					count++;
					break;
				}
			}
		}
		System.out.println("Total vowels = "+count);
		System.out.println("---------------------------------------");

		StringBuffer buf = new StringBuffer();
		for(int i=0; i<text.length(); i++) {
			each = text.charAt(i);
			if(each>=65 && each<=90) {
				each=(char) (each+32);
				buf.append(String.valueOf(each));
			} else if(each>=97 && each<=122) {
				each=(char) (each-32);
				buf.append(String.valueOf(each));
			} else {
				buf.append(each);
			}
		}
		System.out.println(buf);
	}
	
}

/*
 * A = 65
 * Z = 90
 * a = 97
 * z = 122
*/