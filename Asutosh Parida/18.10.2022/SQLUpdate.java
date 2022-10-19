package teldir2;



	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;



	public class SQLUpdate {
		Connection conn;
		PreparedStatement stmt;
		ResultSet rs;
		
		public SQLUpdate() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","");
				stmt = conn.prepareStatement("UPDATE contact SET contact_name =? WHERE group_id=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				stmt.setString(1, "RMI stands for");
				stmt.executeUpdate();

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
			new SQLUpdate();
		}

	}
