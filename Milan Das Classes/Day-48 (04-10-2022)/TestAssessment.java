package db.connect;

// Step-1
import java.sql.*;

public class TestAssessment {
	public ResultSet rs;
	public Statement stmt;
	public Connection conn; 
	
	public TestAssessment() {
		try {
			// Step-2 Load & Register Driver
			Class.forName("org.gjt.mm.mysql.Driver");
			
			// Step-3 Create Connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assessment", "root", "");

			// Step-4 Create Statement
			stmt = conn.createStatement();
			
			// Step-5 Create ResultSet
			rs = stmt.executeQuery("SELECT q.question_id, q.question_text, s.sub_name, t.type_name, m.policy_name, l.level_name FROM questions AS q, subjects AS s, question_type AS t, mark_policy AS m, level AS l WHERE q.subject_id=s.sub_id AND q.question_type_id=t.type_id AND q.policy_id=m.policy_id AND q.level_id=l.level_id ORDER BY question_id");

			// Step-6 Manipulate ResultSet
			while(rs.next()) {
				System.out.println(rs.getInt("question_id") + " " +
								   rs.getString("question_text") + " " +
								   rs.getString("sub_name") + " " +
								   rs.getString("type_name") + " " +
								   rs.getString("policy_name") + " " +
								   rs.getString("level_name")
						          );
			}
		} catch(ClassNotFoundException e) {
			System.err.println(e);
		} catch(SQLException e) {
			System.err.println(e);
		} finally {
			try {
				rs.close(); stmt.close(); conn.close(); 
			} catch(SQLException e) {
				System.err.println(e);
			}
		}

	}

	public static void main(String[] args) {
		new TestAssessment();
	}

}
