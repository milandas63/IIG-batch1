package java4;

public class ans_2 {

	
		  static int a(int n)
		    {
		        int sum = 0;
		        while (n > 0 || sum > 9)
		        {
		            if (n == 0) {
		                n = sum;
		                sum = 0;
		            }
		            sum += n % 10;
		            n /= 10;
		        }
		        return sum;
		    }
		    public static void main(String argc[])
		    {
		        int n = 875649;
		        System.out.println(a(n));

	}

}
