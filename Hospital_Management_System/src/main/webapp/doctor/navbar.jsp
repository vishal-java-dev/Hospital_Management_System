<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  .navbar-custom {
    background: linear-gradient(135deg, #198754, #157347);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  }

  .navbar-custom .nav-link {
    color: #fff !important;
    font-weight: 500;
    transition: all 0.3s ease;
  }

  .navbar-custom .nav-link:hover {
    color: #ffe082 !important;
    transform: translateY(-1px);
  }

  .dropdown-menu a.dropdown-item {
    transition: all 0.2s ease;
  }

  .dropdown-menu a.dropdown-item:hover {
    background-color: #f1f1f1;
    color: #198754;
    font-weight: 500;
  }

  .profile-btn {
    border-radius: 50px;
    padding: 8px 16px;
    font-weight: 600;
  }

  .profile-btn:hover {
    background-color: #e2e6ea;
  }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
  <div class="container-fluid">
    <!-- Logo -->
    <a class="navbar-brand fw-bold fs-4" href="index.jsp">
      <i class="fas fa-clinic-medical me-2"></i> Medi Home
    </a>

    <!-- Toggler for mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Links & Profile -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-3">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp">
            <i class="fas fa-home me-1"></i> Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="patient.jsp">
            <i class="fas fa-user-injured me-1"></i> Patients
          </a>
        </li>
      </ul>

      <!-- Profile Dropdown -->
      <div class="dropdown">
        <button class="btn btn-light dropdown-toggle profile-btn d-flex align-items-center"
          type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
          <i class="fa-solid fa-user-doctor me-2"></i>
          ${docObj.fullname}
        </button>
        <ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="dropdownMenuButton1">
          <li>
            <a class="dropdown-item" href="edit_profile.jsp">
              <i class="fas fa-user-edit me-2"></i> Edit Profile
            </a>
          </li>
          <li>
            <a class="dropdown-item text-danger" href="../doctorLogout">
              <i class="fas fa-sign-out-alt me-2"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>
