package ExAm;

public class Printnumber2 {
	public static void main(String[] args) {

			String text = "lmx sr ipizirxl";
			char each;
			StringBuffer buf = new StringBuffer();

			for (int i = 0; i < text.length(); i++) {
				each = text.charAt(i);
				if (each >= 65 && each <= 90) {
					each += 32;
				} else if (each >= 97 && each <= 122) {
					each -= 4;
				}
				buf.append(each);
			}
			System.out.println("Original: " + text);
			System.out.println("Converted:" + buf);
		}

	}
