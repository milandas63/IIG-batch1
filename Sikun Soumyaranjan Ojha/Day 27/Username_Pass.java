package Case;

import java.util.Scanner;

public class Username_Pass {

	public static void main(String[] args) {
		int num;
		boolean more = true;
		Scanner s = new Scanner(System.in);
		String fname, lname, father, dateOfBirth, gender;
		StringBuffer buf;
		
		while(more) {
			buf = new StringBuffer();
			
			System.out.print("first name:");
			fname = s.nextLine();
			buf.append(fname+", ");
	
			System.out.print("last name:");
			lname = s.nextLine();
			buf.append(lname+", ");
			
			System.out.print("father's name:");
			father = s.nextLine();
			buf.append(father+", ");
	
			System.out.print("date of birth (dd-mm-yyyy)");
			dateOfBirth = s.nextLine();
			buf.append(dateOfBirth+", ");
	
			System.out.print("Gender");
			gender = s.nextLine();
			buf.append(gender+"\r\n");

			// write to file System.out.print(first_name+" ,"+last_name+","+father_name+","+date_of_bath"+,"+gender)
			
			
			
			System.out.println();
			System.out.print("more-y/n");
			more = s.nextLine().toUpperCase().startsWith("Y");

		}
	}
}
 