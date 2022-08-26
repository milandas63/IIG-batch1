public class A4 {
	static void printAP(int a, int d, int n)
	{

	    int curr_term;
	curr_term=a;
	    for (int i = 1; i <= n; i++)
	    { System.out.print(curr_term + " ");
	    curr_term =curr_term - d;
	    
	    }
	}
	
	public static void main(String[] args)
	{	
	int a = 36;

	int d = 4;

	int n = 9;
	 
	printAP(a, d, n);
	}
}
	
