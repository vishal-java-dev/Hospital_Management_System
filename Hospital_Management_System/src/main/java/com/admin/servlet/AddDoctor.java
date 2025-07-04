package com.admin.servlet;

import java.io.IOException;

import com.Db.DBConnect;
import com.dao.DoctorDao;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet ("/addDoctor")
public class AddDoctor  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullname =req.getParameter("fullname");
			String dob =req.getParameter("dob");
			String qualification =req.getParameter("qualification");
			String spec =req.getParameter("spec");
			String email =req.getParameter("email");
			String mobno =req.getParameter("mobno");
			String password =req.getParameter("password");
			
			Doctor d=new Doctor(fullname,dob,qualification,spec,email,mobno,password);
			
			DoctorDao dao=new DoctorDao(DBConnect.getconn());
			HttpSession session=req.getSession();
			
			if(dao.registerDoctor(d))
			{
				session.setAttribute("sucMsg", "Doctor Added Successfully..");
				resp.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "something went wrong");
				resp.sendRedirect("admin/doctor.jsp");

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
