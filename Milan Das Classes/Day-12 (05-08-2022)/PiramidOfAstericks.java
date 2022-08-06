
public class PiramidOfAstericks {

	public static void main(String[] args) {
		int spaces = 25;
		int stars = 1;
		int lines = 10;
		for(int i=0; i<lines; i++) {
			for(int j=0; j<spaces; j++)  System.out.print(" ");
			for(int j=0; j<stars; j++)   System.out.print("*");
			System.out.println();
			spaces--;
			stars+=2;
		}
	}

}
