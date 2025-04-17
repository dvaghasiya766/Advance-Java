<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="NewLayout.jsp" %>
    <div class="container-fluid setCourseBackground d-flex flex-column justify-content-start align-items-end text-center p-0"
        style="border-color: #233A6C; background-image: url('../Assets/Images/CH.png'), radial-gradient(#1f1f1fb5, #0d0d0ddb);">
    </div>
    <div class="CourseNavContainer px-5">
        <button class="ActiveCourseNavContainer" type="button" onclick="changetTab('all');" id="all"
            style="border-color: #233A6C; color:#233A6C;">All</button>
        <button class="CourseNavItem" type="button" onclick="changetTab('assignments');" id="assignments"
            style="border-color: #233A6C;">Tasks</button>
    </div>
    <div class="container mt-4 mb-5">
        <div class="" id="allContainer">
            <!-- Module 1 -->
            <div class="module-card" style="border-color: #233A6C;">
                <div class="module-header">
                    <h5 class="m-0">Module 1: Visual Design Elements</h5>
                </div>
                <div class="module-content">
                    <!-- Topics would be listed here similarly -->
                    <!-- Topic 1 -->
                    <div class="topic-item">
                        <i class="bi bi-youtube topic-icon" style="color: #233A6C;"></i>
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Lecture | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="" method="get">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>

                    <!-- Topic 2 -->
                    <div class="topic-item">
                        <i class="bi bi-clipboard2-data topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-file-text topic-icon"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">CheetSheet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>

                    <!-- Topic 3 -->
                    <div class="topic-item">
                        <i class="bi bi-file-text topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-person-video ms-1 me-3"  style="color: #233A6C;"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>

                    <!-- Topic 4 -->
                    <div class="topic-item">
                        <i class="bi bi-link-45deg topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-file-text topic-icon" style="color: #233A6C;"></i> -->
                        <!-- <i class="bi bi-person-video ms-1 me-3"  style="color: #233A6C;"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Module 2 -->
            <div class="module-card" style="border-color: #233A6C;">
                <div class="module-header">
                    <h5 class="m-0">Module 1: Visual Design Elements</h5>
                </div>
                <div class="module-content">
                    <!-- Topics would be listed here similarly -->
                    <!-- Topic 1 -->
                    <div class="topic-item">
                        <i class="bi bi-youtube topic-icon" style="color: #233A6C;"></i>
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Lecture | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="" method="get">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>
            
                    <!-- Topic 2 -->
                    <div class="topic-item">
                        <i class="bi bi-clipboard2-data topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-file-text topic-icon"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">CheetSheet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>
            
                    <!-- Topic 3 -->
                    <div class="topic-item">
                        <i class="bi bi-file-text topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-person-video ms-1 me-3"  style="color: #233A6C;"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>
            
                    <!-- Topic 4 -->
                    <div class="topic-item">
                        <i class="bi bi-link-45deg topic-icon" style="color: #233A6C;"></i>
                        <!-- <i class="bi bi-file-text topic-icon" style="color: #233A6C;"></i> -->
                        <!-- <i class="bi bi-person-video ms-1 me-3"  style="color: #233A6C;"></i> -->
                        <div class="flex-grow-1 me-auto">
                            <h6 class="mb-1 text-truncate">Look opposite of competition</h6>
                            <p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i>
                                5 Min</p>
                        </div>
                        <form action="">
                            <button type="button" class="btn"><img src="../Assets/Images/Expand_right.png" height="35px"
                                    alt=""></button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Module 2 -->
            <div class="module-card" style="border-color: #233A6C;">
                <div class="module-header">
                    <h5 class="m-0">Module 2: Visual Design Elements</h5>
                </div>
                <div class="module-content">
                    <!-- Topics would be listed here similarly -->
                    <!-- Topic 1 -->
                    <div class="topic-item">
                        <i class="bi bi-file-text topic-icon"></i>
                        <div class="flex-grow-1">
                            <h6 class="mb-1">Look opposite of competition</h6>
                            <p class="small text-muted mb-1">Version 2 | Last updated: 28-Aug-20</p>
                            <div class="d-flex">
                                <a href="#" class="btn btn-sm btn-outline-custom me-2">
                                    <i class="bi bi-eye"></i> View Cheatsheet
                                </a>
                                <!-- <a href="#" class="btn btn-sm btn-outline-secondary">
                                    <i class="bi bi-download"></i> Download PDF
                                </a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-none" id="assignmentsContainer">
            <div class="customBorderedBox border rounded p-3 mb-3">
                <div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
                    <!-- Content -->
                    <div class="flex-grow-1 w-100">
                        <div class="d-flex flex-wrap align-items-center">
                            <span class="badge pending-bg pending-txt me-2">Pending</span>
                            <small class="text-muted DateTime">Due: Today, 10:45 AM</small>
                        </div>
                        <p class="mb-0 large text-truncate">React Component Library</p>
                        <p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
                    </div>
                    <!-- Button -->
                    <form action="" class="mt-1 mt-md-0 ms-md-3">
                        <input type="hidden" name="courseId" value="1" />
                        <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button>
                        <!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
                    </form>
                </div>
            </div>
            <div class="customBorderedBox border rounded p-3 mb-3">
                <div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
                    <!-- Content -->
                    <div class="flex-grow-1 w-100">
                        <div class="d-flex flex-wrap align-items-center">
                            <span class="badge missed-bg missed-txt me-2">Missed</span>
                            <small class="text-muted DateTime">Due: Today, 10:45 AM</small>
                        </div>
                        <p class="mb-0 large text-truncate">React Component Library</p>
                        <p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
                    </div>
                    <!-- Button -->
                    <form action="" class="mt-1 mt-md-0 ms-md-3">
                        <input type="hidden" name="courseId" value="1" />
                        <button type="submit" class="not-allowed btn btn-danger w-100 w-md-auto">Missed </button>
                        <!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
                    </form>
                </div>
            </div>
            <div class="customBorderedBox border rounded p-3 mb-3">
                <div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
                    <!-- Content -->
                    <div class="flex-grow-1 w-100">
                        <div class="d-flex flex-wrap align-items-center">
                            <span class="badge completed-bg completed-txt me-2">Completed</span>
                            <small class="text-muted DateTime">Due: Today, 10:45 AM</small>
                        </div>
                        <p class="mb-0 large text-truncate">React Component Library</p>
                        <p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
                    </div>
                    <!-- Button -->
                    <form action="" class="mt-1 mt-md-0 ms-md-3">
                        <input type="hidden" name="courseId" value="1" />
                        <button type="submit" class="btn btn-success w-100 w-md-auto">View</button>
                        <!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        let all = document.getElementById('all');
        let allContainer = document.getElementById('allContainer');
        let assignments = document.getElementById('assignments');
        let assignmentsContainer = document.getElementById('assignmentsContainer');

        function changetTab(tab) {
            const isAll = tab === 'all';

            all.className = isAll ? "ActiveCourseNavContainer" : "CourseNavItem";
            assignments.className = isAll ? "CourseNavItem" : "ActiveCourseNavContainer";

            all.style.color = isAll ? "#233A6C" : "#333";
            assignments.style.color = isAll ? "#333" : "#233A6C";

            allContainer.classList.toggle("d-none", !isAll);
            assignmentsContainer.classList.toggle("d-none", isAll);
        }
        // Simple accordion functionality
        document.querySelectorAll('.module-header').forEach(header => {
            header.addEventListener('click', () => {
                const moduleCard = header.parentElement;
                moduleCard.classList.toggle('active-module');

                const content = moduleCard.querySelector('.module-content');
                if (moduleCard.classList.contains('active-module')) {
                    content.style.display = 'block';
                } else {
                    content.style.display = 'none';
                }
            });
        });
    </script>
</body>

</html>