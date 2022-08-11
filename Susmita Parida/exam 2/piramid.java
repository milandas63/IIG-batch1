package algo;

public class piramid {

	public static void main(String[] args) {
		int space = 40;
		int a = 0  ;
		int j= 10 ;
		    for(int i=a; i<=j; i++) {
			for(int x=0; x<space; x++) System.out.print(" ");
			for(int x=1; x<=i; x++)    System.out.print(x);
			for(int x=i-1; x>0; x--)   System.out.print(x);
			System.out.println();
			space--;

	}

}
}
