package com.doctor.servlet;

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

@WebServlet ("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			

			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id, fullname, dob, qualification, spec, email, mobno, "" );

			DoctorDao dao = new DoctorDao(DBConnect.getconn());
			HttpSession session = req.getSession();

			if (dao.editDoctorProfile(d)) {
				Doctor updateDoctor=dao.getDoctorById(id);
				
				session.setAttribute("sucMsgd", "Doctor Updated Successfully..");
				session.setAttribute("docObj", updateDoctor);
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsgd", "something went wrong");
				resp.sendRedirect("doctor/edit_profile.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
