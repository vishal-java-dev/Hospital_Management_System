package com.doctor.servlet;

import java.io.IOException;

import com.Db.DBConnect;
import com.dao.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet ("/updateStatus")
public class UpdateStatus extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int did=Integer.parseInt(req.getParameter("did"));
			String comm=req.getParameter("comm");
			
			AppointmentDAO dao=new AppointmentDAO(DBConnect.getconn());
			
			HttpSession session=req.getSession();
			
			if(dao.updateCommentStatus(id, did, comm))
			{
				session.setAttribute("sucMsg", "comment updated");
				resp.sendRedirect("doctor/patient.jsp");
				
			}else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("doctor/patient.jsp");

				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
