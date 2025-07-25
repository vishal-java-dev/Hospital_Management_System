<%@page import="com.entity.Doctor"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
<%@include file="/components/allCss.jsp"%>
<style>
body {
	background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
		url('https://images.pexels.com/photos/247786/pexels-photo-247786.jpeg') center/cover no-repeat fixed;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	min-height: 100vh;
	margin: 0;
	padding: 0;
}

.dashboard-header {
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url('https://images.pexels.com/photos/8460049/pexels-photo-8460049.jpeg') center/cover no-repeat;
	height: 25vh;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.dashboard-header h2 {
	font-weight: 600;
	font-size: 2.4rem;
	letter-spacing: 1px;
}

.paint-card {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	background: #fff;
	transition: 0.3s ease-in-out;
	margin-top: 2rem;
}

.paint-card:hover {
	transform: scale(1.02);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.paint-card .card-body {
	padding: 30px;
}

.stat-icon {
	font-size: 3rem;
	color: #17a2b8;
}

.stat-text {
	margin-top: 15px;
	font-size: 1.3rem;
	font-weight: 600;
	color: #343a40;
}

.stat-number {
	font-size: 2rem;
	font-weight: bold;
	color: #28a745;
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%
	Doctor d = (Doctor) session.getAttribute("docObj");
	DoctorDao dao = new DoctorDao(DBConnect.getconn());
	%>

	<!-- Header Section -->
	<div class="dashboard-header">
		<h2>Welcome to Doctor Dashboard</h2>
	</div>

	<!-- Stats Cards -->
	<div class="container pb-5">
		<div class="row justify-content-center g-4">

			<!-- Total Doctors -->
			<div class="col-md-5 col-lg-4">
				<div class="card paint-card text-center">
					<div class="card-body">
						<i class="fas fa-user-md stat-icon"></i>
						<div class="stat-text">Total Doctors</div>
						<div class="stat-number"><%=dao.countDoctor()%></div>
					</div>
				</div>
			</div>

			<!-- Appointments for this Doctor -->
			<div class="col-md-5 col-lg-4">
				<div class="card paint-card text-center">
					<div class="card-body">
						<i class="fa-solid fa-calendar-check stat-icon"></i>
						<div class="stat-text">Your Appointments</div>
						<div class="stat-number"><%=dao.countAppointmentByDoctorId(d.getId())%></div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
