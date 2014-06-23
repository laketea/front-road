
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
	 * 数据库访问URL
	 */
	private static String url;

	/**
	 * 数据库驱动
	 */
	private static String driver;

	/**
	 * 数据库访问用户名
	 */
	private static String username;

	/**
	 * 数据库访问口令
	 */
	private static String password;

	/**
	 * 访问类型
	 */
	private static String type;

	/**
	 * 数据源名称
	 */
	private static String datasource;

	/**
	 * 配置文件名称
	 */
	private final static String fileName = "database";

	private static ThreadLocal connection = new ThreadLocal();

	static {
		config();
	}

	private static void config() {
		// 读取系统配置
		PropertyResourceBundle resourceBundle = (PropertyResourceBundle) PropertyResourceBundle
				.getBundle(fileName);
		// 将系统设置赋值给类变量
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
	 * 取得数据库连接
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
			// 从JNDI中取得数据源
			try {
				// 此处对于不同的应用服务器，对env传入不同
				Hashtable env = new Hashtable();
				// 此处对于不同的应用服务器，对env传入不同
				Context ctx = new InitialContext(env); // 从命名系统中获取 DataSource
														// 工厂对象
				DataSource dataSource = (DataSource) ctx.lookup(datasource);
				con = dataSource.getConnection();
				connection.set(con);
				return con;
			} catch (NamingException e) {
				e.printStackTrace();
			}
		} else {
			// 直接使用JDBC驱动连接
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