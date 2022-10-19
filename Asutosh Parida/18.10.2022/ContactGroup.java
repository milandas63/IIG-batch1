package teldir2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import teldir2.Stretcher;

public class ContactGroup {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public ContactGroup() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(" SELECT group_id,group_name,group_desc FROM contact_group ");
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "GROUP");
				System.out.println(s.spaces(25) + "1. List Data");
				System.out.println(s.spaces(25) + "2. Add Data");
				System.out.println(s.spaces(25) + "3. Change Data");
				System.out.println(s.spaces(25) + "4. Delete Data");
				System.out.println(s.spaces(25) + "5. Exit Program");
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
			new listdata(rs, s);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	public void doAdd() throws SQLException {
		String group_name;
		String group_desc;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Group Name: ", 20));
		group_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Group Desc: ", 20));
		group_desc = scan.nextLine();
		rs.moveToInsertRow();
		rs.updateString("group_name", group_name );
		rs.updateString("group_desc", group_desc);
		rs.insertRow();
		rs.moveToCurrentRow();
	}
	public void doChange() throws SQLException {
		String group_id;
		String column_name, column_data;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Group ID to Change: ", 20));
		group_id = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Name: ", 20));
		column_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Data: ", 20));
		column_data = scan.nextLine();
		
		//rs.absolute(Integer.parseInt(question_id));
		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("group_id")==Integer.parseInt(group_id)) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.updateString(column_name, column_data);
			rs.updateRow();
		} else {
			System.out.println("group_id "+group_id+" Not Found!");
		}
	}
	
	public void doDelete() throws SQLException {
		int group_id;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Group ID to Delete: ", 20));
		group_id = scan.nextInt();
		
		//rs.absolute(question_id);
		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("group_id")==group_id) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.deleteRow();
		} else {
			System.out.println("Group ID "+group_id+" Not Found!");
		}
		return;
	}
	
	public static void main(String[] args) {
		new ContactGroup();
	}
}
