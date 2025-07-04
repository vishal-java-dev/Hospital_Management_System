<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Details - Doctor View</title>
<%@include file="/components/allCss.jsp"%>
<style>
body {
	background: linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)),
		url('https://images.pexels.com/photos/7580258/pexels-photo-7580258.jpeg') center/cover no-repeat fixed;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.paint-card {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	border-radius: 10px;
	background-color: #fff;
}

h3, .fs-3 {
	color: #28a745;
	font-weight: 600;
	text-align: center;
	margin-bottom: 20px;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.btn-comment {
	background: linear-gradient(135deg, #20c997, #17a2b8);
	color: #fff;
	border: none;
}

.btn-comment.disabled {
	opacity: 0.6;
	pointer-events: none;
}

.alert {
	text-align: center;
}
</style>
</head>
<body>

	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>

	<%@ include file="navbar.jsp" %>

	<div class="container py-4">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card paint-card p-4">
					<h3>Patient Details</h3>

					<c:if test="${not empty errorMsg}">
						<div class="alert alert-danger">${errorMsg}</div>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty sucMsg}">
						<div class="alert alert-success">${sucMsg}</div>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<table class="table table-hover table-bordered">
						<thead class="table-light">
							<tr>
								<th>Full Name</th>
								<th>Gender</th>
								<th>Age</th>
								<th>Appointment Date</th>
								<th>Email</th>
								<th>Mobile No</th>
								<th>Diseases</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							Doctor d = (Doctor) session.getAttribute("docObj");
							AppointmentDAO dao = new AppointmentDAO(DBConnect.getconn());
							List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
							for (Appointment ap : list) {
							%>
							<tr>
								<td><%= ap.getFullname() %></td>
								<td><%= ap.getGender() %></td>
								<td><%= ap.getAge() %></td>
								<td><%= ap.getApoinDate() %></td>
								<td><%= ap.getEmail() %></td>
								<td><%= ap.getPhNo() %></td>
								<td><%= ap.getDiseases() %></td>
								<td>
									<span class="badge bg-<%= ap.getStatus().equals("Pending") ? "warning" : "success" %>">
										<%= ap.getStatus() %>
									</span>
								</td>
								<td>
									<%
										if ("Pending".equals(ap.getStatus())) {
									%>
										<a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-sm btn-comment">
											<i class="fa-regular fa-comment"></i> Comment
										</a>
									<% } else { %>
										<a href="#" class="btn btn-sm btn-comment disabled">
											<i class="fa-regular fa-comment"></i> Comment
										</a>
									<% } %>
								</td>
							</tr>
							<% } %>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
