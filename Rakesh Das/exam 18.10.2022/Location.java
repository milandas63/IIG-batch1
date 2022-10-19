package teldir;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.Scanner;

	import string.helper.Stretcher;

	public class Location {
		Stretcher s;
		Scanner scan;
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		public Location() {
			s = new Stretcher();
			scan = new Scanner(System.in);
			String response = "0";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir", "root", "");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				rs = stmt.executeQuery("SELECT loc_id,loc_name,loc_abbr,loc_state,loc_country FROM location");
				
				while(!response.equals("5")) {
					for(int i=0; i<10; i++) System.out.println();
					System.out.println(s.spaces(25) + "LOCATION");
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
					}
					else if(response.equals("2")) {
						this.doAdd();
					}
					else if(response.equals("3")) {
						this.doChange();
					}
					else if(response.equals("4")) {
						this.doDelete();
					}
					else if(response.equals("5")) {
						System.out.println("You Exited From Location.......");
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
			String loc_name,loc_abbr,loc_state,loc_country;
			int loc_id;

			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Location Name: ", 20));
			loc_name = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Location Abbreviation: ", 20));
			loc_abbr = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Location State: ", 20));
			loc_state = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Location Country", 20));
			loc_country = scan.nextLine();
			//String sql = "INSERT INTO questions(question_text, subject_id, question_type_id, policy_id, level_id) VALUES('"+question_text+"',"+subject_id+","+question_type_id+","+policy_id+","+level_id+")";
			rs.moveToInsertRow();
			rs.updateString("loc_name", loc_name);
			rs.updateString("loc_abbr", loc_abbr);
			rs.updateString("loc_state", loc_state);
			rs.updateString("loc_country", loc_country);
			rs.insertRow();
			rs.moveToCurrentRow();
		}

		public void doChange() throws SQLException {
			String column_name, column_data;
			String loc_id;
			boolean found = false;

			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Location ID to Change: ", 20));
			loc_id = scan.nextLine();
		

			System.out.print(s.spaces(15) + s.padL("Column Name to Change: ", 20));
			column_name = scan.nextLine();
			System.out.print(s.spaces(15) + s.padL("Column Data to change: ", 20));
			column_data = scan.nextLine();
			
			//rs.absolute(Integer.parseInt(question_id));
			rs.beforeFirst();
			while(rs.next()) {
				if(rs.getInt("loc_id")==Integer.parseInt(loc_id)) {
					found = true;
					break;
				}
			}
			if(found) {
				rs.updateString(column_name, column_data);
				rs.updateRow();
			} else {
				System.out.println("Location ID "+loc_id+" Not Found!");
			}
		}
		
		public void doDelete() throws SQLException {
			int loc_id;
			boolean found = false;

			
			for(int i=0; i<5; i++) System.out.println();

			System.out.print(s.spaces(15) + s.padL("Location ID to Delete: ", 20));
			loc_id = scan.nextInt();
			
			//rs.absolute(question_id);
			rs.beforeFirst();
			while(rs.next()) {
				if(rs.getInt("loc_id")==loc_id) {
					found = true;
					break;
				}
			}
			if(found) {
				rs.deleteRow();
			} else {
				System.out.println("Location ID "+loc_id+" Not Found!");
			}
			return;
		}
		
		public static void main(String[] args) {
			new Group();
		}
	}



