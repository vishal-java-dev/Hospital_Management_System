<%@page import="com.entity.Appointment"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Patient Comment</title>
  <%@include file="/components/allCss.jsp"%>
  
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
    }

    .backImg {
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
        url("https://images.pexels.com/photos/8460156/pexels-photo-8460156.jpeg?auto=compress&cs=tinysrgb&w=1600") center/cover no-repeat;
      height: 25vh;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .backImg p {
      font-size: 2rem;
      color: white;
      font-weight: 600;
    }

    .paint-card {
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      border-radius: 12px;
      padding: 25px;
      background-color: #fff;
    }

    .form-label {
      font-weight: 600;
    }

    .btn-primary {
      font-weight: 600;
      border-radius: 50px;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      transform: scale(1.02);
      background-color: #0b5ed7;
      box-shadow: 0 5px 10px rgba(0,0,0,0.2);
    }

    textarea.form-control {
      border-radius: 8px;
    }
  </style>
</head>
<body>

  <c:if test="${empty docObj}">
    <c:redirect url="doctor_login.jsp"></c:redirect>
  </c:if>

  <%@ include file="navbar.jsp" %>

  <!-- Banner -->
  <div class="container-fluid backImg">
    <p>Patient Comment</p>
  </div>

  <!-- Main Content -->
  <div class="container py-4">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div class="card paint-card">
          <div class="card-body">
            <p class="text-center fs-4 text-primary fw-semibold mb-4">Leave a Comment for Patient</p>

            <%
              int id = Integer.parseInt(request.getParameter("id"));
              AppointmentDAO dao = new AppointmentDAO(DBConnect.getconn());
              Appointment ap = dao.getAppointmentById(id);
            %>

            <form class="row g-3" action="../updateStatus" method="post">
              <div class="col-md-6">
                <label class="form-label">Patient Name</label>
                <input type="text" readonly value="<%= ap.getFullname() %>" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label">Age</label>
                <input type="text" readonly value="<%= ap.getAge() %>" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label">Mobile No</label>
                <input type="text" readonly value="<%= ap.getPhNo() %>" class="form-control">
              </div>
              <div class="col-md-6">
                <label class="form-label">Diseases</label>
                <input type="text" readonly value="<%= ap.getDiseases() %>" class="form-control">
              </div>
              <div class="col-md-12">
                <label class="form-label">Comment</label>
                <textarea name="comm" required class="form-control" rows="4" placeholder="Write your feedback..."></textarea>
              </div>

              <input type="hidden" name="id" value="<%= ap.getId() %>">
              <input type="hidden" name="did" value="<%= ap.getDoctorId() %>">

              <div class="col-md-12 text-center">
                <button class="btn btn-primary mt-3 px-4 py-2">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
