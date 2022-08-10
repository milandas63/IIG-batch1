/*
 * 		Hello World
 * 		H - 1
 *      e - 1
 *      l - 3
 *      o - 2
 */

public class CountAlpha {
	public static void main(String[] args) {
		String name = "Hello World";
		int count[] = new int[26];
		for(int i=0; i<26; i++) count[i] = 0;
		
		char c;
		int n;
		for(int i=0; i<name.length(); i++) {
			c = name.charAt(i);
			if(c>=65 && c<=90) {
				count[c-65]++;
			} else if(c>=90 && c<=122) {
				n = c-32;
				count[n-65]++;
			}
		}

		for(int i=0; i<count.length; i++) {
			if(count[i]>0) {
				System.out.println((char)(i+65) + " = " + count[i]);
			}
		}
	}
}
