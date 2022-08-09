/*
 * Write a program to display a piramid of Astericks
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
 */
public class Piramid {
	public static void main(String[] args) {
		int star = 1;
		int space = 40;
		
		for(int i=0; i<10; i++) {
			for(int j=0; j<space; j++) System.out.print(" ");
			for(int j=0; j<star; j++)  System.out.print("*");
			System.out.println();
			star += 2;
			space--;
		}
	}
}
