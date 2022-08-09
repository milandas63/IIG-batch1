import java.util.StringTokenizer;

public class SplitWords {

	public static void main(String[] args) {
		String text = "Hello,World,in,a,frame";
		StringTokenizer token = new StringTokenizer(text,",");
		String word;
		for(int i=0; i<14; i++) System.out.print("*");
		System.out.println();
		while(token.hasMoreTokens()) {
			word = token.nextToken();
			System.out.println("* " + padR(word,10) + " *");
		}
		for(int i=0; i<14; i++) System.out.print("*");
		System.out.println();
	}

	public static String padR(String data, int length) {
		StringBuffer buf = new StringBuffer(data);
		for(int i=buf.length(); i<length; i++) buf.append(" ");
		return buf.toString();
	}
}
