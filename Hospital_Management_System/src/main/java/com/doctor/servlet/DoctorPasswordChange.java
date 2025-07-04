 package com.doctor.servlet;

import java.io.IOException;

import com.Db.DBConnect;
import com.dao.DoctorDao;
import com.dao.userDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet ("/docChangePassword")
public class DoctorPasswordChange  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int userId = Integer.parseInt(req.getParameter("userId"));
	        String oldPassword = req.getParameter("oldPassword");
	        String newPassword = req.getParameter("newPassword");

	        HttpSession session = req.getSession();
	        DoctorDao dao = new DoctorDao(DBConnect.getconn());

	        if (dao.checkOldPassword(userId, oldPassword)) {
	            boolean success = dao.changePassword(userId, newPassword);
	            if (success) {
	                session.setAttribute("sucMsg", "Password changed successfully.");
	            } else {
	                session.setAttribute("errorMsg", "Something went wrong on server.");
	            }
	        } else {
	            session.setAttribute("errorMsg", "Old password is incorrect.");
	        }

	        resp.sendRedirect("doctor/edit_profile.jsp");
	    }
	}

