package exam;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class ContactGroupList {
	public ResultSet rs;
	public ResultSetMetaData rsmd;
	private int[] colWidth;
	private Stretch s;
	private Scanner scan;

	public ContactGroupList(ResultSet rs, Stretch s) {
		this.s = s;
		 this.rs = rs;
		 scan = new Scanner(System.in);
		 colWidth = new int[] {10, 40, 50};
		 try {
			rsmd = rs.getMetaData();
	
			this.drawLine();
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
				
			this.drawLine();
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
	
			this.drawLine();
			System.out.println();
			System.out.println("Press Enter to continue");
			scan.nextLine();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ContactGroupList(Statement stmt, String string, int[] is, Stretch s2) {
		// TODO Auto-generated constructor stub
	}

	private void drawLine() throws SQLException {
		System.out.print("+");
		for(int i=1; i<=rsmd.getColumnCount(); i++) {
			System.out.print(s.replicate(colWidth[i-1], "-"));
			System.out.print("+");
		}
		System.out.println();
	}
}
