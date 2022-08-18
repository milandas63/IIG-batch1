import java.util.Scanner;
public class triangle {

	public static void main(String[] args) {
		  Scanner scanner = new Scanner(System.in);
		        System.out.println("Enter the number of rows ");
		        int rows = scanner.nextInt();
		        System.out.println("");
		        
		        for (int i=1; i<=11; i++)
		        {
		            for (int j=11; j>i; j--)
		            {
		                System.out.print(" ");
		            }
		            for (int k=1; k<=(i * 2) -1; k++)
		            {
		                if(  k == 1 || k == (i * 2) -1 ||  i == rows)
		                    System.out.print("*");
		                else
		                    System.out.print(" ");
		            }
		            System.out.println();
		        }
		        scanner.close();
		    }
}
