package Test5;

import java.util.Scanner;

public class CSVfile {

	public static void main(String[] args) {
		int num;
		boolean more = true;
		Scanner s = new Scanner(System.in);
		String   Name, Gender,Nationality, Religion,Location;
		StringBuffer buf;
		
		while(more) {
			buf = new StringBuffer();
			
			System.out.print("Name:");
			Name = s.nextLine();
			buf.append(Name+", ");
			
			System.out.print("Gender:");
			Gender = s.nextLine();
			buf.append(Gender+"\r\n");

			
			
			System.out.print("Nationality:");
			Nationality = s.nextLine();
			buf.append(Nationality+", ");
	
			System.out.print("Religion:");
			Religion = s.nextLine();
			buf.append(Religion+", ");
			
			System.out.print("Location:");
			Location = s.nextLine();
			buf.append(Location+", ");
	
		    System.out.println();
			System.out.print("more-y/n");
			more = s.nextLine().toUpperCase().startsWith("Y");

		}
	}

}
