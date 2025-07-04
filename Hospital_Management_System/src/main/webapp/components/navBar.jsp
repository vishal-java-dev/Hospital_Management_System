<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Add Font Awesome and Bootstrap CSS in <head> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm border-bottom">
  <div class="container-fluid px-4">
    <a class="navbar-brand text-primary fw-bold" href="index.jsp">
      <i class="fas fa-hospital-symbol me-2"></i> Medi Homes
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">

        <!-- Not Logged In -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link text-dark" href="admin_login.jsp">
              <i class="fas fa-user-shield me-1"></i> Admin
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="doctor_login.jsp">
              <i class="fas fa-user-md me-1"></i> Doctor
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="user_appointment.jsp">
              <i class="fas fa-calendar-check me-1"></i> Appointment
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="user_login.jsp">
              <i class="fas fa-user me-1"></i> User
            </a>
          </li>
        </c:if>

        <!-- Logged In -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link text-dark" href="user_appointment.jsp">
              <i class="fas fa-calendar-plus me-1"></i> Appointment
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-dark" href="view_appointment.jsp">
              <i class="fas fa-list-alt me-1"></i> View Appointments
            </a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-user-circle me-1"></i> ${userObj.fullname}
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="change_password.jsp">
                <i class="fas fa-key me-2"></i> Change Password</a>
              </li>
              <li><a class="dropdown-item" href="userLogout">
                <i class="fas fa-sign-out-alt me-2"></i> Logout</a>
              </li>
            </ul>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
