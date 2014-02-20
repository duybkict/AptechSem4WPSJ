/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duy
 */
public class DataContext
{

	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306;database=AptechSem4WPSJ";
			String user = "root";
			String pass = "";
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException ex) {
			// TODO
		} catch (ClassNotFoundException ex) {
			// TODO
		}
		return conn;
	}

	public ArrayList<Article> getEvents() {
		ArrayList<Article> list = new ArrayList<Article>();
		String sql = "SELECT id, image, title, short_description, content "
				+ "FROM articles "
				+ "WHERE published = 1 AND category = 1";

		try {
			ResultSet rs = getConnection().createStatement().executeQuery(sql);
			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt(1));
				article.setImage(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setShortDescription(rs.getString(4));
				article.setContent(rs.getString(5));

				list.add(article);
			}
			rs.close();
		} catch (SQLException ex) {
			// TODO
		}

		return list;
	}

}
