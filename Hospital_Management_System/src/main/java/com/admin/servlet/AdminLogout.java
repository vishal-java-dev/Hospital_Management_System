package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminlogout")
public class AdminLogout  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		HttpSession session=req.getSession();
		session.removeAttribute("adminObj");
		session.setAttribute("sucMsg","Admin Logout Sucessfully");
		resp.sendRedirect("admin_login.jsp");
		
	}

}
