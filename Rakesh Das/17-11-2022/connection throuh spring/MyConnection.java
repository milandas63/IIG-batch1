package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	private Connection conn;
	private String driverName;
	private String url;
	private String user;
	private String pw;

	private MyConnection(String driverName, String url, String user, String pw) {
		this.driverName = driverName;
		this.url = url;
		this.user = user;
		this.pw = pw;
		
		try {
			System.out.println("Constructor Working");
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, pw);
		} catch(ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: " + e);
		} catch(SQLException e) {
			System.out.println("SQLException: " + e);
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
