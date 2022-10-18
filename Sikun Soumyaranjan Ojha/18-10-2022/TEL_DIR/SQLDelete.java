package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SQLDelete {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	public SQLDelete() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","");
			stmt = conn.prepareStatement("SELECT * FROM questions", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery();
			
			rs.absolute(7);
			rs.deleteRow();
			
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
		new SQLDelete();
	}
}