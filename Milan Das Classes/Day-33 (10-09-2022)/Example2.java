package excep.handling;

public class Example2 {

	public static void main(String[] args) {
		String text = "Computer People";
		int n = 50;
		int x = 25;
		int y = 0;

		for(int i=0; i<3; i++) {
			try {
				System.out.println(text.charAt(n));
				System.out.println(x/y);
				System.out.println("Exception free");
			} catch(StringIndexOutOfBoundsException e) {
				n = 10;
			} catch(ArithmeticException e) {
				y = 5;
			} catch(ClassCastException e) {

			} catch(TestException e) {
			}
		}
	}

}

class TestException extends RuntimeException {
	
}