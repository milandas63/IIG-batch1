/*
 * sum = 1+2+3+4+5+......  50
 * sum = 1+3+5+7+9+......  50th
 */

public class Sum {

	public static void main(String[] args) {
		System.out.println("Hello world Hemram & Rakesh & Priyabrata");
		int sum = 0;
		int count = 0;
		int i = 0;
		for(;;) {
			i = i + 1;
			count = count + 1;
			sum = sum + i;
			if(count==50) {
				break;
			}
		}
		System.out.println(sum);
	}

}
