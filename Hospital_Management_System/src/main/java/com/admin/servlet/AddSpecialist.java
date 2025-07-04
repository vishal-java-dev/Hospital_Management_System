package com.admin.servlet;

import java.io.IOException;

import com.Db.DBConnect;
import com.dao.SpecialistDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet ("/addSpecialist")
public class AddSpecialist extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName=req.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DBConnect.getconn());
		boolean f=dao.addSpecialist(specName);
		
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("sucMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Email & Password");
			resp.sendRedirect("admin/index.jsp");
		}

	
	}

}
