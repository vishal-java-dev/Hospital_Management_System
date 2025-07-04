<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor List - Medi Home</title>
    <%@include file="/components/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.pexels.com/photos/3844581/pexels-photo-3844581.jpeg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: brightness(0.95);
        }

        .paint-card {
            background-color: #ffffff;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 25px;
            margin-top: 30px;
        }

        .fs-3 {
            font-weight: 600;
            color: #198754;
        }

        .table th {
            background-color: #198754;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-sm {
            padding: 4px 10px;
            font-size: 0.875rem;
        }

        .fa {
            margin-right: 6px;
        }

        @media (max-width: 768px) {
            .paint-card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center"><i class="fas fa-user-md"></i> Doctor Details</p>

                        <c:if test="${not empty errorMsg}">
                            <p class="fs-5 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty sucMsg}">
                            <p class="fs-5 text-center text-success">${sucMsg}</p>
                            <c:remove var="sucMsg" scope="session" />
                        </c:if>

                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-user"></i> Full Name</th>
                                        <th><i class="fas fa-calendar"></i> DOB</th>
                                        <th><i class="fas fa-graduation-cap"></i> Qualification</th>
                                        <th><i class="fas fa-stethoscope"></i> Specialist</th>
                                        <th><i class="fas fa-envelope"></i> Email</th>
                                        <th><i class="fas fa-phone"></i> Mobile No</th>
                                        <th><i class="fas fa-cogs"></i> Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        DoctorDao dao2 = new DoctorDao(DBConnect.getconn());
                                        List<Doctor> list2 = dao2.getAllDoctor();
                                        for (Doctor d : list2) {
                                    %>
                                    <tr>
                                        <td><%= d.getFullname() %></td>
                                        <td><%= d.getDob() %></td>
                                        <td><%= d.getQualification() %></td>
                                        <td><%= d.getSpecialist() %></td>
                                        <td><%= d.getEmail() %></td>
                                        <td><%= d.getMobno() %></td>
                                        <td>
                                            <a href="edit_doctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-primary">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <a href="../deleteDoctor?id=<%= d.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
