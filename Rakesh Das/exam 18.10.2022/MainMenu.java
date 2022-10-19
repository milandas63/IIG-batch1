package teldir;

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
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				rs = stmt.executeQuery("SELECT contact_id,contact_name,group_id,location_id,mobile_no1,email_id1 FROM contact ORDER BY contact_id");

				while(!response.equals("4")) {
					for(int i=0; i<10; i++) System.out.println();
					System.out.println(s.spaces(25) + "MAIN MENU");
					System.out.println(s.spaces(25) + "1. CONTACT GROUP");
					System.out.println(s.spaces(25) + "2. CONTACT LOCATION");
					System.out.println(s.spaces(25) + "3. CONTACT PEOPLE");
					System.out.println(s.spaces(25) + "4. Exit Program");
					System.out.println();
					System.out.print(s.spaces(25) + "Enter Choice [1-4]: ");
					response = scan.nextLine();
					if(response.equals("1")) {
						rs.beforeFirst();
						new Group();
						System.out.println("Hit enter to continue...");
						scan.nextLine();
					} else if(response.equals("2")) {
						new Location();
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
				new ListData(rs, s);
			} catch(SQLException e) {
				System.out.println(e);
			} catch(Exception e) {
				System.out.println(e);
			}
		}

		public void doAdd() throws SQLException {
			String question_text, subject_id;
			

			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Group Name: ", 20));
			question_text = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Group Desc: ", 20));
			subject_id = scan.nextLine();
			//String sql = "INSERT INTO questions(question_text, subject_id, question_type_id, policy_id, level_id) VALUES('"+question_text+"',"+subject_id+","+question_type_id+","+policy_id+","+level_id+")";
			rs.moveToInsertRow();
			rs.updateString("group_name", question_text);
			rs.updateString("group_desc", subject_id);
			rs.insertRow();
			rs.moveToCurrentRow();
		}

		public void doChange() throws SQLException {
			String contact_id;
			String column_name, column_data;
			boolean found = false;

			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Question ID to Change: ", 20));
			contact_id = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Column Name: ", 20));
			column_name = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Column Data: ", 20));
			column_data = scan.nextLine();
			
			//rs.absolute(Integer.parseInt(question_id));
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
				System.out.println("Question ID "+contact_id+" Not Found!");
			}
		}
		
		public void doDelete() throws SQLException {
			int contact_id;
			boolean found = false;

			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Question ID to Delete: ", 20));
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
				System.out.println("Question ID "+contact_id+" Not Found!");
			}
			return;
		}
		
		public static void main(String[] args) {
			new MainMenu();
		}
	}
	
