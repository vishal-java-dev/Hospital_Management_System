<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Doctor Profile</title>
  <%@include file="/components/allCss.jsp"%>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />

  <style>
    body {
      background: linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)),
        url('https://images.pexels.com/photos/8460156/pexels-photo-8460156.jpeg?auto=compress&cs=tinysrgb&w=1600') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', sans-serif;
    }

    .paint-card {
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
      padding: 30px;
      transition: all 0.3s ease;
    }

    .paint-card:hover {
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
    }

    .form-label {
      font-weight: 600;
      color: #333;
    }

    .btn-success {
      background-color: #198754;
      border: none;
      font-weight: 600;
      transition: 0.3s;
    }

    .btn-success:hover {
      background-color: #157347;
      box-shadow: 0 5px 12px rgba(0, 0, 0, 0.2);
    }

    .btn-primary {
      background-color: #0d6efd;
      border: none;
      font-weight: 600;
      transition: 0.3s;
    }

    .btn-primary:hover {
      background-color: #0b5ed7;
      box-shadow: 0 5px 12px rgba(0, 0, 0, 0.2);
    }

    .section-title {
      font-size: 1.5rem;
      font-weight: bold;
      color: #0d6efd;
      text-align: center;
      margin-bottom: 20px;
    }

    .alert {
      font-size: 0.95rem;
      margin-bottom: 15px;
    }

    input, select {
      border-radius: 6px !important;
    }
  </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<c:if test="${empty docObj}">
  <c:redirect url="../doctor_login.jsp" />
</c:if>

<div class="container py-5">
  <div class="row g-4">

    <!-- Change Password Section -->
    <div class="col-md-4">
      <div class="paint-card">
        <div class="section-title"><i class="fas fa-key me-2"></i>Change Password</div>

        <c:if test="${not empty sucMsg}">
          <div class="alert alert-success">${sucMsg}</div>
          <c:remove var="sucMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty errorMsg}">
          <div class="alert alert-danger">${errorMsg}</div>
          <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <form action="../docChangePassword" method="post">
          <input type="hidden" name="userId" value="${docObj.id}" />

          <div class="mb-3">
            <label class="form-label">Old Password</label>
            <input type="password" name="oldPassword" class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">New Password</label>
            <input type="password" name="newPassword" class="form-control" required>
          </div>

          <button type="submit" class="btn btn-success w-100">
            <i class="fas fa-lock me-1"></i>Change Password
          </button>
        </form>
      </div>
    </div>

    <!-- Edit Profile Section -->
    <div class="col-md-7 offset-md-1">
      <div class="paint-card">
        <div class="section-title"><i class="fas fa-user-edit me-2"></i>Edit Profile</div>

        <c:if test="${not empty sucMsgd}">
          <div class="alert alert-success">${sucMsgd}</div>
          <c:remove var="sucMsgd" scope="session"/>
        </c:if>
        <c:if test="${not empty errorMsgd}">
          <div class="alert alert-danger">${errorMsgd}</div>
          <c:remove var="errorMsgd" scope="session"/>
        </c:if>

        <form action="../doctorUpdateProfile" method="post">
          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="fullname" class="form-control" value="${docObj.fullname}" required>
          </div>

          <div class="mb-3">
            <label class="form-label">DOB</label>
            <input type="date" name="dob" class="form-control" value="${docObj.dob}" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Qualification</label>
            <input type="text" name="qualification" class="form-control" value="${docObj.qualification}" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Specialist</label>
            <select name="spec" class="form-control" required>
              <option selected>${docObj.specialist}</option>
              <%
                SpecialistDao dao = new SpecialistDao(DBConnect.getconn());
                List<Specialist> list = dao.getAllSpecialist();
                for (Specialist s : list) {
              %>
                <option><%= s.getSpecialistName() %></option>
              <% } %>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="${docObj.email}" readonly>
          </div>

          <div class="mb-3">
            <label class="form-label">Mobile Number</label>
            <input type="text" name="mobno" class="form-control" value="${docObj.mobno}" required>
          </div>

          <input type="hidden" name="id" value="${docObj.id}" />
          <button type="submit" class="btn btn-primary w-100">
            <i class="fas fa-save me-1"></i>Update Profile
          </button>
        </form>
      </div>
    </div>

  </div>
</div>

</body>
</html>
