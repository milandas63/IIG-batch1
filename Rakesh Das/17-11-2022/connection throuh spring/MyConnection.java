package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	private static long serialVersionUID = 1L;
	
	private Connection conn;
	private String driverName;
	private String url;
	private String user;
	private String pw;

	private void createConnection() {
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

	public void setDriverName(String driverName) {
		System.out.println("Drivername: " + driverName);
		this.driverName = driverName;
	}

	public void setUrl(String url) {
		System.out.println("URL: " + url);
		this.url = url;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPw(String pw) {
		this.pw = pw;
		createConnection();
	}
}
