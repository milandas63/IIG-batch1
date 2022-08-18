package hhh;

public class question3 {
	static void printPattern(int N)
	{
	   
	    for (int i = 1; i <= N; i++) {
	   
	        System.out.print(" "+((i == 0) ? (i*2 +1) : (i *2- 1)));
	    }
	}
	   
	public static void main(String[] args) {

		   
	    int N = 10;
	   
	
	    printPattern(N);
	}

}
