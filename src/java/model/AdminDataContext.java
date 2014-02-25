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
import java.util.ArrayList;

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
	private static int PAGE_LIMIT = 10;

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

	public static ArrayList<Feedback> getFeedbacks(int page) {
		ArrayList<Feedback> list = new ArrayList<Feedback>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, message, created_date, modified_date "
					+ "FROM feedback "
					+ "ORDER BY modified_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setInt(1, PAGE_LIMIT);
			pst.setInt(2, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Feedback feedback = new Feedback();
				feedback.setId(rs.getInt(1));
				feedback.setFullName(rs.getString(2));
				feedback.setEmail(rs.getString(3));
				feedback.setMessage(rs.getString(4));
				feedback.setCreatedDate(rs.getDate(5));
				feedback.setModifiedDate(rs.getDate(6));

				list.add(feedback);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}
}
