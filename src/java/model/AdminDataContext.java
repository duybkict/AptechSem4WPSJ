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

	public static Article getArticleById(int id) {
		Article course = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, image, title, short_description, content, published, published_date, created_date, modified_date, status, price, category "
					+ "FROM articles "
					+ "WHERE id = ? "
					+ "LIMIT 1 OFFSET 0");
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				course = new Article();
				course.setId(rs.getInt(1));
				course.setImage(rs.getString(2));
				course.setTitle(rs.getString(3));
				course.setShortDescription(rs.getString(4));
				course.setContent(rs.getString(5));
				course.setPublished(rs.getBoolean(6));
				course.setPublishedDate(rs.getDate(7));
				course.setCreatedDate(getFormatedDate(rs, 8));
				course.setModifiedDate(getFormatedDate(rs, 9));
				course.setStatus(rs.getInt(10));
				course.setPrice(rs.getFloat(11));
				course.setCategory(rs.getInt(12));
			}
			rs.close();
		} catch (SQLException ex) {
			return null;
		}

		return course;
	}

	public static boolean insertCourse(String image, String title, String shortDescription, String content, boolean published, int status, float price) {
		return insertArticle(image, title, shortDescription, content, published, status, price, 2);
	}
	
	public static boolean insertEvent(String image, String title, String shortDescription, String content, boolean published) {
		return insertArticle(image, title, shortDescription, content, published, 0, 0, 1);
	}
	
	public static boolean insertArticle(String image, String title, String shortDescription, String content, boolean published, int status, float price, int category) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO articles(image, title, short_description, content, published, status, price, category) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?) ");
			pst.setString(1, image);
			pst.setString(2, title);
			pst.setString(3, shortDescription);
			pst.setString(4, content);
			pst.setBoolean(5, published);
			pst.setInt(6, status);
			pst.setFloat(7, price);
			pst.setInt(8, category);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean updateArticle(int id, String image, String title, String shortDescription, String content, boolean published, int status, float price, int category) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE articles "
					+ "SET image = ?, title = ?, short_description = ?, content = ?, published = ?, status = ?, price = ?, category = ? "
					+ "WHERE id = ? ");
			pst.setString(1, image);
			pst.setString(2, title);
			pst.setString(3, shortDescription);
			pst.setString(4, content);
			pst.setBoolean(5, published);
			pst.setInt(6, status);
			pst.setFloat(7, price);
			pst.setInt(8, category);
			pst.setInt(9, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean deleteArticle(int id) {
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
				order.setUser(getUserById(order.getUserId()));

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

	public static Order getOrderById(int id) {
		Order order = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, user_id, status, created_date, modified_date "
					+ "FROM orders "
					+ "WHERE id = ? "
					+ "LIMIT 1 OFFSET 0");
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				order = new Order();
				order.setId(rs.getInt(1));
				order.setUserId(rs.getInt(2));
				order.setStatus(rs.getInt(3));
				order.setCreatedDate(getFormatedDate(rs, 4));
				order.setModifiedDate(getFormatedDate(rs, 5));
				order.setUser(getUserById(order.getUserId()));
			}
			rs.close();
		} catch (SQLException ex) {
			return null;
		}

		return order;
	}

	public static boolean updateOrder(int id, int status) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE orders "
					+ "SET status = ? "
					+ "WHERE id = ? ");
			pst.setInt(1, status);
			pst.setInt(2, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean deleteOrder(int id) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"DELETE FROM orders "
					+ "WHERE id = ? ");
			pst.setInt(1, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}
	
	public static ArrayList<OrderItem> getOrderItemsByOrderId(int id) {
		ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT item_id, order_id, item_num, price "
					+ "FROM order_items "
					+ "WHERE order_id = ? ");
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				OrderItem item = new OrderItem();
				item.setItemId(rs.getInt(1));
				item.setOrderId(rs.getInt(2));
				item.setItemNum(rs.getInt(3));
				item.setPrice(rs.getFloat(4));
				item.setItem(getArticleById(item.getItemId()));
				
				orderItems.add(item);
			}
			rs.close();
		} catch (SQLException ex) {
			return null;
		}

		return orderItems;
	}

	public static ArrayList<User> getUsers(int page) {
		ArrayList<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, password, type, created_date, modified_date "
					+ "FROM users "
					+ "ORDER BY modified_date DESC "
					+ "LIMIT ? OFFSET ?");
			pst.setInt(1, PAGE_LIMIT);
			pst.setInt(2, (page - 1) * PAGE_LIMIT);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setType(rs.getInt(5));
				user.setCreatedDate(getFormatedDate(rs, 6));
				user.setModifiedDate(getFormatedDate(rs, 7));

				list.add(user);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

	public static int getUsersPages() {
		int pages = 1;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT COUNT(id) "
					+ "FROM users ");

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

	public static boolean resetUser(int id) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE users "
					+ "SET password = '0' "
					+ "WHERE id = ? ");
			pst.setInt(1, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean setAdmin(int id) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE users "
					+ "SET type = 2 "
					+ "WHERE id = ? ");
			pst.setInt(1, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean unsetAdmin(int id) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE users "
					+ "SET type = 1 "
					+ "WHERE id = ? ");
			pst.setInt(1, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static User getUserById(int id) {
		User user = null;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT id, full_name, email, password, type "
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
				user.setType(rs.getInt(5));
			}

			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return user;
	}

	public static boolean updateUser(int id, String password) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"UPDATE users "
					+ "SET password = ? "
					+ "WHERE id = ? ");
			pst.setString(1, password);
			pst.setInt(2, id);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	public static boolean insertUser(String fullName, String email, String password, int type) {
		int r = 0;

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO users(full_name, email, password, type) "
					+ "VALUES(?, ?, ?, ?) ");
			pst.setString(1, fullName);
			pst.setString(2, email);
			pst.setString(3, password);
			pst.setInt(4, type);

			r = pst.executeUpdate();
		} catch (SQLException ex) {
			// TODO
		}

		return r > 0;
	}

	private static Date getFormatedDate(ResultSet rs, int colIndex) throws SQLException {
		Date date = rs.getDate(colIndex);
		Date time = rs.getTime(colIndex);
		Date datetime = new Date(date.getYear(), date.getMonth(), date.getDate(), time.getHours(), time.getMinutes(), time.getSeconds());

		return datetime;
	}

}
