/*
 * Write a program to display a diamond of Astericks
 *                                 *
 *                                ***
 *                               *****
 *                              *******
 *                             *********
 *                            ***********
 *                           *************
 *                          ***************
 *                         *****************
 *                        *******************
 *                         *****************
 *                          ***************
 *                           *************
 *                            ***********
 *                             *********
 *                              *******
 *                               *****
 *                                ***
 *                                 *
 */
public class Diamond {
	public static void main(String[] args) {
		int star = 1;
		int space = 40;
		
		for(int i=0; i<19; i++) {
			for(int j=0; j<space; j++) System.out.print(" ");
			for(int j=0; j<star; j++)  System.out.print("*");
			System.out.println();
			if(i<9) {
				star += 2;
				space--;
			} else {
				star -= 2;
				space++;
			}
		}
	}
}
