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

	public MyConnection() {
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, pw);
		} catch(ClassNotFoundException e) {
		} catch(SQLException e) {
		} catch(Exception e) {
		}
	}
	
	public Connection getConn() {
		return conn;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
}
