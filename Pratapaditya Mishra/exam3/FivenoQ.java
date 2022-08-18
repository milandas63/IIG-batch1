package Javame;

public class FivenoQ {
	public static void main(String[] args) {
		java.lang.String str = "We are students of IIG Varsity";
		System.out.println(makeReverse(str));
	}

	static java.lang.String makeReverse(java.lang.String str) {
		StringBuffer s = new StringBuffer(str);
		str = s.reverse().toString();
		java.lang.String[] rev = str.split(" ");
		StringBuffer reverse = new StringBuffer();
		for (int i = rev.length - 1; i >= 0; i--) {
			reverse.append(rev[i]).append(" ");
		}
		return reverse.toString();
	}
}