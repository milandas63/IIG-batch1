package teldir2;



	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;

	public class SQLAdd {
		Connection conn;
		Statement stmt;
		ResultSet rs;

		public SQLAdd() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = stmt.executeQuery("SELECT * FROM contact");
				rs.absolute(11);
				rs.moveToInsertRow();
				rs.updateInt("contact_name",1);
				rs.updateInt("group_id", 3);
				rs.updateInt("location_id", 1);
				rs.updateInt("land_phone_no", 4);
				rs.updateInt("mobile_no1", 4);
				rs.updateInt("mobile_no2", 4);
				rs.updateInt("mobile_no3", 4);
				rs.updateInt("email_id1", 4);
				rs.updateInt("email_id2", 4);
				rs.updateInt("contact_address", 4);
				rs.insertRow();
				rs.moveToCurrentRow();
				conn.close();
			} catch(ClassNotFoundException e) {
				System.out.println(e);
			} catch(SQLException e) {
				System.out.println(e);
			} catch(Exception e) {
				System.out.println(e);
			}
		}

		public static void main(String[] args) {
			new SQLAdd();
		}
	}
