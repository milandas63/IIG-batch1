package teldir2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import teldir2.Stretcher;

public class teldir {
	Stretcher s;
	Scanner scan;
	
	public teldir() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "MAIN MENU  ");
				System.out.println(s.spaces(25) + "1. Contact Group");
				System.out.println(s.spaces(25) + "2. Contact Location");
				System.out.println(s.spaces(25) + "3. Contact People");
				System.out.println(s.spaces(25) + "4. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					 new ContactGroup();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					new location();
				} else if(response.equals("3")) {
					new PEOPLE();
				} else if(response.equals("4")) 
					System.out.println("Program is terminated!");
					break;
				}
			}
	
	
	public static void main(String[] args) {
		new teldir();
	}



}
