<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Doctor - Medi Home</title>
    <%@include file="/components/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.pexels.com/photos/3825529/pexels-photo-3825529.jpeg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: brightness(0.95);
        }

        .paint-card {
            background: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            padding: 30px;
            margin-top: 40px;
        }

        .fs-3 {
            font-weight: 600;
            color: #198754;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 6px;
        }

        .form-control::placeholder {
            font-style: italic;
        }

        .btn-primary {
            background-color: #198754;
            border: none;
            font-weight: 500;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #146c43;
        }

        .alert-success, .alert-danger {
            padding: 12px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 6px;
        }

        .input-group-text {
            background-color: #198754;
            color: white;
            border: none;
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center"><i class="fas fa-user-plus me-1"></i>Add Doctor</p>

                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">${errorMsg}</div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty sucMsg}">
                            <div class="alert alert-success text-center">${sucMsg}</div>
                            <c:remove var="sucMsg" scope="session" />
                        </c:if>

                        <form action="../addDoctor" method="post">

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" required name="fullname" class="form-control" placeholder="Enter full name">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Date of Birth</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar-day"></i></span>
                                    <input type="date" required name="dob" class="form-control">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
                                    <input type="text" required name="qualification" class="form-control" placeholder="Enter qualification">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user-md"></i></span>
                                    <select name="spec" required class="form-control">
                                        <option value="">-- Select --</option>
                                        <%
                                            SpecialistDao dao = new SpecialistDao(DBConnect.getconn());
                                            List<Specialist> list = dao.getAllSpecialist();
                                            for (Specialist s : list) {
                                        %>
                                        <option><%= s.getSpecialistName() %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" required name="email" class="form-control" placeholder="Enter email">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mobile No</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="text" required name="mobno" class="form-control" placeholder="Enter mobile number">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" required name="password" class="form-control" placeholder="Create password">
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-paper-plane me-2"></i>Submit</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
