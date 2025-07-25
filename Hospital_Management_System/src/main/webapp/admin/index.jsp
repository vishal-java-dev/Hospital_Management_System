<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Medi Home</title>
<%@include file="/components/allCss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url('https://images.pexels.com/photos/2324837/pexels-photo-2324837.jpeg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        color: #333;
    }

    .overlay {
        background-color: rgba(255, 255, 255, 0.6);
        min-height: 100vh;
        padding: 50px 20px;
    }

    .dashboard-title {
        font-size: 2.5rem;
        font-weight: 700;
        color: #198754;
        text-align: center;
        margin-bottom: 40px;
        text-shadow: 1px 1px 0 #fff;
    }

    .paint-card {
        background: rgba(255, 255, 255, 0.92);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        border-radius: 20px;
        padding: 30px;
        transition: all 0.3s ease;
        text-align: center;
    }

    .paint-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
    }

    .paint-card i {
        font-size: 3.5rem;
        color: #198754;
        margin-bottom: 15px;
    }

    .paint-card p {
        font-size: 1.2rem;
        font-weight: 500;
        margin-bottom: 5px;
    }

    .paint-card span {
        font-size: 1.8rem;
        font-weight: 700;
        color: #0d6efd;
    }

    .modal-content {
        border-radius: 12px;
    }

    .modal-title {
        color: #198754;
        font-weight: 600;
    }

    .btn-primary {
        background-color: #198754;
        border: none;
    }

    .btn-primary:hover {
        background-color: #157347;
    }

    .form-group label {
        font-weight: 500;
    }
</style>
</head>
<body>

<%@ include file="navbar.jsp"%>

<c:if test="${empty adminObj}">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="overlay">
    <p class="dashboard-title"><i class="fas fa-chart-line"></i> Admin Dashboard</p>

    <c:if test="${not empty errorMsg}">
        <p class="fs-4 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>

    <c:if test="${not empty sucMsg}">
        <p class="fs-4 text-center text-success">${sucMsg}</p>
        <c:remove var="sucMsg" scope="session" />
    </c:if>

    <%
        DoctorDao dao = new DoctorDao(DBConnect.getconn());
    %>

    <div class="container">
        <div class="row g-4 justify-content-center">

            <div class="col-md-5 col-lg-3">
                <div class="paint-card">
                    <i class="fas fa-user-md"></i>
                    <p>Doctors</p>
                    <span><%=dao.countDoctor()%></span>
                </div>
            </div>

            <div class="col-md-5 col-lg-3">
                <div class="paint-card">
                    <i class="fas fa-calendar-check"></i>
                    <p>Total Appointments</p>
                    <span><%=dao.countAppointment()%></span>
                </div>
            </div>

            <div class="col-md-5 col-lg-3">
                <div class="paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor:pointer;">
                    <i class="fas fa-notes-medical"></i>
                    <p>Specialists</p>
                    <span><%=dao.countSpecialist()%></span>
                </div>
            </div>

            <div class="col-md-5 col-lg-3">
                <div class="paint-card">
                    <i class="fas fa-users"></i>
                    <p>Total Users</p>
                    <span><%=dao.countUser()%></span>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Modal: Add Specialist -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content p-3">
            <div class="modal-header">
                <h5 class="modal-title"><i class="fas fa-plus-circle"></i> Add Specialist</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label>Specialist Name</label>
                        <input type="text" name="specName" class="form-control" required />
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="fas fa-times"></i> Close
                </button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
