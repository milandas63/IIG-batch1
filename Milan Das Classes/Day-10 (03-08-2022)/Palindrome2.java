
public class Palindrome2 {

	public static void main(String[] args) {
		int n = 1;
		int space = 40;
		for(int i=1; i<=9; i++) {
			for(int j=1; j<=space; j++) System.out.print(" ");
			for(int j=1; j<=n; j++)     System.out.print(i);
			System.out.println();
			n = n + 2;
			space--;
		}
	}

}
