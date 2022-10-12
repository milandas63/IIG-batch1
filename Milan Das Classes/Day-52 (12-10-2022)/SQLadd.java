package db.update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// Create a new row using updatable resultset

public class SQLadd {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public SQLadd() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assessment","root","");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT * FROM questions");
			rs.absolute(4);
			rs.moveToInsertRow();
			rs.updateString("question_text", "How many parameter can be given in PreparedStatement?");
			rs.updateInt("subject_id", 3);
			rs.updateInt("question_type_id", 1);
			rs.updateInt("policy_id", 3);
			rs.updateInt("level_id", 1);
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
		new SQLadd();
	}
}
