package com.common;

import java.sql.Connection;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Trial {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MyConnection myconn = context.getBean("myconn",MyConnection.class);
		Connection conn = myconn.getConn();
	}
}
