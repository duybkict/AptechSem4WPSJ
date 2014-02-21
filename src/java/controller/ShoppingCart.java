/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;
import model.DataContext;
import model.User;

/**
 *
 * @author Duy
 */
public class ShoppingCart extends HttpServlet
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
		int id = Integer.parseInt(request.getParameter("itemid"));

		HashMap<Integer, Integer> shoppingCart = (HashMap<Integer, Integer>) request.getSession().getAttribute("shoppingCart");
		Integer shoppingCartSize = (Integer) request.getSession().getAttribute("shoppingCartSize");

		if (shoppingCart == null) {
			shoppingCart = new HashMap<Integer, Integer>();
		}

		if (shoppingCartSize == null) {
			shoppingCartSize = 0;
		}

		if (action.equals("add")) {
			if (!shoppingCart.containsKey(id)) {
				shoppingCart.put(id, 1);
				shoppingCartSize++;
			}
		} else if (action.equals("delete")) {
			if (shoppingCart.containsKey(id)) {
				shoppingCartSize -= shoppingCart.get(id);
				shoppingCart.remove(id);
			}
		} else if (action.equals("update")) {
			int itemnum = Integer.parseInt(request.getParameter("itemnum"));
			if (shoppingCart.containsKey(id)) {
				shoppingCartSize = shoppingCartSize + itemnum - shoppingCart.get(id);
				shoppingCart.put(id, itemnum);
			}
		} else if (action.equals("checkout")) {
			User user = (User) request.getSession().getAttribute("loginUser");
			int orderId = DataContext.insertOrder(user.getId());

			for (Integer itemId : shoppingCart.keySet()) {
				Article item = DataContext.getArticleById(itemId);
				DataContext.insertOrderItem(orderId, itemId, shoppingCart.get(itemId), item.getPrice());
			}

			request.getSession().removeAttribute("shoppingCart");
			request.getSession().removeAttribute("shoppingCartSize");
			response.sendRedirect("success.jsp?action=checkout");

			processRequest(request, response);
			return;
		}

		request.getSession().setAttribute("shoppingCart", shoppingCart);
		request.getSession().setAttribute("shoppingCartSize", shoppingCartSize.intValue());
		response.sendRedirect("checkout.jsp");

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
