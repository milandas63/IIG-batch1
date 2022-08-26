
public class Print5num_2 {
	static void printPattern(int N)
	{
	    for (int i = 1; i <= N; i++) {
	   
	        System.out.print(" "+((i % 2 == 0) ? (i - 1) : (i + 1)));
	    }
	}
	
	public static void main(String args[])
	{
	    int N = 20;

	    printPattern(N);
	   
	}
}
