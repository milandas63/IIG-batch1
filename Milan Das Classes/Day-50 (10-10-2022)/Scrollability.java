package db.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import string.helper.Stretcher;

public class Scrollability {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs;
	public ResultSetMetaData rsmd;
	
	public Scrollability() {
		int[] colWidth = {12, 70, 12, 12, 15, 15};
		Stretcher s = new Stretcher();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assessment","root","");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery("SELECT q.question_id, q.question_text, s.sub_name, t.type_name, m.policy_name, l.level_name FROM questions AS q, subjects AS s, question_type AS t, mark_policy AS m, level AS l WHERE q.subject_id=s.sub_id AND q.question_type_id=t.type_id AND q.policy_id=m.policy_id AND q.level_id=l.level_id ORDER BY question_id");
			rsmd = rs.getMetaData();

//			rs.afterLast();
//			while(rs.previous()) {
//				System.out.println(rs.getInt("question_id") + " " +
//						   rs.getString("question_text") + " " +
//						   rs.getString("sub_name") + " " +
//						   rs.getString("type_name") + " " +
//						   rs.getString("policy_name") + " " +
//						   rs.getString("level_name")
//				          );
//			}


//			+------------+----------------------------------------------------------------------+------------+------------+---------------+---------------+
//			| question_id|question_text                                                         |sub_name    |type_name   |policy_name    |level_name     |
//			+------------+----------------------------------------------------------------------+------------+------------+---------------+---------------+
//			|           1|Who Invented Java?                                                    |Core Java   |MCQ         |Full mark      |Easy           |
//			|           2|The first version of Java is called                                   |Core Java   |MCQ         |Negative mark  |Medium         |
//			|           3|How many primitive data exists in Java                                |Core Java   |MCQ         |Full mark      |Medium         |
//			|           4|What is Tuples in Python                                              |CSS3        |MCQ         |Negative mark  |Medium         |
//			|           5|HTML stands for                                                       |CSS3        |MCQ         |Full mark      |Very Difficult |
//			|           6|Which CSS property is used to define the font of text                 |Core Java   |MCQ         |Bonus mark     |Easy           |
//			+------------+----------------------------------------------------------------------+------------+------------+---------------+---------------+
			
			System.out.println();
			System.out.print("+");
			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				System.out.print(this.replicate(colWidth[i-1], "-"));
				System.out.print("+");
			}

			System.out.println();
			System.out.print("|");
			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				if(rsmd.getColumnTypeName(i).equals("INT")) {
					System.out.print(s.padLeft(rsmd.getColumnLabel(i), colWidth[i-1]));
				} else if(rsmd.getColumnTypeName(i).equals("VARCHAR")) {
					System.out.print(s.padRight(rsmd.getColumnLabel(i), colWidth[i-1]));
				}
				System.out.print("|");
			}

			System.out.println();
			System.out.print("+");
			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				System.out.print(this.replicate(colWidth[i-1], "-"));
				System.out.print("+");
			}
			
			System.out.println();
			while(rs.next()) {
				System.out.print("|");
				for(int i=1; i<=rsmd.getColumnCount(); i++) {
					if(rsmd.getColumnTypeName(i).equals("INT")) {
						System.out.print(s.padLeft(rs.getString(i), colWidth[i-1]));
					} else if(rsmd.getColumnTypeName(i).equals("VARCHAR")) {
						System.out.print(s.padRight(rs.getString(i), colWidth[i-1]));
					}
					System.out.print("|");
				}
				System.out.println();
			}

			System.out.print("+");
			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				System.out.print(this.replicate(colWidth[i-1], "-"));
				System.out.print("+");
			}

			System.out.println();
			
			conn.close();
		} catch(ClassNotFoundException e) {
		} catch(SQLException e) {
		}
	}

	private String replicate(int size, String charWith) {
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<size; i++) buf.append(charWith);
		return buf.toString();
	}
	
	public static void main(String[] args) {
		new Scrollability();
	}
}
