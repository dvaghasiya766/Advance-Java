<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="NewLayout.jsp" %>
    <div class="container my-4">
        <div class="row mb-5">
            <!-- Left Column - Profile Info -->
            <div class="col-lg-4 col-md-5 p-0 p-md-2 mb-3">
                <div class="card shadow-sm border-0 border-radius-15">
                    <div class="card-body text-center p-4">
                        <!-- Profile Picture -->
                        <div class="position-relative d-inline-block mb-3">
                            <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle" width="150"
                                height="150" alt="Profile" id="profileImage">
                        </div>

                        <!-- User Info -->
                        <h4 class="fw-bold mb-1" id="userName">Alex Johnson</h4>
                        <p class="text-muted mb-0" id="userEmail">alex.johnson@example.com</p>
                        <p class="text-muted mb-3 fw-bold" id="userEmail">Instructor</p>
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
                                <label class="form-label text-muted small mb-1">Email</label>
                                <p class="mb-0 fw-medium" id="email">alex.johnson@example.com</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-muted small mb-1">Country</label>
                                <p class="mb-0 fw-medium" id="country">India</p>
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
                                <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">React</span>
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
            </div>
        </div>
    </div>
</body>

</html>