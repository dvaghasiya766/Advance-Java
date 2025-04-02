<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
		<div class="remaining-width pb-5">
            <!-- Dashboard Header -->
            <div class="container-fluid p-0 mb-4">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h2 class="fw-bold mb-0 darkBlueText heading-1">Welcome Back, Alex!</h2>
                        <p class="text-muted">Here's what's happening with your learning today</p>
                    </div>
                    <div class="col-md-6 d-flex justify-content-md-end">
                        <div class="input-group" style="max-width: 300px;">
                            <input type="text" class="form-control border-end-0" placeholder="Search courses...">
                            <span class="input-group-text bg-white border-start-0">
                                <i class="bi bi-search"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                    <div class="card border-0 shadow-sm h-100 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="card-subtitle text-muted">Active Courses</h6>
                                    <h3 class="fw-bold mt-2 darkBlueText">4</h3>
                                </div>
                                <div class="bg-primary bg-opacity-10 DashboardCard rounded-circle">
                                    <i class="bi bi-book text-primary heading-3"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                    <div class="card border-0 shadow-sm h-100 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="card-subtitle text-muted">Hours Learned</h6>
                                    <h3 class="fw-bold mt-2 darkBlueText">28</h3>
                                </div>
                                <div class="bg-success bg-opacity-10 DashboardCard rounded-circle">
                                    <i class="bi bi-clock-history text-success heading-3"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-3 mb-md-0">
                    <div class="card border-0 shadow-sm h-100 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="card-subtitle text-muted">Assignments Due</h6>
                                    <h3 class="fw-bold mt-2 darkBlueText">2</h3>
                                </div>
                                <div class="bg-warning bg-opacity-10 DashboardCard rounded-circle">
                                    <i class="bi bi-journal-check text-warning heading-3"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm h-100 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="card-subtitle text-muted">Certificates</h6>
                                    <h3 class="fw-bold mt-2 darkBlueText">3</h3>
                                </div>
                                <div class="bg-danger bg-opacity-10 DashboardCard rounded-circle">
                                    <i class="bi bi-award text-danger heading-3"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main Content -->
            <div class="row mb-5">
                <!-- Left Column -->
                <div class="col-lg-8">
                    <!-- Continue Learning Section -->
                    <div class="card border-0 shadow-sm mb-4 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="fw-bold mb-0 darkBlueText heading-3">Continue Learning</h5>
                                <!-- <a href="MyCourse.jsp" class="text-primary">View All</a> -->
                            </div>
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <!-- Course Card 1 -->
                                    <div class="swiper-slide">
                                        <div class="card h-100">
                                            <img src="../Assets/Images/courseImg2.png" class="card-img-top"
                                                alt="React Course" class="cardImg">
                                            <div class="card-body px-2 pb-2">
                                                <h6 class="card-title fw-bold">Advanced React Patterns</h6>
                                                <p class="card-text small text-muted">Master advanced React concepts and
                                                    patterns</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="progress w-100 me-3" style="height: 6px;">
                                                        <div class="progress-bar PrgressbarBG" role="progressbar"
                                                            style="width: 65%;" aria-valuenow="65" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                    <small class="text-muted">65%</small>
                                                </div>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <small class="text-muted">12/18 lessons</small>
                                                    <button class="btn btn-custom-primary">Continue</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Course Card 2 -->
                                    <div class="swiper-slide">
                                        <div class="card h-100">
                                            <img src="../Assets/Images/courseImg4.png" class="card-img-top"
                                                alt="React Course" class="cardImg">
                                            <div class="card-body px-2 pb-2">
                                                <h6 class="card-title fw-bold">Advanced React Patterns</h6>
                                                <p class="card-text small text-muted">Master advanced React concepts and
                                                    patterns</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="progress w-100 me-3" style="height: 6px;">
                                                        <div class="progress-bar PrgressbarBG" role="progressbar"
                                                            style="width: 65%;" aria-valuenow="65" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                    <small class="text-muted">65%</small>
                                                </div>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <small class="text-muted">12/18 lessons</small>
                                                    <button class="btn btn-custom-primary">Continue</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Course Card 3 -->
                                    <div class="swiper-slide">
                                        <div class="card h-100">
                                            <img src="../Assets/Images/courseImg3.png" class="card-img-top"
                                                alt="React Course" class="cardImg">
                                            <div class="card-body px-2 pb-2">
                                                <h6 class="card-title fw-bold">Advanced React Patterns</h6>
                                                <p class="card-text small text-muted">Master advanced React concepts and
                                                    patterns</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="progress w-100 me-3" style="height: 6px;">
                                                        <div class="progress-bar PrgressbarBG" role="progressbar"
                                                            style="width: 65%;" aria-valuenow="65" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                    <small class="text-muted">65%</small>
                                                </div>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <small class="text-muted">12/18 lessons</small>
                                                    <button class="btn btn-custom-primary">Continue</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Upcoming Assignments -->
                    <div class="card border-0 shadow-sm mb-4 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="fw-bold mb-0 darkBlueText heading-3">Upcoming Assignments</h5>
                                <!-- <a href="Assignments.jsp" class="text-primary">View All</a> -->
                            </div>

                            <div class="list-group list-group-flush">
                                <!-- Assignment 1 -->
                                <div class="list-group-item border-0 px-0 py-3">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <div class="d-flex align-items-center mb-1">
                                                <span class="badge bg-warning bg-opacity-10 text-warning me-2">Due
                                                    Soon</span>
                                                <small class="text-muted">Due: Tomorrow, 11:59 PM</small>
                                            </div>
                                            <h6 class="fw-bold mb-1">React Component Library</h6>
                                            <p class="small text-muted mb-2">Advanced React Patterns - Project 2</p>
                                        </div>
                                        <button class="btn btn-custom-primary bg-success">Submit</button>
                                    </div>
                                </div>

                                <!-- Assignment 2 -->
                                <div class="list-group-item border-0 px-0 py-3">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <div class="d-flex align-items-center mb-1">
                                                <span
                                                    class="badge bg-danger bg-opacity-10 text-danger me-2">Urgent</span>
                                                <small class="text-muted">Due: Friday, 11:59 PM</small>
                                            </div>
                                            <h6 class="fw-bold mb-1">REST API Implementation</h6>
                                            <p class="small text-muted mb-2">Node.js Fundamentals - Module 4</p>
                                        </div>
                                        <button class="btn btn-custom-primary bg-success">Submit</button>
                                    </div>
                                </div>

                                <!-- Assignment 3 -->
                                <div class="list-group-item border-0 px-0 py-3">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <div class="d-flex align-items-center mb-1">
                                                <span class="badge bg-info bg-opacity-10 text-info me-2">Upcoming</span>
                                                <small class="text-muted">Due: Next Monday, 11:59 PM</small>
                                            </div>
                                            <h6 class="fw-bold mb-1">Data Visualization</h6>
                                            <p class="small text-muted mb-2">Python for Data Science - Week 2</p>
                                        </div>
                                        <button class="btn btn-custom-primary">Start</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Right Column -->
                <div class="col-lg-4">
                    <!-- Recommended Courses -->
                    <div class="card border-0 shadow-sm mb-4 border-radius-15">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="fw-bold mb-0 darkBlueText heading-3">Recommended For You</h5>
                                <!-- <a href="AllCourses.jsp" class="text-primary">View All</a> -->
                            </div>

                            <div class="list-group list-group-flush">
                                <!-- Course 1 -->
                                <a href="#" class="list-group-item list-group-item-action border-0 px-0 py-2">
                                    <div class="d-flex align-items-center">
                                        <img src="../Assets/Images/courseImg2.png" class="rounded me-3" width="60"
                                            height="60" alt="JavaScript Course" style="object-fit: cover;">
                                        <div>
                                            <h6 class="fw-bold mb-0">JavaScript Mastery</h6>
                                            <small class="text-muted">Beginner to Advanced</small>
                                            <div class="d-flex align-items-center mt-1">
                                                <span
                                                    class="badge bg-success bg-opacity-10 text-success small">Popular</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Course 2 -->
                                <a href="#" class="list-group-item list-group-item-action border-0 px-0 py-2">
                                    <div class="d-flex align-items-center">
                                        <img src="../Assets/Images/courseImg3.png" class="rounded me-3" width="60"
                                            height="60" alt="Database Course" style="object-fit: cover;">
                                        <div>
                                            <h6 class="fw-bold mb-0">Database Design</h6>
                                            <small class="text-muted">SQL & NoSQL</small>
                                            <div class="d-flex align-items-center mt-1">
                                                <span
                                                    class="badge bg-primary bg-opacity-10 text-primary small">New</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Course 3 -->
                                <a href="#" class="list-group-item list-group-item-action border-0 px-0 py-2">
                                    <div class="d-flex align-items-center">
                                        <img src="../Assets/Images/courseImg4.png" class="rounded me-3" width="60"
                                            height="60" alt="Cloud Course" style="object-fit: cover;">
                                        <div>
                                            <h6 class="fw-bold mb-0">Cloud Computing</h6>
                                            <small class="text-muted">AWS & Azure</small>
                                            <div class="d-flex align-items-center mt-1">
                                                <span
                                                    class="badge bg-warning bg-opacity-10 text-warning small">Trending</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
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

</body>

</html>