<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.entity.Doctor, java.util.List, com.Db.DBConnect, com.dao.DoctorDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Appointment - Medi Homes</title>
  <%@ include file="components/allCss.jsp" %>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
    }

    .backImg {
      background: linear-gradient(rgba(0,0,0,.6), rgba(0,0,0,.6)),
        url('https://images.pexels.com/photos/5215024/pexels-photo-5215024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260') center/cover no-repeat fixed;
      height: 28vh;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      text-align: center;
    }

    .paint-card {
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      border-radius: 12px;
      background: #fff;
    }

    .form-label {
      font-weight: 600;
      color: #333;
    }

    .form-control, textarea {
      border-radius: 6px;
    }

    .btn-submit {
      background: linear-gradient(135deg, #20c997, #17a2b8);
      color: white;
      font-weight: 600;
      font-size: 1.05rem;
      border-radius: 50px;
      transition: 0.3s;
    }

    .btn-submit:hover {
      transform: scale(1.02);
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .section-title {
      font-weight: bold;
      font-size: 1.8rem;
      color: #20c997;
    }

    .form-error {
      font-size: 1rem;
    }

    .sidebar-img {
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      width: 100%;
      height: auto;
      object-fit: cover;
    }
  </style>
</head>
<body>
  <%@ include file="components/navBar.jsp" %>

  <!-- Banner -->
  <div class="backImg">
    <h2><i class="fas fa-calendar-check me-2"></i>Book Your Appointment</h2>
  </div>

  <!-- Content Section -->
  <div class="container py-5">
    <div class="row gx-5 align-items-center">

      <!-- Professional Doctor Image -->
      <div class="col-md-5">
        <img src="https://images.pexels.com/photos/8460035/pexels-photo-8460035.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
             alt="Doctor Consultation"
             class="img-fluid sidebar-img">
      </div>

      <!-- Form Section -->
      <div class="col-md-7">
        <div class="card paint-card p-4">
          <p class="text-center section-title mb-4">
            <i class="fas fa-user-md me-2"></i>User Appointment
          </p>

          <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center form-error">${errorMsg}</div>
            <c:remove var="errorMsg" scope="session"/>
          </c:if>

          <c:if test="${not empty sucMsg}">
            <div class="alert alert-success text-center form-error">${sucMsg}</div>
            <c:remove var="sucMsg" scope="session"/>
          </c:if>

          <form class="row g-3" action="addAppointment" method="post">
            <input type="hidden" name="userid" value="${userObj.id}">

            <!-- Form Fields -->
            <div class="col-md-6">
              <label class="form-label">Full Name</label>
              <input required type="text" class="form-control" name="fullname">
            </div>

            <div class="col-md-6">
              <label class="form-label">Gender</label>
              <select class="form-control" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
              </select>
            </div>

            <div class="col-md-6">
              <label class="form-label">Age</label>
              <input required type="number" class="form-control" name="age">
            </div>

            <div class="col-md-6">
              <label class="form-label">Appointment Date</label>
              <input type="date" class="form-control" required name="appoint_date">
            </div>

            <div class="col-md-6">
              <label class="form-label">Email</label>
              <input required type="email" class="form-control" name="email">
            </div>

            <div class="col-md-6">
              <label class="form-label">Phone No</label>
              <input maxlength="10" required type="number" class="form-control" name="phno">
            </div>

            <div class="col-md-6">
              <label class="form-label">Diseases</label>
              <input required type="text" class="form-control" name="diseases">
            </div>

            <div class="col-md-6">
              <label class="form-label">Doctor</label>
              <select required class="form-control" name="doct">
                <option value="">--Select--</option>
                <%
                  DoctorDao dao = new DoctorDao(DBConnect.getconn());
                  List<Doctor> list = dao.getAllDoctor();
                  for (Doctor d : list) {
                %>
                  <option value="<%=d.getId()%>"><%=d.getFullname()%> (<%=d.getSpecialist()%>)</option>
                <% } %>
              </select>
            </div>

            <div class="col-md-12">
              <label class="form-label">Full Address</label>
              <textarea required name="address" class="form-control" rows="3"></textarea>
            </div>

            <div class="col-md-12 text-center mt-3">
              <c:choose>
                <c:when test="${empty userObj}">
                  <a href="user_login.jsp" class="btn btn-submit w-50">Login to Submit</a>
                </c:when>
                <c:otherwise>
                  <button class="btn btn-submit w-50">Submit Appointment</button>
                </c:otherwise>
              </c:choose>
            </div>

          </form>
        </div>
      </div>

    </div>
  </div>

  <%@ include file="components/footer.jsp" %>
</body>
</html>
