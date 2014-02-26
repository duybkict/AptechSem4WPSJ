/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminDataContext;
import model.User;

/**
 *
 * @author Duy
 */
public class AdminUsers extends HttpServlet
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
			if (action.equals("reset")) {
				int id = Integer.parseInt(request.getParameter("id"));

				result = AdminDataContext.resetUser(id);
			} else if (action.equals("setadmin")) {
				int id = Integer.parseInt(request.getParameter("id"));

				result = AdminDataContext.setAdmin(id);
			} else if (action.equals("unsetadmin")) {
				int id = Integer.parseInt(request.getParameter("id"));
				User user = (User) request.getSession().getAttribute("adminUser");

				if (user.getId() != id) {
					result = AdminDataContext.unsetAdmin(id);
				}
			} else if (action.equals("update")) {
				int id = Integer.parseInt(request.getParameter("id"));
				User user = (User) request.getSession().getAttribute("adminUser");
				User editUser = AdminDataContext.getUserById(id);

				String password = request.getParameter("password");

				if (user.getId() == id || editUser.getType() == 1) {
					result = AdminDataContext.updateUser(id, password);
				}
			} else if (action.equals("insert")) {
				String fullName = request.getParameter("full_name");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				int type = Integer.parseInt(request.getParameter("type"));

				result = AdminDataContext.insertUser(fullName, email, password, type);
			}
		} catch (Exception e) {
			result = false;
		}

		if (result) {
			response.sendRedirect("users.jsp?success=" + action);
		} else {
			response.sendRedirect("users.jsp?error=" + action);
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
