<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Layout.jsp" %>
<div class="remaining-width">
	<!-- AllCourses Header -->
    <div class="container-fluid p-0 mb-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h2 class="fw-bold mb-0 darkBlueText heading-1">View Another Course!</h2>
                <p class="text-muted">Here's what's happening with your learning</p>
            </div>
        </div>
    </div>
	<div class="container-fluid pb-3 mb-5">
		<div class="row">
			<div class="col">
				<!-- Continue Learning Section -->
				<div class="card border-0 shadow-sm mb-4 border-radius-15">
					<div class="card-body">
						<div class="d-flex justify-content-between align-items-center mb-3">
							<h5 class="fw-bold mb-0 darkBlueText heading-3">Most Likely Course</h5>
							<!-- <a href="MyCourse.jsp" class="text-primary">View All</a> -->
						</div>
						<div class="swiper mySwiper1">
							<div class="swiper-wrapper">
								<!-- Course Card 1 -->
								<div class="swiper-slide">
									<div class="card h-100 border-1 shadow-sm">
										<!-- Thumbnail + Tag -->
										<div class="position-relative">
											<img src="../Assets/Images/courseImg2.png" class="card-img-top"
												alt="React Course">
										</div>
										<div class="card-body px-3 pb-3">
											<!-- Title -->
											<h5 class="card-title fw-bold mb-2" style="font-size: 1.25rem;">Advanced
												React Patterns</h5>
											<!-- Instructor -->
											<div class="d-flex align-items-center mb-2">
											  	<i class="bi bi-person-fill text-secondary me-1" style="font-size: 1rem;"></i>
												<span 
													class="text-primary fw-medium text-truncate d-inline-block" 
												    style="font-size: 1rem; max-width: 180px;"
												    data-bs-toggle="tooltip" 
												    data-bs-placement="top"
												    title="Ethan Ethan Ethan Ethan Ethan Johnson"
												>
												    Ethan Ethan Ethan Ethan Ethan Johnson
												</span>
											</div>
											<!-- Description -->
											<p class="card-text text-muted mb-3 small">
												Master advanced React concepts and patterns Master advanced React concepts Master advanced React 
											</p>
											<!-- Difficulty -->
											<div class="mb-3">
												<span class="badge bg-warning text-dark fw-medium py-2"
													style="font-size: 0.85rem;">
													<i class="bi bi-speedometer2 me-1"></i> INTERMEDIATE
												</span>
											</div>
											<!-- Not Enrolled Warning -->
											<div class="d-flex justify-content-between align-items-center mb-3">
												<span class="text-danger fw-medium" style="font-size: 0.95rem;">
													<i class="bi bi-lock-fill me-1"></i> NOT ENROLLED
												</span>
											</div>
											<!-- Dual Buttons -->
											<div class="d-flex justify-content-between pt-2 border-top">
												<!-- View Details Button (Secondary) -->
												<button class="btn btn-outline-secondary btn-sm me-2 flex-grow-1">
													View Details
												</button>
												<!-- Enroll Button (Primary) -->
												<button class="btn btn-success btn-sm flex-grow-1">
													Enroll Now
												</button>
											</div>
										</div>
									</div>
								</div>
	
								<!-- Course Card 2 -->
								<div class="swiper-slide">
									<div class="card h-100 border-1 shadow-sm">
										<!-- Thumbnail + Tag -->
										<div class="position-relative">
											<img src="../Assets/Images/courseImg2.png" class="card-img-top"
												alt="React Course">
										</div>
										<div class="card-body px-3 pb-3">
											<!-- Title -->
											<h5 class="card-title fw-bold mb-2" style="font-size: 1.25rem;">Advanced
												React Patterns</h5>
											<!-- Instructor -->
											<div class="d-flex align-items-center mb-2">
												<i class="bi bi-person-fill text-secondary me-1"
													style="font-size: 1rem;"></i>
												<span class="text-primary fw-medium" style="font-size: 1rem;">Ethan
													Johnson</span>
											</div>
											<!-- Description -->
											<p class="card-text text-muted mb-3 small">
												Master advanced React concepts like Hooks, Context API, and performance
												optimization.
											</p>
											<!-- Difficulty -->
											<div class="mb-3">
												<span class="badge bg-warning text-dark fw-medium py-2"
													style="font-size: 0.85rem;">
													<i class="bi bi-speedometer2 me-1"></i> INTERMEDIATE
												</span>
											</div>
											<!-- Not Enrolled Warning -->
											<div class="d-flex justify-content-between align-items-center mb-3">
												<span class="text-danger fw-medium" style="font-size: 0.95rem;">
													<i class="bi bi-lock-fill me-1"></i> NOT ENROLLED
												</span>
											</div>
											<!-- Dual Buttons -->
											<div class="d-flex justify-content-between pt-2 border-top">
												<!-- View Details Button (Secondary) -->
												<button class="btn btn-outline-secondary btn-sm me-2 flex-grow-1">
													View Details
												</button>
												<!-- Enroll Button (Primary) -->
												<button class="btn btn-success btn-sm flex-grow-1">
													Enroll Now
												</button>
											</div>
										</div>
									</div>
								</div>
	
								<!-- Course Card 3 -->
								<div class="swiper-slide">
									<div class="card h-100 border-1 shadow-sm">
										<!-- Thumbnail + Tag -->
										<div class="position-relative">
											<img src="../Assets/Images/courseImg2.png" class="card-img-top"
												alt="React Course">
										</div>
										<div class="card-body px-3 pb-3">
											<!-- Title -->
											<h5 class="card-title fw-bold mb-2" style="font-size: 1.25rem;">Advanced
												React Patterns</h5>
											<!-- Instructor -->
											<div class="d-flex align-items-center mb-2">
												<i class="bi bi-person-fill text-secondary me-1"
													style="font-size: 1rem;"></i>
												<span class="text-primary fw-medium" style="font-size: 1rem;">Ethan
													Johnson</span>
											</div>
											<!-- Description -->
											<p class="card-text text-muted mb-3 small">
												Master advanced React concepts like Hooks, Context API, and performance
												optimization.
											</p>
											<!-- Difficulty -->
											<div class="mb-3">
												<span class="badge bg-warning text-dark fw-medium py-2"
													style="font-size: 0.85rem;">
													<i class="bi bi-speedometer2 me-1"></i> INTERMEDIATE
												</span>
											</div>
											<!-- Not Enrolled Warning -->
											<div class="d-flex justify-content-between align-items-center mb-3">
												<span class="text-danger fw-medium" style="font-size: 0.95rem;">
													<i class="bi bi-lock-fill me-1"></i> NOT ENROLLED
												</span>
											</div>
											<!-- Dual Buttons -->
											<div class="d-flex justify-content-between pt-2 border-top">
												<!-- View Details Button (Secondary) -->
												<button class="btn btn-outline-secondary btn-sm me-2 flex-grow-1">
													View Details
												</button>
												<!-- Enroll Button (Primary) -->
												<button class="btn btn-success btn-sm flex-grow-1">
													Enroll Now
												</button>
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
			</div>
		</div>
	</div>
</div>
<%@ include file="Footer.jsp" %>