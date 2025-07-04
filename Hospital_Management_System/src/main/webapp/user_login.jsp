<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Login - Medi Homes</title>
  <%@include file="components/allCss.jsp"%>

  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      background: url('img/bg-3.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .overlay {
      min-height: 100vh;
      background-color: rgba(255, 255, 255, 0.7);
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 60px 0;
    }

    .card-custom {
      background: white;
      border: none;
      border-radius: 1rem;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
      max-width: 450px;
      width: 100%;
      padding: 2rem;
    }

    .form-label {
      font-weight: 600;
      color: #333;
    }

    .form-control {
      border-radius: 10px;
      padding: 10px 15px;
      font-size: 1rem;
      border: 1px solid #ccc;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: #28a745;
      box-shadow: 0 0 5px rgba(40, 167, 69, 0.4);
    }

    .btn-custom {
      background: linear-gradient(135deg, #28a745, #20c997);
      color: white;
      font-weight: 600;
      font-size: 1.1rem;
      padding: 10px 20px;
      border: none;
      border-radius: 50px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .btn-custom:hover {
      background: linear-gradient(135deg, #20c997, #17a2b8);
      transform: scale(1.03);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }

    .login-title {
      font-weight: 700;
      font-size: 1.8rem;
      color: #28a745;
    }

    .message {
      font-size: 1rem;
    }

    .signup-link {
      font-weight: 500;
      display: block;
      margin-top: 1rem;
      text-align: center;
    }

    .signup-link a {
      color: #007bff;
      text-decoration: none;
    }

    .signup-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <%@ include file="components/navBar.jsp"%>

  <div class="overlay">
    <div class="card card-custom">
      <div class="card-body">
        <h3 class="text-center login-title mb-4">
          <i class="fas fa-user me-2"></i>User Login
        </h3>

        <c:if test="${not empty sucMsg}">
          <div class="alert alert-success text-center message">${sucMsg}</div>
          <c:remove var="sucMsg" scope="session" />
        </c:if>

        <c:if test="${not empty errorMsg}">
          <div class="alert alert-danger text-center message">${errorMsg}</div>
          <c:remove var="errorMsg" scope="session" />
        </c:if>

        <form action="userLogin" method="post">
          <div class="mb-3">
            <label class="form-label">Email address</label>
            <input required name="email" type="email" class="form-control" placeholder="Enter your email">
          </div>

          <div class="mb-3">
            <label class="form-label">Password</label>
            <input required name="password" type="password" class="form-control" placeholder="Enter your password">
          </div>

          <div class="d-grid">
            <button type="submit" class="btn btn-custom w-100">
              <i class="fas fa-sign-in-alt me-2"></i>Login
            </button>
          </div>
        </form>

        <div class="signup-link">
          Don’t have an account? <a href="sign-up.jsp">Create One</a>
        </div>
      </div>
    </div>
  </div>

  <%@include file="components/footer.jsp"%>

</body>
</html>
