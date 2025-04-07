<%@page import="NxtWave.Common.Hashing.SessionCookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="jakarta.servlet.http.Cookie"
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nxt Wave</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Set Icons -->
    <link rel="icon" type="image/png" href="Assets/Images/Logo 1001.png">
    <!-- Bootstrep CDN For CSS and Icons -->
    <link rel="stylesheet" href="Assets/Bootstrap/bootstrap.min.css">
    <script src="Assets/Bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- SwiperJS CSS -->
    <!-- <link rel="stylesheet" href="Assets/CSS/swiper-bundle.min.css"> -->
    <!-- SwiperJS JS -->
    <!-- <script src="Assets/JavaScript/swiper-bundle.min.js"></script> -->
    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/CSS/CustomCSS1001.css">
    <link rel="stylesheet" href="Assets/CSS/Index.css">
    <!-- External JS -->
    <!-- <script src="Assets/JavaScript/CustomJSProgram1001.js"></script> -->
</head>

<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light NavCustomBG" id="Home">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <img src="Assets/Images/Logo 1001.png" class="NavOLPlogo" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="CustomNavLink active" aria-current="page" href="#Home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="CustomNavLink" href="#Mentor">Mentors</a>
                    </li>
                    <li class="nav-item">
                        <a class="CustomNavLink" href="#Opprtunities">Opprtunities</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="CustomNavLink dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Connect with Us
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="CustomNavLink dropdown-item m-0" href="#LogIn">LogIn</a></li>
                            <li><a class="CustomNavLink dropdown-item m-0" href="#SignUp">Registration
                                    Request</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="CustomNavLink dropdown-item m-0" href="#Disscussion">Something else
                                    here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="CustomNavLink" href="#AboutUs">About Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <!-- Slides container -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide"><img src="Assets/Images/lpSlider1.png" alt=""></div>
            <div class="swiper-slide"><img src="Assets/Images/lpSlider2.png" alt=""></div>
            <div class="swiper-slide"><img src="Assets/Images/lpSlider3.png" alt=""></div>
            <div class="swiper-slide"><img src="Assets/Images/lpSlider6.png" alt=""></div>
        </div>
        <!-- Control BTN -->
        <div class="swiper-button-next navBtnSwiper"></div>
        <div class="swiper-button-prev navBtnSwiper"></div>
        <!-- Nav BTN -->
        <div class="swiper-pagination"></div>
    </div>
    <!-- Initialize Swiper -->
    <script>
    	const swiper1 = new Swiper(".mySwiper", {
    		loop: true,
    	  	grabCursor: "true",
    	  	autoplay: {
    	    	delay: 5000,
    	    	disableOnInteraction: false,
   	    	},
    		pagination: {
    	    	el: ".swiper-pagination",
    	    	// type: "progressbar",
	    	    clickable: true,
	    	    dynamicBullets: true,
    	  	},
    	  	navigation: {
	    	    nextEl: ".swiper-button-next",
	    	    prevEl: ".swiper-button-prev",
    	  	},
    	  	scrollbar: {
    	    	el: ".swiper-scrollbar",
    	  	},
   	  	});
    </script>
    <!-- Main Content -->
    <div class="lightBG autoShow">
        <div class="container py-md-5 py-3">
            <div class="large-display-row">
                <img class="HomeIMG mb-3 m-md-1"
                    src=" https://nxtwave.imgix.net/ccbp-website/intensive/landingpage/award1-mobile-3x.png" alt="">
                <img class="HomeIMG mb-3 m-md-1"
                    src="https://nxtwave.imgix.net/ccbp-website/intensive/landingpage/award2-desktop-2x.png" alt="">
            </div>
        </div>
    </div>
    <!-- Faculties Company -->
    <div class="lightBG" id="Mentor">
        <div class="container py-md-4 py-3">
            <h3 class="heading-1 darkText autoShow">Mentor Community</h3>
            <div class="description mb-5 autoShow">
                Our mentor community strongly believes in the power of sharing!
                <br>
                We collaborate with professionals from great companies to guide you on this exciting journey.
                <br>
            </div>
            <img class="img-fluid autoShow"
                src="https://nxtwave.imgix.net/ccbp-website/Home/Mentor+Community/mentor-community-companies.png"
                alt="">
        </div>
    </div>
    <!-- TeachSkills -->
    <div class="darkBlueBG" id="Champions">
        <div class="container py-md-5 py-3">
            <div class="py-3 d-flex flex-column flex-lg-row justify-content-center">
                <div class=" d-flex flex-column mx-lg-5 mb-3">
                    <h3 class="heading-1 mb-2 autoShow">
                        Best Tech Skilling EdTech Company of the year 2022
                    </h3>
                    <div class="lightText description autoShow">
                        Our mentor community strongly believes in the power of sharing!
                        <br>
                        We collaborate with professionals from great companies to guide you on this exciting journey.
                        <br>
                    </div>
                </div>
                <img class="TechSkillsIMG autoShow"
                    src="https://nxtwave.imgix.net/ccbp-website/Home/award-section/award-taking-image.png" alt="">
            </div>
        </div>
    </div>
    <!-- Available Opprtunities -->
    <div class="lighterBlueBG py-4" id="Opprtunities">
        <div class="container py-md-5 py-3">
            <h1 class="text-center heading-1 darkText autoShow mb-3 mb-md-5 pb-md-3">2000+ Companies have hired
                NxtWave R learners
            </h1>
            <img class="img-fluid autoShow"
                src="https://nxtwave.imgix.net/ccbp-website/intensive/companies-hiring-section/hiring-companies-desktop.png"
                alt="">
        </div>
    </div>
    <!-- LogIn Form -->
    <div class="lightBG" id="LogIn">
        <div class="container">
            <div class="large-display-row">
                <div class="img-container">
                    <img src="Assets/Images/LogIn.png" class="img-fluid autoShow" alt="">
                </div>
                <div class="field-container py-2 py-md-4">
                    <h1 class="heading-1 darkText autoShow">Sign In</h1>
                    <p class="description autoShow">Fields for email and password</p>
                    <form action="LogInUser" method="post">
                        <div class="filed-group autoShow">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                            <div id="emailHelp" class="form-text">
                                We'll never share your email with anyone else.
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp"
                                required>
                        </div>
                        <div class="filed-group autoShow">
                            <button type="submit" class="btn btn-primary submit-btn">LogIn</button>
                        </div>
                        <div class="form-check autoShow">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                    </form>
                    <div class="display-row autoShow">
                        <a href="LinkedIn.com" class="forgot-password">
                            <img src="Assets/Images/LinkedIn.png" alt="">
                        </a>
                        <a href="Google.com" class="forgot-password">
                            <img src="Assets/Images/Google.png" alt="">
                        </a>
                        <a href="x.com" class="forgot-password">
                            <img src="Assets/Images/X.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- or -->
    <div class="d-none w-100 e d-md-block">
        <div class="container d-flex justify-content-center">
            <img src="Assets/Images/Frame 1000004971.png" alt="" class="orIMG autoShow">
        </div>
    </div>
    <!-- Sign Up Form -->
    <div class="lightBG" id="SignUp">
        <div class="container">
            <div class="large-display-row sm-row-reverse">
                <div class="field-container py-2 py-md-4">
                    <h1 class="heading-1 darkText autoShow">Sign Up</h1>
                    <p class="description autoShow">Fields for Registration...</p>
                    <form action="SignUpStudent" method="post">
                        <div class="filed-group autoShow">
                            <label for="fname" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="fname" name="firstName" required>
                            <div id="fnameHelp" class="form-text">
                                Ex. Sachin
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <label for="lname" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lname" name="lastName" required>
                            <div id="lnameHelp" class="form-text">
                                Ex. Tendulkar
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <label for="remail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="remail" name="email" aria-describedby="emailHelp" required>
                            <div id="remailHelp" class="form-text">
                                We'll never share your email with anyone else.
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <label for="mob" class="form-label">Contact Number</label>
                            <input type="tel" class="form-control" id="mob" name="contactNo" required>
                            <div id="mobHelp" class="form-text">
                                Ex. 8500*****4
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <label for="rpsw" class="form-label">Password</label>
                            <input type="password" class="form-control" id="rpsw" name="password" aria-describedby="passwordHelp"
                                required>
                            <div id="rpswHelp" class="form-text">
                                Tip: Capital, Small, Spacial and Numerical Latter Must be Exist.
                            </div>
                        </div>
                        <div class="filed-group autoShow">
                            <button type="submit" class="btn btn-primary submit-btn">SignUp</button>
                        </div>
                    </form>
                    <div class="display-row autoShow">
                        <a href="LinkedIn.com" class="forgot-password">
                            <img src="Assets/Images/LinkedIn.png" alt="">
                        </a>
                        <a href="Google.com" class="forgot-password">
                            <img src="Assets/Images/Google.png" alt="">
                        </a>
                        <a href="x.com" class="forgot-password">
                            <img src="Assets/Images/X.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="img-container">
                    <img src="Assets/Images/SignUp.png" class="img-fluid autoShow" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- About Us -->
    <div class="lightBG py-5" id="AboutUs">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <h1 class="heading-1 darkText autoShow">About Us</h1>
            <p class="description autoShow px-2">
                NxtWave R is a renowned educational platform specializing in coding and software development. We offer
                immersive courses, workshops, and certifications to help you achieve your career goals.
            </p>
            <div class="d-flex flex-warp justify-content-around autoShow mx-4">
                <!-- Social Icons -->
                <a href="#" class="social-icon">
                    <img src="Assets/Images/FaceBook.png" alt="">
                </a>
                <a href="#" class="social-icon">
                    <img src="Assets/Images/X.png" alt="">
                </a>
                <a href="#" class="social-icon">
                    <img src="Assets/Images/Instagram.png" alt="">
                </a>
                <a href="#" class="social-icon">
                    <img src="Assets/Images/LinkedIn.png" alt="">
                </a>
                <a href="#" class="social-icon">
                    <img src="Assets/Images/YouTube.png" alt="">
                </a>
            </div>
        </div>
    </div>
    <!-- footer -->
    <footer class="footer pt-5 pb-2">
        <div class="container mb-3">
            <!-- Logo -->
            <img src="https://nxtwave-website-media-files.s3.ap-south-1.amazonaws.com/ccbp-website/Nxtwave_White_logo.svg"
                width="100px" class="mx-4 autoShow" alt="">
            <!-- Footer Text -->
            <div class="d-flex flex-wrap justify-content-md-between justify-content-center mt-5">
                <!-- Quick Links -->
                <div class="d-flex flex-column mx-4 autoShow">
                    <h6 class="footer-heading text-white mb-3">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="#Home" class="text-white text-decoration-none">Home</a>
                        </li>
                        <li class="mb-2">
                            <a href="#AboutUs" class="text-white text-decoration-none">About Us</a>
                        </li>
                        <li class="mb-2">
                            <a href="#Courses" class="text-white text-decoration-none">Courses</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Pricing</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Contact Us</a>
                        </li>
                    </ul>
                </div>
                <!-- Resources -->
                <div class="d-flex flex-column mx-4 autoShow">
                    <h6 class="footer-heading text-white mb-3">Resources</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Blog</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">FAQs</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Study
                                Materials</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Webinars</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Certifications</a>
                        </li>
                    </ul>
                </div>
                <!-- Support -->
                <div class="d-flex flex-column mx-4 autoShow">
                    <h6 class="footer-heading text-white mb-3">Support</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Help Center</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Terms &
                                Conditions</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Privacy Policy</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Refund Policy</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Feedback</a>
                        </li>
                    </ul>
                </div>
                <!-- Follow Us -->
                <div class="d-flex flex-column mx-4 autoShow">
                    <h6 class="footer-heading text-white mb-3">Follow Us</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Facebook</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Twitter</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">Instagram</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">LinkedIn</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-white text-decoration-none">YouTube</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- CopyRight Text -->
        <div class="container border-top border-secondary pt-2">
            <p class="text-end text-white m-0">Copyright © 2025 NxtWave. All rights reserved.</p>
        </div>
    </footer>
    <%@ include file="Cookies.jsp" %>
</body>

</html>