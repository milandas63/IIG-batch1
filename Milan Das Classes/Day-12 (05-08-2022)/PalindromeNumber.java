
public class PalindromeNumber {

	public static void main(String[] args) {
		int spaces = 30;
		int lines = 9;
		
		for(int i=1; i<=lines; i++) {
			for(int j=0; j<spaces; j++) System.out.print(" ");
			for(int j=1; j<=i; j++)     System.out.print(j);
			for(int j=(i-1); j>0; j--)  System.out.print(j);
			spaces--;
			System.out.println();
		}
	}

}
