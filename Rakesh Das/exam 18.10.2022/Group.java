package teldir;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import string.helper.Stretcher;

public class Group {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	public Group() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT group_id,group_name,group_desc FROM contact_group");
			
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "GROUP");
				System.out.println(s.spaces(25) + "1. List");
				System.out.println(s.spaces(25) + "2. Add");
				System.out.println(s.spaces(25) + "3. Edit");
				System.out.println(s.spaces(25) + "4. Delete");
				System.out.println(s.spaces(25) + "5. Exit");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					rs.beforeFirst();
					this.doList();
					System.out.println("Press Enter To Continue.....");
					scan.nextLine();
				}else if(response.equals("2")) {
					    rs.beforeFirst();
						this.doAdd();
					}
				else if(response.equals("3")) {
					this.doChange();
				}
				else if(response.equals("4")) {
					this.doDelete();
				}
				else if(response.equals("5")) {
					System.out.println("You Exited From Group....");
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
		
		
	



	private void doList() {
		try {
			new ListData(rs , s);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}
	public void doAdd() throws SQLException {
		String group_name, group_desc;
		

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Group Name: ", 20));
		group_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Group Description: ", 20));
		group_desc = scan.nextLine();
		//String sql = "INSERT INTO questions(question_text, subject_id, question_type_id, policy_id, level_id) VALUES('"+question_text+"',"+subject_id+","+question_type_id+","+policy_id+","+level_id+")";
		rs.moveToInsertRow();
		rs.updateString("group_name", group_name);
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
			System.out.println("Group ID "+group_id+" Not Found!");
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
			System.out.println("Question ID "+group_id+" Not Found!");
		}
		return;
	}
	
	public static void main(String[] args) {
		new Group();
	}
}

