
package com.bookstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.PropertyResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * @author Administrator
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class Database {
	/**
	 * ���ݿ����URL
	 */
	private static String url;

	/**
	 * ���ݿ�����
	 */
	private static String driver;

	/**
	 * ���ݿ�����û���
	 */
	private static String username;

	/**
	 * ���ݿ���ʿ���
	 */
	private static String password;

	/**
	 * ��������
	 */
	private static String type;

	/**
	 * ����Դ����
	 */
	private static String datasource;

	/**
	 * �����ļ�����
	 */
	private final static String fileName = "database";

	private static ThreadLocal connection = new ThreadLocal();

	static {
		config();
	}

	private static void config() {
		// ��ȡϵͳ����
		PropertyResourceBundle resourceBundle = (PropertyResourceBundle) PropertyResourceBundle
				.getBundle(fileName);
		// ��ϵͳ���ø�ֵ�������
		Enumeration enu = resourceBundle.getKeys();
		while (enu.hasMoreElements()) {
			String propertyName = enu.nextElement().toString();
			if (propertyName.equals("database.url"))
				url = resourceBundle.getString("database.url");
			if (propertyName.equals("database.driver"))
				driver = resourceBundle.getString("database.driver");
			if (propertyName.equals("database.username"))
				username = resourceBundle.getString("database.username");
			if (propertyName.equals("database.password"))
				password = resourceBundle.getString("database.password");
			if (propertyName.equals("database.type"))
				type = resourceBundle.getString("database.type");
			if (propertyName.equals("database.datasource"))
				datasource = resourceBundle.getString("database.datasource");
		}

	}

	/**
	 * ȡ�����ݿ�����
	 * 
	 * @return
	 * @throws SQLException
	 */
	public synchronized static java.sql.Connection getConnection()
			throws SQLException {
		Connection con = (Connection) connection.get();
		if (con != null && !con.isClosed()) {
			return con;
		}
		if ("pooled".equalsIgnoreCase(type)) {
			// ��JNDI��ȡ������Դ
			try {
				// �˴����ڲ�ͬ��Ӧ�÷���������env���벻ͬ
				Hashtable env = new Hashtable();
				// �˴����ڲ�ͬ��Ӧ�÷���������env���벻ͬ
				Context ctx = new InitialContext(env); // ������ϵͳ�л�ȡ DataSource
														// ��������
				DataSource dataSource = (DataSource) ctx.lookup(datasource);
				con = dataSource.getConnection();
				connection.set(con);
				return con;
			} catch (NamingException e) {
				e.printStackTrace();
			}
		} else {
			// ֱ��ʹ��JDBC��������
			try {
				Class providerClass = Class.forName(driver);
				con = DriverManager.getConnection(url, username, password);
				con.setAutoCommit(false);
				connection.set(con);
				return con;

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void commit() {
		Connection con = (Connection) connection.get();
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback() {
		Connection con = (Connection) connection.get();
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public synchronized static void releaseConnection(Connection connection) {

		try {
			if (connection != null && !connection.isClosed())
				connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection = null;
	}

	public static void main(String[] args) {

		try {
			Database.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}