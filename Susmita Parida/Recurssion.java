package exam;

public class Recurssion {

	public static void main(String[] args) {
		
			    int base = 8, powerRaised = 3;
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


