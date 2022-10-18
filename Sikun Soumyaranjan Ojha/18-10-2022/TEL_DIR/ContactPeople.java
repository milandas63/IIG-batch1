package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class ContactPeople {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs;
	public ResultSetMetaData rsmd;
	private Scanner scan;
	private int[] colWidth;
	private Stretch s;
	private String response;

	public ContactPeople(Stretch s) {
		this.s = s;
		scan = new Scanner(System.in);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			while(true) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "Contact People List Menu");
				System.out.println(s.spaces(25) + "1. List-1");
				System.out.println(s.spaces(25) + "2. List");
				System.out.println(s.spaces(25) + "3. List");
				System.out.println(s.spaces(25) + "4. List");
				System.out.println(s.spaces(25) + "2. Add");
				System.out.println(s.spaces(25) + "3. Edit");
				System.out.println(s.spaces(25) + "4. Delete");
				System.out.println(s.spaces(25) + "5. Exit");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					new ContactGroupList(stmt, "SELECT contact_id,contact_name,group_id,location_id,mobile_no1,email_id1 FROM contact ORDER BY contact_id",new int[] {12, 40, 20, 20, 25, 50},s);

				} else if(response.equals("2")) {
					new ContactGroupList(stmt, "SELECT contact_id,contact_name,land_phone_no,mobile_no1,mobile_no2,mobile_no3 FROM contact ORDER BY contact_id",new int[] {12, 40, 20, 20, 25, 20},s);

				} else if(response.equals("3")) {
					new ContactGroupList(stmt, "SELECT contact_id,contact_name,email_id1,email_id2 FROM contact ORDER BY contact_id",new int[] {12, 40, 40, 20},s);

				} else if(response.equals("4")) {
					new ContactGroupList(stmt, "SELECT contact_id,contact_name,contact_address FROM contact ORDER BY contact_id",new int[] {12, 50, 50},s);

				} else if(response.equals("5")) {
					System.out.println("Program is terminated!");
					break;
				}
			}

			conn.close();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
