<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Doctor Login - Medi Homes</title>
  <%@include file="components/allCss.jsp"%>

  <style>
    body, html {
      height: 100%;
      margin: 0;
      padding: 0;
      background: url('img/bg-5.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .overlay {
      background-color: rgba(255, 255, 255, 0.3);
      min-height: 100vh;
      padding-top: 70px;
      padding-bottom: 40px;
      display: flex;
      align-items: center;
    }

    .paint-card {
      box-shadow: 0 6px 25px rgba(0, 0, 0, 0.25);
      border-radius: 14px;
      background-color: #ffffff;
      padding: 30px 25px;
      transition: all 0.4s ease;
    }

    .form-label {
      font-weight: 600;
      margin-bottom: 5px;
      color: #333;
    }

    .form-control {
      border-radius: 10px;
      border: 1px solid #ccc;
      padding: 10px 15px;
      font-size: 1rem;
      transition: all 0.3s ease-in-out;
      box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    .form-control:focus {
      border-color: #28a745;
      box-shadow: 0 0 5px rgba(40, 167, 69, 0.3);
    }

    .login-title {
      font-weight: 700;
      font-size: 1.8rem;
      color: #28a745;
    }

    .message {
      font-size: 1rem;
    }

    .btn-custom {
      background: linear-gradient(to right, #28a745, #20c997);
      color: #fff;
      font-weight: 600;
      font-size: 1.1rem;
      padding: 10px;
      border: none;
      border-radius: 50px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .btn-custom:hover {
      background: linear-gradient(to right, #20c997, #17a2b8);
      transform: scale(1.03);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body>

  <%@ include file="components/navBar.jsp"%>

  <div class="overlay">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
          <div class="card paint-card">
            <div class="card-body">

              <h4 class="text-center login-title mb-4">
                <i class="fas fa-user-md me-2"></i>Doctor Login
              </h4>

              <c:if test="${not empty sucMsg}">
                <div class="alert alert-success text-center message">${sucMsg}</div>
                <c:remove var="sucMsg" scope="session" />
              </c:if>

              <c:if test="${not empty errorMsg}">
                <div class="alert alert-danger text-center message">${errorMsg}</div>
                <c:remove var="errorMsg" scope="session" />
              </c:if>

              <form action="doctorLogin" method="post">
                <div class="mb-3">
                  <label class="form-label">Email Address</label>
                  <input required name="email" type="email" class="form-control" placeholder="Enter your registered email">
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

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@include file="components/footer.jsp"%>
</body>
</html>
