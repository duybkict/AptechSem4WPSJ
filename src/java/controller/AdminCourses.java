/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminDataContext;

/**
 *
 * @author Duy
 */
public class AdminCourses extends HttpServlet
{

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
		String action = request.getParameter("action");
		boolean result = false;

		try {
			if (action.equals("insert")) {
				String image = request.getParameter("image");
				String title = request.getParameter("title");
				String shortDescription = request.getParameter("short_description");
				String content = request.getParameter("content");
				boolean published = Boolean.parseBoolean(request.getParameter("published"));
				int status = Integer.parseInt(request.getParameter("status"));
				float price = Float.parseFloat(request.getParameter("price"));

				result = AdminDataContext.insertCourse(image, title, shortDescription, content, published, status, price);
			} else if (action.equals("update")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String image = request.getParameter("image");
				String title = request.getParameter("title");
				String shortDescription = request.getParameter("short_description");
				String content = request.getParameter("content");
				boolean published = Boolean.parseBoolean(request.getParameter("published"));
				int status = Integer.parseInt(request.getParameter("status"));
				float price = Float.parseFloat(request.getParameter("price"));

				result = AdminDataContext.updareCourse(id, image, title, shortDescription, content, published, status, price);
			} else if (action.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));

				result = AdminDataContext.deleteCourse(id);
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
