
public class Diamond {

	public static void main(String[] args) {
		int spaces = 25;
		int stars = 1;
		int lines = 21;
		for(int i=0; i<lines; i++) {
			for(int j=0; j<spaces; j++)  System.out.print(" ");
			for(int j=0; j<stars; j++)   System.out.print("*");
			System.out.println();
			if(i<=9) {
				spaces--;
				stars+=2;
			} else {
				spaces++;
				stars-=2;
			}
		}
	}

}
