package algo;

public class digit {
public static void main(String[] args) {
		String[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" };
		int[] number = {364103,933667,432890};
		StringBuffer buf;
		String n;
		char c;
		int i;
		for(int k=0; k<number.length; k++) {
			buf = new StringBuffer();
			n = String.valueOf(number[k]);
			for(int j = 0;j<n.length();j++) {
				c=n.charAt(j);
				i=(int)(c-48);
				buf.append(digits[i]+" ");
			}
			System.out.println(buf);

	}
	}
}

