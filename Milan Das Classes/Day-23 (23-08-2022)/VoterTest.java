package excep;

import voter.age.NegativeAgeException;
import voter.age.TooOldAgeException;
import voter.age.TooYoungAgeException;
import voter.age.ZeroAgeException;

public class VoterTest {
	int ages[] = {35,67,12,11,45,39,90,48,88,61,-20,0,77,9,62,33,75};
	
	public VoterTest() {
		for(int i=0; i<ages.length; i++) {
			try {
				checkForValidAge(ages[i]);
				System.out.println(ages[i]+" is a valid age");
			} catch(ZeroAgeException e) {
				System.out.println(ages[i] + " " + e.getMessage());
			} catch(NegativeAgeException e) {
				System.out.println(ages[i] + " " + e.getMessage());
			} catch(TooYoungAgeException e) {
				System.out.println(ages[i] + " " + e.getMessage());
			} catch(TooOldAgeException e) {
				System.out.println(ages[i] + " " + e.getMessage());
			}
		}
	}

	private void checkForValidAge(int age) throws ZeroAgeException,
												  NegativeAgeException,
												  TooYoungAgeException,
												  TooOldAgeException {
		if(age<0) {
			throw new NegativeAgeException("Age is less than zero");
		} else if(age==0) {
			throw new ZeroAgeException("Age is zero");
		} else if(age<18) {
			throw new TooYoungAgeException("is less than 18");
		} else if(age>75) {
			throw new TooOldAgeException("is greater than 75");
		}
	}
	
	public static void main(String[] args) {
		new VoterTest();
	}
}
