package teldir2;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import teldir2.Stretcher;

public class List2 {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public List2() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT contact_id,contact_name,land_phone_no,mobile_no1,mobile_no2,mobile_no3 FROM contact");
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "List2");
				System.out.println(s.spaces(25) + "1. List Data");
				System.out.println(s.spaces(25) + "2. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-3]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					rs.beforeFirst();
					this.doList();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					System.out.println("Program is terminated!");
					break;
				}
			}
		} catch(ClassNotFoundException e) {
			System.out.println(e);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	public void doList() {
		try {
			new listdata(rs, s);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}	
	public static void main(String[] args) {
		new List2();
	}
}