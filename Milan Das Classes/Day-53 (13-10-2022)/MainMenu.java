package db.view;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import string.helper.Stretcher;

public class MainMenu {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public MainMenu() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assessment", "root", "");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT question_id,question_text FROM questions");
		} catch(ClassNotFoundException e) {
			System.out.println(e);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}

		while(!response.equals("5")) {
			for(int i=0; i<10; i++) System.out.println();
			System.out.println(s.spaces(25) + "DB PROJECT");
			System.out.println(s.spaces(25) + "1. List Data");
			System.out.println(s.spaces(25) + "2. Add Data");
			System.out.println(s.spaces(25) + "3. Change Data");
			System.out.println(s.spaces(25) + "4. Delete Data");
			System.out.println(s.spaces(25) + "5. Exit Program");
			System.out.println();
			System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
			response = scan.nextLine();
			if(response.equals("1")) {
				this.doList();
				System.out.println("Hit enter to continue...");
				scan.nextLine();
			} else if(response.equals("2")) {
				
			} else if(response.equals("3")) {
				
			} else if(response.equals("4")) {
				
			} else if(response.equals("5")) {
				System.out.println("Program is terminated!");
				break;
			}
		}
	}

	public void doList() {
		try {
			new ListData(rs, s);
		} catch(SQLException e) {
		} catch(Exception e) {
		}
	}

	public static void main(String[] args) {
		new MainMenu();
	}
}
