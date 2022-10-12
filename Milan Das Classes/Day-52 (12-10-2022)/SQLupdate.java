package db.update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLupdate {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	public SQLupdate() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assessment","root","");
			stmt = conn.prepareStatement("UPDATE questions SET question_text=? WHERE question_id=5",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt.setString(1, "RMI stands for");
			stmt.executeUpdate();
			//stmt.executeUpdate("UPDATE questions SET question_text=\"RMI stands for\" WHERE question_id=5");

//			rs = stmt.executeQuery("SELECT * FROM questions");
//			rs.absolute(5);
//			rs.updateString("question_text", "JDBC stands for");
//			rs.updateRow();
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
		new SQLupdate();
	}

}
