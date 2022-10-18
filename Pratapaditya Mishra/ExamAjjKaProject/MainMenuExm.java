package KuchB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import KuchB.Stretcher;

public class MainMenuExm {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public MainMenuExm() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","monster2.0");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT contact_id,contact_name,group_id,location_id,mobile_no1,email_id1 FROM contact ORDER BY contact_id");
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "MAIN MENU");
				System.out.println(s.spaces(25) + "1.  Contact Group ");
				System.out.println(s.spaces(25) + "2. Contact Location");
				System.out.println(s.spaces(25) + "3. Contact People ");
				System.out.println(s.spaces(25) + "4. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-4]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					rs.beforeFirst();
					new GroupExm();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					new LocationExm();
				} else if(response.equals("3")) {
					new PeopleExam();
				} else if(response.equals("4")) {
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
	
	
	public static void main(String[] args) {
		new MainMenuExm();
	}
}
