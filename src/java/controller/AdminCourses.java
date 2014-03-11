/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminDataContext;
import model.DataContext;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import util.ImageResizer;

/**
 *
 * @author Duy
 */
public class AdminCourses extends HttpServlet {

	/**
	 * Processes requests for both HTTP
	 * <code>GET</code> and
	 * <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP
	 * <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP
	 * <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean result = false;

		String action = null;
		int id = 0;
		FileItem imageFileItem = null;
		String title = null;
		String shortDescription = null;
		String content = null;
		boolean published = false;
		int status = 0;
		float price = 0;

		try {
			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					if ("action".equals(item.getFieldName())) {
						action = item.getString();
					} else if ("id".equals(item.getFieldName())) {
						try {
							id = Integer.parseInt(item.getString());
						} catch (NumberFormatException e) {
							continue;
						}
					} else if ("title".equals(item.getFieldName())) {
						title = item.getString();
					} else if ("short_description".equals(item.getFieldName())) {
						shortDescription = item.getString();
					} else if ("content".equals(item.getFieldName())) {
						content = item.getString();
					} else if ("published".equals(item.getFieldName())) {
						published = Boolean.parseBoolean(item.getString());
					} else if ("status".equals(item.getFieldName())) {
						status = Integer.parseInt(item.getString());
					} else if ("price".equals(item.getFieldName())) {
						price = Float.parseFloat(item.getString());
					}
				} else {
					if ("image".equals(item.getFieldName())) {
						imageFileItem = item;
					}
				}
			}

			if ("insert".equals(action)) {
				String imageName = "images/courses/" + id + "-" + imageFileItem.getName();
				String path = getServletContext().getRealPath("/") + imageName;
				File uploadedFile = new File(path);
				if (!uploadedFile.exists()) {
					uploadedFile.createNewFile();
				}
				imageFileItem.write(uploadedFile);

				ImageResizer.resize(path, path, 200, 160);

				result = AdminDataContext.insertCourse(imageName, title, shortDescription, content, published, status, price);
			} else if ("update".equals(action)) {
				String imageName = "";
				if (imageFileItem.getName().equals("")) {
					imageName = AdminDataContext.getArticleById(id).getImage();
				} else {
					imageName = "images/courses/" + id + "-" + imageFileItem.getName();
					String path = getServletContext().getRealPath("/") + imageName;
					File uploadedFile = new File(path);
					if (!uploadedFile.exists()) {
						uploadedFile.createNewFile();
					}
					imageFileItem.write(uploadedFile);

					ImageResizer.resize(path, path, 200, 160);
				}

				result = AdminDataContext.updateArticle(id, imageName, title, shortDescription, content, published, status, price);
			} else if ("delete".equals(action)) {
				result = AdminDataContext.deleteArticle(id);
			}
		} catch (Exception e) {
			result = false;
		}

		if (result) {
			response.sendRedirect("courses.jsp?success=" + action);
		} else {
			response.sendRedirect("courses.jsp?error=" + action);
		}

		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
