package KuchB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import KuchB.Stretcher;

public class List4Exm {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public List4Exm() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","monster2.0");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT contact_id,contact_name,contact_address FROM contact");
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "List1");
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
			new ListData(rs, s);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}	
	public static void main(String[] args) {
		new List4Exm();
	}
}