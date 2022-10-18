package KuchB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import KuchB.Stretcher;

public class PeopleExam {
	Stretcher s;
	Scanner scan;
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public PeopleExam() {
		s = new Stretcher();
		scan = new Scanner(System.in);
		String response = "0";

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","monster2.0");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT contact_id,contact_name,group_id,location_id,land_phone_no,mobile_no1,mobile_no2,mobile_no3,email_id1,email_id2,contact_address FROM contact ORDER BY contact_id");
			while(!response.equals("5")) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "Peoples");
				System.out.println(s.spaces(25) + "1. List1 ");
				System.out.println(s.spaces(25) + "2. List2");
				System.out.println(s.spaces(25) + "3. List3 ");
				System.out.println(s.spaces(25) + "4. List4 ");
				System.out.println(s.spaces(25) + "5. Add Data");
				System.out.println(s.spaces(25) + "6. Change Data");
				System.out.println(s.spaces(25) + "7. Delete Data");
				System.out.println(s.spaces(25) + "8. Exit Program");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-8]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					rs.beforeFirst();
					new List1Exm();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					new List2Exm();
				} else if(response.equals("3")) {
					new List3Exm();
				} else if(response.equals("4")) {
					new List4Exm();
				} else if(response.equals("5")) {
					this.doAdd();
				} else if(response.equals("6")) {
					this.doChange();
				} else if(response.equals("7")) {
					this.doDelete();
				} else if(response.equals("8")) {
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
	public void doAdd() throws SQLException {
		String contact_name;
		int group_id, location_id;
		String land_phone_no, mobile_no1,mobile_no2,mobile_no3,email_id1,email_id2,contact_address;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Contact Name: ", 20));
		contact_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Group id: ", 20));
		group_id= scan.nextInt();
		System.out.print(s.spaces(15) + s.padL("Location id: ", 20));
		location_id = scan.nextInt();
		System.out.print(s.spaces(15) + s.padL("Land Phone No: ", 20));
		land_phone_no= scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("First Mobile No: ", 20));
		mobile_no1 = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Second Mobile No: ", 20));
		mobile_no2 = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Third Mobile No: ", 20));
		mobile_no3 = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("First Email: ", 20));
		email_id1= scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Second Email: ", 20));
		email_id2 = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Contact Address: ", 20));
		contact_address = scan.nextLine();
		rs.moveToInsertRow();
		rs.updateString("Contact Name ", contact_name);
		rs.updateInt("Group id ", group_id);
		rs.updateInt("Location id ", location_id);
		rs.updateString("Land Phone No ", land_phone_no);
		rs.updateString("First Mobile No", mobile_no1);
		rs.updateString("Second Mobile No", mobile_no2);
		rs.updateString("Third Mobile No", mobile_no3);
		rs.updateString("First Email", email_id1);
		rs.updateString("Second Email", email_id2);
		rs.updateString("Contact Address", contact_address);
		rs.insertRow();
		rs.moveToCurrentRow();
	}

	public void doChange() throws SQLException {
		String contact_id;
		String column_name, column_data;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Contact ID to Change: ", 20));
		contact_id = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Name: ", 20));
		column_name = scan.nextLine();
		System.out.print(s.spaces(15) + s.padL("Column Data: ", 20));
		column_data = scan.nextLine();
		

		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("contact_id")==Integer.parseInt(contact_id)) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.updateString(column_name, column_data);
			rs.updateRow();
		} else {
			System.out.println("Contact ID "+contact_id+" Not Found!");
		}
	}
	
	public void doDelete() throws SQLException {
		int contact_id;
		boolean found = false;

		for(int i=0; i<5; i++) System.out.println();

		System.out.print(s.spaces(15) + s.padL("Contact ID to Delete: ", 20));
		contact_id = scan.nextInt();
		
		//rs.absolute(question_id);
		rs.beforeFirst();
		while(rs.next()) {
			if(rs.getInt("contact_id")==contact_id) {
				found = true;
				break;
			}
		}
		if(found) {
			rs.deleteRow();
		} else {
			System.out.println("Contact ID "+contact_id+" Not Found!");
		}
		return;
	}
	
	
	public static void main(String[] args) {
		new PeopleExam();
	}
}