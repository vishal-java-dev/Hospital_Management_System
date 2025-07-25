<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments - Medi Homes</title>
<%@include file="components/allCss.jsp"%>
<style>
body {
  background-color: #f8f9fa;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.paint-card {
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
  border-radius: 10px;
  background-color: #fff;
}
.backImg {
  background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)),
    url("https://images.pexels.com/photos/6749770/pexels-photo-6749770.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=600") center/cover no-repeat;
  height: 25vh;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.backImg p {
  font-size: 2rem;
  font-weight: bold;
  color: white;
}
.table th, .table td {
  vertical-align: middle;
}
.status-badge {
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 0.85rem;
  font-weight: 600;
}
.status-pending {
  background-color: #ffc107;
  color: #212529;
}
.status-approved {
  background-color: #28a745;
  color: white;
}
.status-rejected {
  background-color: #dc3545;
  color: white;
}
.sidebar-img {
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>

<c:if test="${empty userObj}">
  <c:redirect url="user_login.jsp" />
</c:if>

<%@ include file="components/navBar.jsp"%>

<!-- Banner -->
<div class="container-fluid backImg">
  <p>My Appointments</p>
</div>

<div class="container py-4">
  <div class="row">
    <div class="col-md-9">
      <div class="card paint-card">
        <div class="card-body">
          <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
          <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark text-center">
              <tr>
                <th>Full Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Appoint Date</th>
                <th>Diseases</th>
                <th>Doctor Name</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody class="text-center">
              <%
                User user = (User) session.getAttribute("userObj");
                AppointmentDAO dao = new AppointmentDAO(DBConnect.getconn());
                DoctorDao dao2 = new DoctorDao(DBConnect.getconn());
                List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

                for (Appointment ap : list) {
                    Doctor d = dao2.getDoctorById(ap.getDoctorId());
              %>
              <tr>
                <td><%= ap.getFullname() %></td>
                <td><%= ap.getGender() %></td>
                <td><%= ap.getAge() %></td>
                <td><%= ap.getApoinDate() %></td>
                <td><%= ap.getDiseases() %></td>
                <td><%= d.getFullname() %></td>
                <td>
                  <% if ("Pending".equalsIgnoreCase(ap.getStatus())) { %>
                    <span class="status-badge status-pending">Pending</span>
                  <% } else if ("Approved".equalsIgnoreCase(ap.getStatus())) { %>
                    <span class="status-badge status-approved">Approved</span>
                  <% } else { %>
                    <span class="status-badge status-rejected"><%= ap.getStatus() %></span>
                  <% } %>
                </td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Doctor Image -->
    <div class="col-md-3 d-flex justify-content-center align-items-start pt-3">
      <img src="https://images.pexels.com/photos/8376175/pexels-photo-8376175.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=600"
           alt="Doctor" class="img-fluid sidebar-img" style="max-height: 350px;">
    </div>
  </div>
</div>

<%@ include file="components/footer.jsp"%>

</body>
</html>
