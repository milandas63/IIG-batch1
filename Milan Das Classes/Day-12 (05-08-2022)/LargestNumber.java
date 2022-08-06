
public class LargestNumber {

	public static void main(String[] args) {
		int a = 30;
		int b = 50;
		int c = 40;
		
		if(a>b) {
			if(a>c) {
				System.out.println("A is greater: "+a);
			} else {
				System.out.println("C is greater: "+c);
			}
		} else if(b>c) {
			System.out.println("B is greater: "+b);
		} else {
			System.out.println("C is greater: "+c);
		}
	}

}
