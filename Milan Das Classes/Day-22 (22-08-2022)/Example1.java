package excep;

import java.lang.annotation.AnnotationTypeMismatchException;

public class Example1 {
	public static void main(String[] args) {
		int value = Integer.parseInt("301");
		System.out.println(value);

        try {
            int i=25;
            int j=0;
            double s = i/j;
            System.out.println(s);
            System.out.println("-----------");
            System.out.println();
        } catch(NullPointerException e) {
            System.out.println("1: " + e);
        } catch(ArrayIndexOutOfBoundsException e) {
            System.out.println("2: " + e);
        } catch(ArithmeticException e) {
            System.out.println("3: " + e);
        } catch(ClassCastException e) {
            System.out.println("4: " + e);
        } catch(ExceptionClass e) {
            System.out.println("5: " + e);
        } catch(AnnotationTypeMismatchException e) {
        	
        }
	}
}

class ExceptionClass extends RuntimeException {

}