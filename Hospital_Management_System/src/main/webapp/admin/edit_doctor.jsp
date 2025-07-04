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
    <title>Edit Doctor - Medi Home</title>
    <%@include file="/components/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            background: url('https://images.pexels.com/photos/8460049/pexels-photo-8460049.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.6);
            min-height: 100vh;
            padding: 60px 20px;
        }

        .paint-card {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            transition: 0.3s ease-in-out;
        }

        .paint-card:hover {
            transform: translateY(-5px);
        }

        .fs-3 {
            font-weight: 600;
            color: #198754;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-label i {
            color: #198754;
            margin-right: 8px;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px;
        }

        .btn-primary {
            background-color: #198754;
            border: none;
            font-weight: 500;
            border-radius: 10px;
            transition: background 0.3s;
        }

        .btn-primary:hover {
            background-color: #157347;
        }

        .alert {
            font-size: 1rem;
            font-weight: 500;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp"%>

<div class="overlay">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="paint-card">
                    <p class="fs-3"><i class="fas fa-user-edit"></i> Edit Doctor Details</p>

                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger text-center">${errorMsg}</div>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty sucMsg}">
                        <div class="alert alert-success text-center">${sucMsg}</div>
                        <c:remove var="sucMsg" scope="session" />
                    </c:if>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2 = new DoctorDao(DBConnect.getconn());
                        Doctor d = dao2.getDoctorById(id);
                    %>

                    <form action="../updateDoctor" method="post">
                        <input type="hidden" name="id" value="<%=d.getId()%>">

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-user"></i> Full Name</label>
                            <input type="text" required name="fullname" class="form-control" value="<%=d.getFullname()%>">
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-calendar-day"></i> Date of Birth</label>
                            <input type="date" required name="dob" class="form-control" value="<%=d.getDob()%>">
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-graduation-cap"></i> Qualification</label>
                            <input type="text" required name="qualification" class="form-control" value="<%=d.getQualification()%>">
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-user-md"></i> Specialist</label>
                            <select name="spec" required class="form-control">
                                <option selected><%=d.getSpecialist()%></option>
                                <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getconn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                        if (!s.getSpecialistName().equals(d.getSpecialist())) {
                                %>
                                    <option><%=s.getSpecialistName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                            <input type="email" required name="email" class="form-control" value="<%=d.getEmail()%>">
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-phone"></i> Mobile No</label>
                            <input type="text" required name="mobno" class="form-control" value="<%=d.getMobno()%>">
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-lock"></i> Password</label>
                            <input type="text" required name="password" class="form-control" value="<%=d.getPassword()%>">
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-save"></i> Update Doctor
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
