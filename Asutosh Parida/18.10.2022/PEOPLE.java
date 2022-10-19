package teldir2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import teldir2.Stretcher;

public class PEOPLE {
	Stretcher s;
	Scanner scan;
	
	public PEOPLE() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "PEOPLE  ");
				System.out.println(s.spaces(25) + "1. List");
				System.out.println(s.spaces(25) + "2. List2");
				System.out.println(s.spaces(25) + "3. List3");
				System.out.println(s.spaces(25) + "4. List4");
				System.out.println(s.spaces(25) + "5. SQLAdd");
				System.out.println(s.spaces(25) + "6.SQLUpdate");
				System.out.println(s.spaces(25) + "7. SQLDelete");
				System.out.println(s.spaces(25) + "8. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					new List();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					new List2();
				} else if(response.equals("3")) {
					new List3();
				} else if(response.equals("4")) {
					new List4();
				} else if(response.equals("5")) {
					new SQLAdd();
				} else if(response.equals("6")) {
					new SQLUpdate();
				} else if(response.equals("7")) {
					new SQLDelete();
				} else if(response.equals("8")) 
					System.out.println("Program is terminated!");
					break;
				}
			}
	
	
	public static void main(String[] args) {
		new teldir();
	}



}
