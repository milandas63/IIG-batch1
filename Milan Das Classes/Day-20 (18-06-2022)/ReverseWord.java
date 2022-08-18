import java.util.StringTokenizer;
public class ReverseWord {
	public static void main(String[] args) {
		String text = "Quick Brown Fox Jumps Over The Lazy Dog";
		StringTokenizer stk = new StringTokenizer(text);
		StringBuffer rev = new StringBuffer();
		String each;
		while(stk.hasMoreTokens()) {
			each = stk.nextToken();
			//System.out.println(each);
			rev = new StringBuffer(each);
			System.out.print(rev.reverse()+" ");
		}
	}
}

