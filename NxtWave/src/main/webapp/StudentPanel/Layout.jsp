<%@page import="NxtWave.Common.Hashing.SessionCookie"%>
<%
    // Check if valid session exists
    if (!SessionCookie.isValidSession(request)) {
        // Redirect to login page if no valid session
        response.sendRedirect(request.getContextPath() + "/index.jsp#LogIn");
        return; // Important to stop further execution
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nxt Wave</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Set Icons -->
    <link rel="icon" type="image/png" href="../Assets/Images/Logo 1001.png">
    <!-- Bootstrep CDN For CSS and Icons -->
    <link rel="stylesheet" href="../Assets/Bootstrap/bootstrap.min.css">
    <script src="../Assets/Bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- External CSS -->
    <link rel="stylesheet" href="../Assets/CSS/CustomCSS1001.css">
    <link rel="stylesheet" href="../Assets/CSS/StudentPanel.css">
</head>
<body>
	<style>
		body {
			overflow: hidden;
		}
	</style>
    <div class="full-width">
    	<%@ include file="../Cookies.jsp" %>
        <!-- NavBar -->
        <nav class="AuthorizedNavbarLp">
            <div class="AuthorizedNavbarBrand">
                <img class="Logo" src="../Assets/Images/Logo 1003.png" alt="Logo" style="width: 100px;">
            </div>
            <div class="NavbarTabContainer mb-auto">
                <button class="NavbarTab" onclick="redirection('index.jsp')" id="index">
                    <img class="NavIcon" src="../Assets/Images/Home_duotone1.png" alt="Profile Pic">
                    <p class="NavLabel">Home</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('index.jsp')" id="Activeindex">
                    <img class="NavIcon" src="../Assets/Images/Home_duotone.png" alt="Profile Pic">
                    <p class="NavLabel">Home</p>
                </button>
                <button class="NavbarTab" onclick="redirection('MyCourse.jsp')" id="MyCourse">
                    <img class="NavIcon" src="../Assets/Images/Chart_alt_duotone_line@3x1.png" alt="Profile Pic">
                    <p class="NavLabel">My Courses</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('MyCourse.jsp')"
                    id="ActiveMyCourse">
                    <img class="NavIcon" src="../Assets/Images/Chart_alt_duotone_line@3x.png" alt="Profile Pic">
                    <p class="NavLabel">My Courses</p>
                </button>
                <button class="NavbarTab" onclick="redirection('AllCourses.jsp')" id="AllCourses">
                    <img class="NavIcon" src="../Assets/Images/Database_duotone@3x1.png" alt="Profile Pic">
                    <p class="NavLabel">Available Courses</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('AllCourses.jsp')"
                    id="ActiveAllCourses">
                    <img class="NavIcon" src="../Assets/Images/Database_duotone@3x.png" alt="Profile Pic">
                    <p class="NavLabel">Available Courses</p>
                </button>
                <button class="NavbarTab" onclick="redirection('Activity.jsp')" id="Activity">
                    <img class="NavIcon" src="../Assets/Images/Activity1.png" alt="Profile Pic">
                    <p class="NavLabel">Activity</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('Activity.jsp')"
                    id="ActiveActivity">
                    <img class="NavIcon" src="../Assets/Images/Activity.png" alt="Profile Pic">
                    <p class="NavLabel">Activity</p>
                </button>
                <button class="NavbarTab" onclick="redirection('Disscussion.jsp')" id="Disscussion">
                    <img class="NavIcon" src="../Assets/Images/Chat_alt_3_duotone_line@3x1.png" alt="Profile Pic">
                    <p class="NavLabel">Disscussion</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('Disscussion.jsp')"
                    id="ActiveDisscussion">
                    <img class="NavIcon" src="../Assets/Images/Chat_alt_3_duotone_line@3x.png" alt="Profile Pic">
                    <p class="NavLabel">Disscussion</p>
                </button>
                <button class="NavbarTab" onclick="redirection('Assignments.jsp')" id="Assignments">
                    <img class="NavIcon" src="../Assets/Images/Book_duotone_line@3x1.png" alt="Profile Pic">
                    <p class="NavLabel">Assignments</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('Assignments.jsp')"
                    id="ActiveAssignments">
                    <img class="NavIcon" src="../Assets/Images/Book_duotone_line@3x.png" alt="Profile Pic">
                    <p class="NavLabel">Assignments</p>
                </button>
                <button class="NavbarTab" onclick="redirection('Profile.jsp')" id="Profile">
                    <img class="NavIcon" src="../Assets/Images/User_box_duotone1.png" alt="Profile Pic">
                    <p class="NavLabel">Profile</p>
                </button>
                <button class="activeNavTab NavbarTab d-none" onclick="redirection('Profile.jsp')" id="ActiveProfile">
                    <img class="NavIcon" src="../Assets/Images/User_box_duotone.png" alt="Profile Pic">
                    <p class="NavLabel">Profile</p>
                </button>
            </div>
            <div class="NavbarTabContainer">
                <button class="NavbarTab justify-content-start flex-row-reverse">
                    <img class="NavIcon m-0" src="../Assets/Images/Question_duotone@3x1.png" alt="Profile Pic">
                    <p class="NavLabel me-2">Help</p>
                </button>
            </div>
        </nav>
        <nav class="AuthorizedNavbarMob">
            <button class="NavbarTabMob" onclick="redirection('index.jsp')" id="Home">
                <img class="NavIcon" src="../Assets/Images/Home_duotone1.png" alt="Profile Pic">
                <p class="NavLabelMob">Home</p>
            </button>
            <button class="activeNavTab NavbarTabMob  mx-1 my-1 p-0 d-none" onclick="redirection('index.jsp')" id="ActiveHome">
                <img class="NavIcon" src="../Assets/Images/Home_duotone.png" alt="Profile Pic">
                <p class="NavLabelMob">Home</p>
            </button>
            <button class="NavbarTabMob" onclick="redirection('AllCourses.jsp')" id="Courses">
                <img class="NavIcon" src="../Assets/Images/Database_duotone@3x1.png" alt="Profile Pic">
                <p class="NavLabelMob text-turncate">Available Courses</p>
            </button>
            <button class="activeNavTab NavbarTabMob  mx-1 my-1 px-1 d-none" onclick="redirection('AllCourses.jsp')" id="ActiveCourses">
                <img class="NavIcon" src="../Assets/Images/Database_duotone@3x.png" alt="Profile Pic">
                <p class="NavLabelMob text-turncate">Available Courses</p>
            </button>
            <button class="NavbarTabMob" onclick="redirection('Disscussion.jsp')" id="DisscussioMob">
                <img class="NavIcon" src="../Assets/Images/Chat_alt_3_duotone_line@3x1.png" alt="Profile Pic">
                <p class="NavLabelMob">Disscussion</p>
            </button>
            <button class="activeNavTab NavbarTabMob  mx-1 my-1 px-1 d-none" onclick="redirection('Disscussion.jsp')" id="ActiveDisscussioMob">
                <img class="NavIcon" src="../Assets/Images/Chat_alt_3_duotone_line@3x.png" alt="Profile Pic">
                <p class="NavLabelMob">Disscussion</p>
            </button>
            <button class="NavbarTabMob" onclick="redirection('Profile.jsp')" id="ProfileMob">
                <img class="NavIcon" src="../Assets/Images/User_box_duotone1.png" alt="Profile Pic">
                <p class="NavLabelMob">Profile</p>
            </button>
            <button class="activeNavTab NavbarTabMob  mx-1 my-1 p-0 d-none" onclick="redirection('Profile.jsp')" id="ActiveProfileMob">
                <img class="NavIcon" src="../Assets/Images/User_box_duotone.png" alt="Profile Pic">
                <p class="NavLabelMob">Profile</p>
            </button>
        </nav>
        <script>
	    	function redirection(location) {
	    		window.location.href = location;
	    	}
	    	function LogOut() {
	    		window.location.href = "/NxtWave/LogOutUser";
	    	}
        </script>