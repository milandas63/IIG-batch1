
public class NumberPiramid {

	public static void main(String[] args) {
		int spaces = 40;
		int num = 1;
		
		for(int i=0; i<=9; i++) {
			for(int j=0; j<spaces; j++) System.out.print(" ");
			for(int j=0; j<num; j++)    System.out.print(i);
			System.out.println();
			num += 2;
			spaces--;
		}
	}

}
