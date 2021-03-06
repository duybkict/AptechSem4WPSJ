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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Duy
 */
public class DataContext
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

	public static ArrayList<Article> getEvents(int page) {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description "
					+ "FROM articles "
					+ "WHERE published = 1 AND category = 1 "
					+ "ORDER BY published_date DESC "
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

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getArticlesPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM articles "
					+ "WHERE published = 1 AND category = 1 ");

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

	public static ArrayList<Article> getArticles(String query, int page) {
		ArrayList<Article> list = new ArrayList<Article>();
		query = '%' + query.trim() + '%';

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description "
					+ "FROM articles "
					+ "WHERE published = 1 AND (title LIKE ? OR short_description LIKE ? OR content LIKE ?) "
					+ "ORDER BY published_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setString(1, query);
			pst.setString(2, query);
			pst.setString(3, query);
			pst.setInt(4, PAGE_LIMIT);
			pst.setInt(5, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getArticlesPages(String query) {
		int pages = 0;
		query = '%' + query.trim() + '%';

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM articles "
					+ "WHERE published = 1 AND (title LIKE ? OR short_description LIKE ? OR content LIKE ?) ");
			pst.setString(1, query);
			pst.setString(2, query);
			pst.setString(3, query);

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

	public static ArrayList<Article> getAvailableCourses() {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, price "
					+ "FROM articles "
					+ "WHERE published = 1 AND category = 2 AND status = 1 "
					+ "ORDER BY published_date DESC ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setPrice(rs.getFloat(5));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static ArrayList<Article> getStartingSoonCourses() {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, price "
					+ "FROM articles "
					+ "WHERE published = 1 AND category = 2 AND status = 2 "
					+ "ORDER BY published_date DESC ");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setPrice(rs.getFloat(5));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static ArrayList<Article> getRandomArticles(int count) {
		ArrayList<Article> list = new ArrayList<Article>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description "
					+ "FROM articles "
					+ "WHERE published = 1 "
					+ "ORDER BY RAND() "
					+ "LIMIT ? OFFSET 0");
			pst.setInt(1, count);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static Article getArticleById(int id) {
		Article article = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, content, status, category, price "
					+ "FROM articles "
					+ "WHERE published = 1 AND id = ? "
					+ "LIMIT 1 OFFSET 0");
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setContent(rs.getString(5));
				article.setStatus(rs.getInt(6));
				article.setCategory(rs.getInt(7));
				article.setPrice(rs.getFloat(8));
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return article;
	}

	public static boolean insertFeedback(String fullname, String email, String message) {
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO feedback(full_name, email, message) VALUES (?, ?, ?) ");
			pst.setString(1, fullname);
			pst.setString(2, email);
			pst.setString(3, message);

			pst.executeUpdate();
		} catch (SQLException ex) {
			return false;
		}

		return true;
	}

	public static boolean insertUser(String fullname, String email, String password) {
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO users(full_name, email, password) VALUES (?, ?, ?) ");
			pst.setString(1, fullname);
			pst.setString(2, email);
			pst.setString(3, password);

			pst.executeUpdate();
		} catch (SQLException ex) {
			return false;
		}

		return true;
	}


	public static User checkLogin(String email, String password) {
		User user = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, password "
					+ "FROM users "
					+ "WHERE email = ? AND password = ? "
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

	public static int insertOrder(int userId) {
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO orders(user_id) VALUES (?) ",
					Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, userId);

			pst.executeUpdate();
			ResultSet generatedKeys = pst.getGeneratedKeys();

			if (generatedKeys.next()) {
				return generatedKeys.getInt(1);
			}
		} catch (SQLException ex) {
			return Integer.MIN_VALUE;
		}

		return Integer.MIN_VALUE;
	}

	public static boolean insertOrderItem(int orderId, int itemId, int itemNum, float price) {
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO order_items(order_id, item_id, item_num, price) VALUES (?, ?, ?, ?) ");
			pst.setInt(1, orderId);
			pst.setInt(2, itemId);
			pst.setInt(3, itemNum);
			pst.setFloat(4, price);

			pst.executeUpdate();
		} catch (SQLException ex) {
			return false;
		}

		return true;
	}

}
