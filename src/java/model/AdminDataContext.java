/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Duy
 */
public class AdminDataContext
{

	private static Connection connection;
	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/aptechsem4wpsj";
	private static String USER = "root";
	private static String PASSWORD = "";
	private static int PAGE_LIMIT = 5;

	private static Connection getConnection() {
		try {
			if (connection == null || connection.isClosed()) {
				Class.forName(DRIVER);
				connection = DriverManager.getConnection(URL, USER, PASSWORD);
			}
		} catch (SQLException ex) {
			// TODO
		} catch (ClassNotFoundException ex) {
			// TODO
		}

		return connection;
	}

	public static User checkLogin(String email, String password) {
		User user = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, password "
					+ "FROM users "
					+ "WHERE email = ? AND password = ? AND type = 2 "
					+ "LIMIT 1 OFFSET 0");
			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}

			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return user;
	}
}
