package asims_labs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import asims_labs.Stretcher;

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
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT contact_id,contact_name,group_id,location_id,land_phone_no,mobile_no1,mobile_no2,mobile_no3,email_id1,email_id2,contact_address FROM  contact ORDER BY contact_id");

			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "Main Menu");
				System.out.println(s.spaces(25) + "1. Contact Group");
				System.out.println(s.spaces(25) + "2. Contact Location");
				System.out.println(s.spaces(25) + "3. Contact People");
				System.out.println(s.spaces(25) + "4. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					rs.beforeFirst();
					this.doList();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					this.doAdd();
				} else if(response.equals("3")) {
					this.doChange();
				} else if(response.equals("4")) {
					this.doDelete();
				} else if(response.equals("5")) {
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
			new ListData(rs,s);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	public void doAdd() throws SQLException {
		String question_text;
		int subject_id, question_type_id, policy_id, level_id;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Question text: ", 20));
		question_text = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Subject id: ", 20));
		subject_id = scan.nextInt();
		System.out.print(s.spaces(15) + s.padL("Question Type id: ", 20));
		question_type_id = scan.nextInt();
		System.out.print(s.spaces(15) + s.padL("Policy id: ", 20));
		policy_id = scan.nextInt();
		System.out.print(s.spaces(15) + s.padL("Level id: ", 20));
		level_id = scan.nextInt();
		
		rs.moveToInsertRow();
		rs.updateString("question_text", question_text);
		rs.updateInt("subject_id", subject_id);
		rs.updateInt("question_type_id", question_type_id);
		rs.updateInt("policy_id", policy_id);
		rs.updateInt("level_id", level_id);
		rs.insertRow();
		rs.moveToCurrentRow();
	}

	public void doChange() throws SQLException {
		String question_id;
		String column_name, column_data;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Question ID to Change: ", 20));
		question_id = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Name: ", 20));
		column_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Data: ", 20));
		column_data = scan.nextLine();
		
		//rs.absolute(Integer.parseInt(question_id));
		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("question_id")==Integer.parseInt(question_id)) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.updateString(column_name, column_data);
			rs.updateRow();
		} else {
			System.out.println("Question ID "+question_id+" Not Found!");
		}
	}
	
	public void doDelete() throws SQLException {
		int question_id;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Question ID to Delete: ", 20));
		question_id = scan.nextInt();
		
		//rs.absolute(question_id);
		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("question_id")==question_id) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.deleteRow();
		} else {
			System.out.println("Question ID "+question_id+" Not Found!");
		}
		return;
	}
	
	public static void main(String[] args) {
		new MainMenu();
	}
}