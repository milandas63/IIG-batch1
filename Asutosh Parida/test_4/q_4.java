package test4;

public class q_4 {

	public static void main(String[] args) {
		int sum = 0;
	    System.out.println("Enter number:");

	    int num = Integer.parseInt(br.readLine());
	    if (num % 2 == 0) {
	        for (int x = num; x <= 6; x++) 
	        {
	            System.out.print(num + " ");
	            sum = sum + num;
	            num = num + 2;
	        }
	        System.out.println("");
	        System.out.println("Sum is " + sum);
	    }

	}

}
