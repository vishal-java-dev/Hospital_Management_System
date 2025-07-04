<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Custom CSS -->
<style>
/* Navbar Gradient Background */
.custom-navbar {
	background: linear-gradient(90deg, #20c997, #198754);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Navbar Link Hover Effect */
.navbar-nav .nav-link {
	transition: background-color 0.2s ease-in-out, color 0.2s ease;
	border-radius: 6px;
}

.navbar-nav .nav-link:hover {
	background-color: rgba(255, 255, 255, 0.1);
	color: #fff;
}

/* Dropdown Menu Styling */
.dropdown-menu {
	border-radius: 8px;
	padding: 0.5rem 0;
}

.dropdown-menu .dropdown-item {
	transition: background-color 0.2s ease-in-out;
	padding: 10px 20px;
}

.dropdown-menu .dropdown-item:hover {
	background-color: #f8f9fa;
	color: #198754;
}
</style>


<!-- Admin Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
	<div class="container-fluid px-4">
		<a class="navbar-brand fw-bold fs-4" href="index.jsp"> 
			<i class="fas fa-clinic-medical me-2"></i> Medi Home
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active px-3"
					href="index.jsp"> <i class="fas fa-home me-1"></i> Home
				</a></li>

				<li class="nav-item"><a class="nav-link active px-3"
					href="doctor.jsp"> <i class="fas fa-user-plus me-1"></i> Add
						Doctor
				</a></li>

				<li class="nav-item"><a class="nav-link active px-3"
					href="view_doctor.jsp"> <i class="fas fa-user-md me-1"></i>
						View Doctor
				</a></li>

				<li class="nav-item"><a class="nav-link active px-3"
					href="patient.jsp"> <i class="fas fa-procedures me-1"></i>
						Patients
				</a></li>

			</ul>

			<!-- Admin Dropdown -->
			<div class="dropdown">
				<button class="btn btn-light dropdown-toggle fw-semibold"
					type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fas fa-user-shield me-1"></i> Admin
				</button>
				<ul class="dropdown-menu dropdown-menu-end shadow-sm"
					aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="../adminlogout"> 
						<i class="fas fa-sign-out-alt me-2"></i> Logout
					</a></li>
				</ul>
			</div>

		</div>
	</div>
</nav>
