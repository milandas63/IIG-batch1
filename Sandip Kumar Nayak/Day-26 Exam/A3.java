public class A3 {
	public static void main(String[] args) {
	      
	    int base = 4, powerRaised = 4;
	    int result = power(base, powerRaised);

	    System.out.println(base + "^" + powerRaised + "=" + result);
	  }

	  public static int power(int base, int powerRaised) {
	    if (powerRaised != 0) {
	     
	      return (base * power(base, powerRaised - 1));
	    }
	    else {
	      return 1;
	    }
	  }
}
