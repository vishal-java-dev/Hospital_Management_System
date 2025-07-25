<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome to Medi Homes</title>
  <%@ include file="components/allCss.jsp" %>
  <style>
    .paint-card {
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      border-radius: 12px;
      transition: transform 0.3s ease;
    }

    .paint-card:hover {
      transform: translateY(-5px);
    }

    .carousel-inner img {
      height: 550px;
      object-fit: cover;
    }

    .section-title {
      font-weight: bold;
      font-size: 2.2rem;
      margin-bottom: 30px;
    }

    .team-img {
      height: 300px;
      width: 250px;
      object-fit: cover;
      border-radius: 10px;
    }

    .img-fluid-custom {
      height: 100%;
      object-fit: cover;
      border-radius: 12px;
    }

    .feature-icon {
      font-size: 1.5rem;
      color: #28a745;
      margin-right: 10px;
    }

    hr {
      border-top: 2px solid #28a745;
      width: 50%;
      margin: 40px auto;
    }
  </style>
</head>
<body>

<%@ include file="components/navBar.jsp" %>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://images.pexels.com/photos/8460036/pexels-photo-8460036.jpeg" class="d-block w-100" alt="Hospital Doctors">
    </div>
    <div class="carousel-item">
      <img src="https://images.pexels.com/photos/7580258/pexels-photo-7580258.jpeg" class="d-block w-100" alt="Nurses in hospital">
    </div>
    <div class="carousel-item">
      <img src="https://images.pexels.com/photos/5327580/pexels-photo-5327580.jpeg" class="d-block w-100" alt="Modern Hospital">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Features -->
<div class="container py-5">
  <p class="text-center section-title text-success">Why Choose Medi Homes?</p>
  <div class="row align-items-stretch">
    <div class="col-md-8">
      <div class="row g-3">
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5 fw-bold"><i class="fas fa-shield-alt feature-icon"></i>Patient Safety</p>
              <p>We follow world-class safety protocols and infection control to keep you protected at all times.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5 fw-bold"><i class="fas fa-hospital feature-icon"></i>Clean Facilities</p>
              <p>Our hospital maintains the highest hygiene and sterilization standards in every department.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5 fw-bold"><i class="fas fa-vials feature-icon"></i>Cutting-edge Research</p>
              <p>We actively pursue medical innovation to improve treatments and patient outcomes every day.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card paint-card h-100">
            <div class="card-body">
              <p class="fs-5 fw-bold"><i class="fas fa-user-md feature-icon"></i>Compassionate Doctors</p>
              <p>Our certified specialists treat you with expertise, empathy, and personalized attention.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Image Section -->
    <div class="col-md-4 d-flex align-items-center">
      <img src="https://images.pexels.com/photos/8376174/pexels-photo-8376174.jpeg" alt="Smiling doctor" class="img-fluid-custom w-100">
    </div>
  </div>
</div>

<hr>

<!-- Our Team -->
<div class="container py-4">
  <p class="text-center section-title text-primary">Meet Our Expert Team</p>
  <div class="row justify-content-center">
  
    <div class="col-md-3 mb-4">
      <div class="card paint-card text-center h-100">
        <div class="card-body d-flex flex-column align-items-center">
          <img src="https://images.pexels.com/photos/8460157/pexels-photo-8460157.jpeg"
               alt="CEO" class="team-img mb-3">
          <h5 class="fw-bold">Dr. Samuani Simi</h5>
          <p class="text-muted">(CEO & Chairperson)</p>
        </div>
      </div>
    </div>

    <div class="col-md-3 mb-4">
      <div class="card paint-card text-center h-100">
        <div class="card-body d-flex flex-column align-items-center">
          <img src="https://images.pexels.com/photos/5452201/pexels-photo-5452201.jpeg"
               alt="Head of Research" class="team-img mb-3">
          <h5 class="fw-bold">Dr. Anjali Rao</h5>
          <p class="text-muted">(Head of Research)</p>
        </div>
      </div>
    </div>

    <div class="col-md-3 mb-4">
      <div class="card paint-card text-center h-100">
        <div class="card-body d-flex flex-column align-items-center">
          <img src="https://images.pexels.com/photos/8376175/pexels-photo-8376175.jpeg"
               alt="Chief Surgeon" class="team-img mb-3">
          <h5 class="fw-bold">Dr. Priya Sharma</h5>
          <p class="text-muted">(Chief Surgeon)</p>
        </div>
      </div>
    </div>

    <div class="col-md-3 mb-4">
      <div class="card paint-card text-center h-100">
        <div class="card-body d-flex flex-column align-items-center">
          <img src="https://images.pexels.com/photos/1170979/pexels-photo-1170979.jpeg"
               alt="Cardiologist" class="team-img mb-3">
          <h5 class="fw-bold">Dr. Vivek Mehta</h5>
          <p class="text-muted">(Cardiologist)</p>
        </div>
      </div>
    </div>

  </div>
</div>


<%@ include file="components/footer.jsp" %>
</body>
</html>
