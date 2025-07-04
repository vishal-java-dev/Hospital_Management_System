<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Registration - Medi Homes</title>
  <%@include file="components/allCss.jsp"%>

  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      background: url('img/bg-4.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .overlay {
      min-height: 100vh;
      background-color: rgba(255, 255, 255, 0.7);
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 50px 0;
    }

    .card-custom {
      background: white;
      border: none;
      border-radius: 1rem;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      padding: 2rem;
      max-width: 500px;
      width: 100%;
    }

    .form-label {
      font-weight: 600;
      color: #333;
    }

    .form-control {
      border-radius: 6px;
    }

    .btn-register {
      background: linear-gradient(135deg, #28a745, #20c997);
      color: white;
      font-weight: 600;
      font-size: 1.1rem;
      border-radius: 50px;
      transition: 0.3s ease;
      padding: 10px;
    }

    .btn-register:hover {
      background: linear-gradient(135deg, #20c997, #17a2b8);
      transform: scale(1.03);
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    }

    .message {
      font-size: 1rem;
    }

    .page-title {
      font-size: 1.6rem;
      font-weight: bold;
      text-align: center;
      color: #28a745;
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>

  <%@ include file="components/navBar.jsp"%>

  <div class="overlay">
    <div class="card card-custom">
      <h4 class="page-title"><i class="fas fa-user-plus me-2"></i>New User Registration</h4>

      <c:if test="${not empty sucMsg}">
        <div class="alert alert-success text-center message">${sucMsg}</div>
        <c:remove var="sucMsg" scope="session" />
      </c:if>

      <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger text-center message">${errorMsg}</div>
        <c:remove var="errorMsg" scope="session" />
      </c:if>

      <form action="user_register" method="post">
        <div class="mb-3">
          <label class="form-label">Full Name</label>
          <input required name="fullname" type="text" class="form-control" placeholder="Enter your full name">
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input required name="email" type="email" class="form-control" placeholder="Enter your email">
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <input required name="password" type="password" class="form-control" placeholder="Create a password">
        </div>

        <button type="submit" class="btn btn-register w-100">
          <i class="fas fa-user-plus me-2"></i>Register
        </button>
      </form>

    </div>
  </div>

  <%@include file="components/footer.jsp"%>

</body>
</html>
