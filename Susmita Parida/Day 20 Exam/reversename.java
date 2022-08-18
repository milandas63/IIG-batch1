package algo;

public class reversename {

	public static void main(String[] args) {
		String str = "we are students of IIG versity";
		StringBuffer buf = new StringBuffer();
		char c;
		for (int i = str.length() - 1; i >= 0; i--) {
			c = str.charAt(i);
			buf.append(c);
		}
		System.out.println(buf);

	}

}
