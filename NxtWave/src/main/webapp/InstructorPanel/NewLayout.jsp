<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="NxtWave.StudentManagement.DAO.StudentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NxtWave.Common.Hashing.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    // Check if valid session exists
    if (!SessionCookie.isValidSession(request)) {
        // Redirect to login page if no valid session
        response.sendRedirect(request.getContextPath() + "/index.jsp#LogIn");
        return; // Important to stop further execution
    }
%>
<%
	String Email = SessionCookie.getEmailIdFromSession(request);
	ResultSet rs = StudentDAO.getStudentDetails(Email);
	String Avatar = "";
	String FirstName = "";
	String LastName = "";
	String ContactNo = "";
	String DOB = "";
	String Country = "";
	String CreateAt = "";
	String LastLogIn = "";
	String FullName = "";
	
	if (rs != null && rs.next()) {
		Avatar = rs.getString("avatar");
		FirstName = rs.getString("first_name");
		LastName = rs.getString("last_name");
		ContactNo = rs.getString("contact_no");
		DOB = rs.getString("dob");
		Country = rs.getString("country");
		CreateAt = rs.getString("created_at");
		LastLogIn = rs.getString("last_login");
		
		FullName = FirstName + " " + LastName; // use column names for clarity
	}
%>
<%
    String formattedDate = "N/A";
    if (CreateAt != null) {
        try {
            java.sql.Timestamp ts = java.sql.Timestamp.valueOf(CreateAt);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            formattedDate = sdf.format(ts);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    <!-- External CSS -->
    <link rel="stylesheet" href="../Assets/CSS/CustomCSS1001.css">
    <link rel="stylesheet" href="../Assets/CSS/StudentPanel.css">
</head>

<body>
    <!-- NavBar -->
    <%@ include file="../Cookies.jsp" %>
    <nav class="Navbar shadow container-fluid d-flex py-2 px-3">
        <a href="javascript:history.back()" class="btn p-0 me-auto">
            <img src="../Assets/Images/Expand_left.png" height="30px" alt="">
        </a>
        <div class="d-flex flex-row">
            <a class="NavItems" aria-current="page" href="index.jsp">Home</a>
            <a class="NavItems mx-4" href="Profile.jsp">Profile</a>
            <a class="NavItems" href="Profile.jsp">
                <img src="../Assets/Images/Default Profile Picture1.png" alt="" height="30px">
            </a>
        </div>
    </nav>