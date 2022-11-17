package com.common;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Trial  {
	public static Connection conn;
	public static Statement stmt;
	public static ResultSet rs;
	public static ResultSetMetaData rsmd;
	public static PrintWriter out;

	public static void main(String[] args) {
		try {
			ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
			MyConnection myconn = context.getBean("myconn", MyConnection.class);
			Connection conn = myconn.getConn();
			System.out.println(conn);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("select * from userlist");
			rsmd = rs.getMetaData();
			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				System.out.print(rsmd.getColumnLabel(i));
			}
			while(rs.next()) {
				for(int i=1; i<=rsmd.getColumnCount(); i++) {
					System.out.println(rs.getString(i));
				}
			}
		} catch(SQLException e) {
			System.out.println(e);
		}
	}
}
