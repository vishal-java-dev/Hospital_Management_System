<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Details - Medi Home</title>
    <%@include file="/components/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.pexels.com/photos/6749771/pexels-photo-6749771.jpeg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: brightness(0.95);
        }

        .paint-card {
            background: rgba(255, 255, 255, 0.92);
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 40px auto;
            max-width: 100%;
        }

        .table th, .table td {
            vertical-align: middle;
            font-size: 0.95rem;
        }

        .table thead th {
            background-color: #198754;
            color: white;
            text-align: center;
        }

        .fs-3 {
            font-weight: 600;
            color: #198754;
        }

        .text-success, .text-danger {
            font-weight: 500;
        }

        .badge-warning {
            background-color: #ffc107;
        }

        .badge-success {
            background-color: #28a745;
        }

        .table i {
            margin-right: 5px;
        }

        .btn i {
            margin-right: 4px;
        }

        @media (max-width: 768px) {
            .paint-card {
                padding: 20px;
                margin: 15px;
            }
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <div class="container-fluid">
        <div class="card paint-card">
            <div class="card-body">
                <p class="fs-3 text-center"><i class="fas fa-notes-medical"></i> All Patient Details</p>

                <c:if test="${not empty errorMsg}">
                    <p class="fs-5 text-center text-danger">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>

                <c:if test="${not empty sucMsg}">
                    <p class="fs-5 text-center text-success">${sucMsg}</p>
                    <c:remove var="sucMsg" scope="session" />
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover text-center">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user"></i> Full Name</th>
                                <th><i class="fas fa-venus-mars"></i> Gender</th>
                                <th><i class="fas fa-user-clock"></i> Age</th>
                                <th><i class="fas fa-calendar-alt"></i> Appointment Date</th>
                                <th><i class="fas fa-envelope"></i> Email</th>
                                <th><i class="fas fa-phone"></i> Mobile No</th>
                                <th><i class="fas fa-heartbeat"></i> Diseases</th>
                                <th><i class="fas fa-user-md"></i> Doctor Name</th>
                                <th><i class="fas fa-map-marker-alt"></i> Address</th>
                                <th><i class="fas fa-info-circle"></i> Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                AppointmentDAO dao = new AppointmentDAO(DBConnect.getconn());
                                DoctorDao dao2 = new DoctorDao(DBConnect.getconn());
                                List<Appointment> list = dao.getAllAppointment();
                                for (Appointment ap : list) {
                                    Doctor d = dao2.getDoctorById(ap.getDoctorId());
                            %>
                            <tr>
                                <td><%= ap.getFullname() %></td>
                                <td><%= ap.getGender() %></td>
                                <td><%= ap.getAge() %></td>
                                <td><%= ap.getApoinDate() %></td>
                                <td><%= ap.getEmail() %></td>
                                <td><%= ap.getPhNo() %></td>
                                <td><%= ap.getDiseases() %></td>
                                <td><%= d != null ? d.getFullname() : "N/A" %></td>
                                <td><%= ap.getAddress() %></td>
                                <td>
                                    <span class="badge <%= "Pending".equalsIgnoreCase(ap.getStatus()) ? "badge-warning" : "badge-success" %>">
                                        <%= ap.getStatus() %>
                                    </span>
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
