
public class Timer {

	public static void main(String[] args) {
		int spaces = 10;
		int stars = 17;
		int lines = 21;
		
		for(int i=0; i<lines; i++) {
			for(int j=0; j<spaces; j++) System.out.print(" ");
			for(int j=0; j<stars; j++)  System.out.print("*");
			System.out.println();
			if(i<8) {
				spaces++;
				stars -= 2;
			} else {
				spaces--;
				stars += 2;
			}
		}
	}

}
