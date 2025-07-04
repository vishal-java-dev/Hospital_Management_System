package com.user.servlet;

import java.io.IOException;


import com.Db.DBConnect;
import com.dao.userDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet ("/userLogin")
public class UserLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		HttpSession session=req.getSession();
		
		userDao dao=new userDao(DBConnect.getconn());
		User user=dao.login(email, password);
		
		if(user!=null)
		{
			session.setAttribute("userObj",user);
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Email & Password");
			resp.sendRedirect("user_login.jsp");
		}

	}

}
