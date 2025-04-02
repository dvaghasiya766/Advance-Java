<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<!-- Hero Section -->
<div class="remaining-width pb-5">
            <!-- Profile Header Section -->
            <div class="container-fluid p-0 mb-4">
                <div class="row align-items-center">
                    <div class="col-10">
                        <h2 class="fw-bold m-0 darkBlueText heading-1">My Profile</h2>
                    </div>
                    <div class="col-2 d-flex justify-content-end">
                        <button class="btn btn-danger d-flex" onclick="redirectBack()">
                            <p class="me-2 mb-0">LogOut</p>
                            <img src="../Assets/Images/Sign_out_squre@3x.png" height="20px" alt="">
                        </button>
                    </div>
                </div>
            </div>
            <!-- Profile Content -->
            <div class="container-fluid mb-3">
                <div class="row mb-5">
                    <!-- Left Column - Profile Info -->
                    <div class="col-lg-4 col-md-5 p-0 p-md-2 mb-3">
                        <div class="card shadow-sm border-0 border-radius-15">
                            <div class="card-body text-center p-4">
                                <!-- Profile Picture -->
                                <div class="position-relative d-inline-block mb-3">
                                    <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle"
                                        width="150" height="150" alt="Profile" id="profileImage">
                                    <!-- <button class="btn btn-sm ClickBG position-absolute bottom-0 end-0 rounded-circle"
                                        style="width: 40px; height: 40px;">
                                        <i class="bi bi-camera-fill" style="color: #1B5A7A; font-size: 20px;"></i>
                                    </button> -->
                                </div>

                                <!-- User Info -->
                                <h4 class="fw-bold mb-1" id="userName">Alex Johnson</h4>
                                <p class="text-muted mb-3" id="userEmail">alex.johnson@example.com</p>

                                <!-- Progress Bar -->
                                <div class="mb-3">
                                    <div class="d-flex justify-content-between mb-1">
                                        <span class="small">Course Progress</span>
                                        <span class="" id="progressPercent">65%</span>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar PrgressbarBG" role="progressbar" style="width: 65%;"
                                            aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <!-- Stats -->
                                <div class="d-flex justify-content-around text-center mb-3">
                                    <div>
                                        <h5 class="fw-bold mb-0" id="coursesCount">12</h5>
                                        <small class="text-muted">Courses</small>
                                    </div>
                                    <div>
                                        <h5 class="fw-bold mb-0" id="completedCount">8</h5>
                                        <small class="text-muted">Completed</small>
                                    </div>
                                    <div>
                                        <h5 class="fw-bold mb-0" id="certificatesCount">5</h5>
                                        <small class="text-muted">Certificates</small>
                                    </div>
                                </div>

                                <!-- Edit Button -->
                                <!-- Then use the class instead of inline style -->
                                <button class="btn btn-custom-primary w-100 rounded-pill" onclick="editProfile()">
                                    <i class="bi bi-pencil-square me-2"></i>Edit Profile
                                </button>
                            </div>
                        </div>

                        <!-- Quick Links -->
                        <div class="card shadow-sm border-0 mt-4 border-radius-15">
                            <div class="card-body p-3">
                                <h6 class="fw-bold mb-3 darkBlueText heading-3">Quick Links</h6>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                        <i class="bi bi-gear-fill me-3 darkBlueText"></i>
                                        <span>Account Settings</span>
                                    </li>
                                    <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                        <i class="bi bi-shield-lock-fill me-3 darkBlueText"></i>
                                        <span>Privacy & Security</span>
                                    </li>
                                    <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                        <i class="bi bi-bell-fill me-3 darkBlueText"></i>
                                        <span>Notification Settings</span>
                                    </li>
                                    <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                        <i class="bi bi-question-circle-fill me-3 darkBlueText"></i>
                                        <span>Help Center</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Right Column - Detailed Info -->
                    <div class="col-lg-8 col-md-7 p-0 p-md-2">
                        <!-- Personal Information Card -->
                        <div class="card shadow-sm border-0 mb-4 border-radius-15">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="fw-bold mb-0 darkBlueText heading-3">Personal Information</h5>
                                    <!-- <button class="btn btn-sm btn-outline-primary" onclick="editPersonalInfo()">
                                        <i class="bi bi-pencil-square me-1"></i>Edit
                                    </button> -->
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Full Name</label>
                                        <p class="mb-0 fw-medium" id="fullName">Alex Johnson</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Date of Birth</label>
                                        <p class="mb-0 fw-medium" id="dob">March 15, 1990</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Email</label>
                                        <p class="mb-0 fw-medium" id="email">alex.johnson@example.com</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Phone</label>
                                        <p class="mb-0 fw-medium" id="phone">+1 (555) 123-4567</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Country</label>
                                        <p class="mb-0 fw-medium" id="country">United States</p>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-muted small mb-1">Join Date</label>
                                        <p class="mb-0 fw-medium" id="joinDate">January 2023</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Education & Skills Card -->
                        <div class="card shadow-sm border-0 mb-4 border-radius-15">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="fw-bold mb-0 darkBlueText heading-3">Education & Skills</h5>
                                    <!-- <button class="btn btn-sm btn-outline-primary" onclick="editEducation()">
                                        <i class="bi bi-pencil-square me-1"></i>Edit
                                    </button> -->
                                </div>

                                <div class="mb-4">
                                    <label class="form-label text-muted small mb-1">Education</label>
                                    <p class="mb-0 fw-medium" id="education">Master's in Computer Science, Stanford
                                        University
                                    </p>
                                </div>

                                <div>
                                    <label class="form-label text-muted small mb-1">Skills</label>
                                    <div class="d-flex flex-wrap gap-2" id="skillsContainer">
                                        <span
                                            class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">JavaScript</span>
                                        <span
                                            class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">React</span>
                                        <span
                                            class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Node.js</span>
                                        <span
                                            class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Python</span>
                                        <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Data
                                            Science</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Activity Card -->
                        <div class="card shadow-sm border-0 border-radius-15">
                            <div class="card-body p-0">
                                <h5 class="fw-bold mb-3 darkBlueText heading-3 ps-4 pt-4">Recent Activity</h5>
                                <div class="timeline">
                                    <div class="timeline-item mb-0">
                                        <div class="timeline-badge bg-success"></div>
                                        <div class="timeline-content">
                                            <small class="text-muted DateTime">Today, 10:45 AM</small>
                                            <p class="mb-0 fw-medium">Completed "Advanced React Patterns" course</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-0">
                                        <div class="timeline-badge bg-info"></div>
                                        <div class="timeline-content">
                                            <small class="text-muted DateTime">Yesterday, 3:30 PM</small>
                                            <p class="mb-0 fw-medium">Submitted assignment for "Node.js Fundamentals"
                                            </p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-0">
                                        <div class="timeline-badge bg-warning"></div>
                                        <div class="timeline-content">
                                            <small class="text-muted DateTime">2 days ago</small>
                                            <p class="mb-0 fw-medium">Started new course "Python for Data Science"</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-0">
                                        <div class="timeline-badge bg-primary"></div>
                                        <div class="timeline-content">
                                            <small class="text-muted DateTime">5 days ago</small>
                                            <p class="mb-0 fw-medium">Earned certificate in "JavaScript Mastery"</p>
                                        </div>
                                    </div>
                                </div>
                                <button class="ActivityBtn p-4">
                                    View All Activity
                                    <i class="bi bi-arrow-right ms-2"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>