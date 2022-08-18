public class AnsFive {
public static void main(String[] args) {
	String str = "We are students of IIG Varsity";
	StringBuffer buf = new StringBuffer();
	char c;
	for(int i=str.length()-1;i>=0;i--) {
		c=str.charAt(i);
		buf.append(c);
	}
	System.out.println(buf);
}
}