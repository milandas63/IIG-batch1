package KuchB;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import KuchB.Stretcher;

public class ListData {
	ResultSet rs;
	ResultSetMetaData rsmd;
	Stretcher s;
	public int[] colWidth = {10, 30, 20, 30,26,30,30};

	public ListData(ResultSet rs, Stretcher s) throws SQLException {
		this.rs = rs;
		rsmd = rs.getMetaData();
		this.s = s;

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