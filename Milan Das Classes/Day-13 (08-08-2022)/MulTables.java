/*
 *
 *29: Print all multiplication tables from 2 to 5?
 *	
	    Example: 2 to 5
	
	     2 x  1 =   2   3 x  1 =   3   4 x  1 =   4   5 x  1 =   5
	     2 x  2 =   4   3 x  2 =   6   4 x  2 =   8   5 x  2 =  10
	     2 x  3 =   6   3 x  3 =   9   4 x  3 =  12   5 x  3 =  15
	     2 x  4 =   8   3 x  4 =  12   4 x  4 =  16   5 x  4 =  20
	     2 x  5 =  10   3 x  5 =  15   4 x  5 =  20   5 x  5 =  25
	     2 x  6 =  12   3 x  6 =  18   4 x  6 =  24   5 x  6 =  30
	     2 x  7 =  14   3 x  7 =  21   4 x  7 =  28   5 x  7 =  35
	     2 x  8 =  16   3 x  8 =  24   4 x  8 =  32   5 x  8 =  40
	     2 x  9 =  18   3 x  9 =  27   4 x  9 =  36   5 x  9 =  45
	     2 x 10 =  20   3 x 10 =  30   4 x 10 =  40   5 x 10 =  50
 * 
 * 
 */
public class MulTables {
	public static void main(String[] args) {
		int start = 2;
		int end = 27;
		
		for(int n=start; n<=end; n++) {
			for(int o=1; o<=10; o++) {
				System.out.println(n + " x " + o + " = " + (n*o));
			}
			System.out.println("-----------------------------");
		}

		System.out.println();System.out.println();

		for(int i=start; i<=end; i+=6) {
			for(int n=1; n<=10; n++) {
				System.out.println();
				for(int o=i; o<=(i+5); o++) {
					System.out.print(padL(o,2) + " x " + padL(n,2) + " = " + padL((n*o),3) + "  ");
				}
			}
			System.out.println();
		}
	}
	
	public static String padL(int i, int l) {
		StringBuffer buf = new StringBuffer(String.valueOf(i));
		for(int j=buf.length(); j<l; j++) { 
			buf.insert(0," ");
		}
		return buf.toString();
	}
}