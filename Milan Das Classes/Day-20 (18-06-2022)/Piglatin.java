
public class Piglatin {

	public static void main(String[] args) {
		String text = "Hello World";
		StringBuffer buf = new StringBuffer();
		char vowels[] = {'A','E','I','O','U','a','e','i','o','u'};
		char c;
		for(int i=0; i<text.length(); i++) {
			c = text.charAt(i);
			buf.append(c);
			for(int j=0; j<vowels.length; j++) {
				if(c==vowels[j]) {
					buf.append("r");
					break;
				}
			}
		}
		System.out.println(buf);
	}

}
