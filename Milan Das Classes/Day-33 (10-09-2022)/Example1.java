package excep.handling;

public class Example1 {

	public static void main(String[] args) {
        try {
            int x = 25;
            int y = 5;
            double p = x/y;
            System.out.println("There is no exception!");
        } catch(ArrayIndexOutOfBoundsException e) {
        	System.out.println("ArrayIndexOutOfBoundsException");
        	e.printStackTrace();
        } catch(ClassCastException e) {
        	System.out.println("ClassCastException");
        	e.printStackTrace();
        } catch(ArrayStoreException e) {
        	System.out.println("ArrayStoreException");
        	e.printStackTrace();
        } catch(ArithmeticException e) {
        	System.out.println("ArithmeticException");
        } finally {
        	System.out.println("This is finally block");
        }
	}

}
