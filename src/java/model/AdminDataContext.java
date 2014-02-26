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
import java.util.Date;

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
				feedback.setCreatedDate(getFormatedDate(rs, 5));
				feedback.setModifiedDate(getFormatedDate(rs, 6));

				list.add(feedback);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getFeedbacksPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM feedback ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				pages = (rs.getInt(1) - 1) / PAGE_LIMIT;
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return pages;
	}

	public static ArrayList<Article> getEvents(int page) {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, content, published, published_date, created_date, modified_date "
					+ "FROM articles "
					+ "WHERE category = 1 "
					+ "ORDER BY modified_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setInt(1, PAGE_LIMIT);
			pst.setInt(2, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setContent(rs.getString(5));
				article.setPublished(rs.getBoolean(6));
				article.setPublishedDate(rs.getDate(7));
				article.setCreatedDate(getFormatedDate(rs, 8));
				article.setModifiedDate(getFormatedDate(rs, 9));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getEventsPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM articles "
					+ "WHERE category = 1 ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				pages = (rs.getInt(1) - 1) / PAGE_LIMIT;
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return pages;
	}

	public static ArrayList<Article> getCourses(int page) {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, content, published, published_date, created_date, modified_date, status, price "
					+ "FROM articles "
					+ "WHERE category = 2 "
					+ "ORDER BY modified_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setInt(1, PAGE_LIMIT);
			pst.setInt(2, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setContent(rs.getString(5));
				article.setPublished(rs.getBoolean(6));
				article.setPublishedDate(rs.getDate(7));
				article.setCreatedDate(getFormatedDate(rs, 8));
				article.setModifiedDate(getFormatedDate(rs, 9));
				article.setStatus(rs.getInt(10));
				article.setPrice(rs.getFloat(11));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getCoursesPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM articles "
					+ "WHERE category = 2 ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				pages = (rs.getInt(1) - 1) / PAGE_LIMIT;
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return pages;
	}

	public static boolean deleteCourse(int id) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"DELETE FROM articles "
					+ "WHERE id = ? ");
			pst.setInt(1, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static ArrayList<Order> getOrders(int page) {
		ArrayList<Order> list = new ArrayList<Order>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, user_id, status, created_date, modified_date "
					+ "FROM orders "
					+ "ORDER BY modified_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setInt(1, PAGE_LIMIT);
			pst.setInt(2, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt(1));
				order.setUserId(rs.getInt(2));
				order.setStatus(rs.getInt(3));
				order.setCreatedDate(getFormatedDate(rs, 4));
				order.setModifiedDate(getFormatedDate(rs, 5));
				order.setUser(getUserById(order.getId()));

				list.add(order);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getOrdersPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM orders ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				pages = (rs.getInt(1) - 1) / PAGE_LIMIT;
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return pages;
	}

	private static User getUserById(int id) {
		User user = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, password "
					+ "FROM users "
					+ "WHERE id = ? "
					+ "LIMIT 1 OFFSET 0");
			pst.setInt(1, id);

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

	private static Date getFormatedDate(ResultSet rs, int colIndex) throws SQLException {
		Date date = rs.getDate(colIndex);
		Date time = rs.getTime(colIndex);
		Date datetime = new Date(date.getYear(), date.getMonth(), date.getDate(), time.getHours(), time.getMinutes(), time.getSeconds());

		return datetime;
	}

}
