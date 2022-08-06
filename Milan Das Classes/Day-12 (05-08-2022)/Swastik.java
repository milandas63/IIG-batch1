
public class Swastik {

	public static void main(String[] args) {
		int spaces = 20;
		for(int line=0; line<30; line++) {
			for(int k=0; k<spaces; k++) System.out.print(" ");
			for(int j=0; j<20; j++) {
				System.out.print("*");
			}
			for(int j=0; j<20; j++) {
				System.out.print(" ");
			}
			System.out.print("*");
			System.out.println();

		}
	}

}
