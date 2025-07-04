<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Change Password - Medi Homes</title>
  <%@include file="components/allCss.jsp"%>
  <style>
    body {
      background: linear-gradient(to right, #e3f2fd, #f1f8e9);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .paint-card {
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
      background: white;
    }

    .card-body {
      padding: 2rem;
    }

    .form-label {
      font-weight: 600;
      color: #333;
    }

    .form-control {
      border-radius: 8px;
    }

    .btn-custom {
      background: linear-gradient(135deg, #20c997, #17a2b8);
      color: white;
      font-weight: 600;
      font-size: 1.05rem;
      border-radius: 50px;
      transition: 0.3s;
    }

    .btn-custom:hover {
      transform: scale(1.02);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .section-title {
      font-size: 1.7rem;
      font-weight: bold;
      color: #20c997;
      text-align: center;
      margin-bottom: 1rem;
    }
  </style>
</head>
<body>

  <c:if test="${empty userObj}">
    <c:redirect url="user_login.jsp" />
  </c:if>

  <%@ include file="components/navBar.jsp" %>

  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card paint-card">
          <div class="card-body">
            <div class="section-title"><i class="fas fa-lock me-2"></i>Change Password</div>

            <!-- Success or error message -->
            <c:if test="${not empty sucMsg}">
              <div class="alert alert-success text-center">${sucMsg}</div>
              <c:remove var="sucMsg" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsg}">
              <div class="alert alert-danger text-center">${errorMsg}</div>
              <c:remove var="errorMsg" scope="session" />
            </c:if>

            <!-- Password Change Form -->
            <form action="changePassword" method="post">
              <input type="hidden" name="userId" value="${userObj.id}" />

              <div class="mb-3">
                <label class="form-label">Enter Old Password</label>
                <input type="password" name="oldPassword" class="form-control" required>
              </div>

              <div class="mb-3">
                <label class="form-label">Enter New Password</label>
                <input type="password" name="newPassword" class="form-control" required>
              </div>

              <div class="d-grid">
                <button type="submit" class="btn btn-custom">
                  <i class="fas fa-key me-1"></i> Change Password
                </button>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="components/footer.jsp" %>

</body>
</html>
