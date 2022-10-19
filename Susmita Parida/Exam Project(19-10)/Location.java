package tel.dir;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Location {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs;
	public ResultSetMetaData rsmd;
	private Scanner scan;
	private int[] colWidth;
	private Stretcher s;
	private String response;

	public Location(Stretcher s) {
		this.s = s;
		scan = new Scanner(System.in);
		colWidth = new int[] {10, 40, 10, 20, 15};
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT loc_id,loc_name,loc_abbr,loc_state,loc_country FROM location ORDER BY loc_id");
			while(true) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "Location Menu");
				System.out.println(s.spaces(25) + "1. List");
				System.out.println(s.spaces(25) + "2. Add");
				System.out.println(s.spaces(25) + "3. Edit");
				System.out.println(s.spaces(25) + "4. Delete");
				System.out.println(s.spaces(25) + "5. Exit");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					new LocationList(rs,s);
				} else if(response.equals("2")) {

				} else if(response.equals("3")) {

				} else if(response.equals("4")) {

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
