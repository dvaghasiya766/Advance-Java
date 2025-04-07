package NxtWave.StudentManagement.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.StudentManagement.DAO.StudentDAO;
import NxtWave.StudentManagement.Model.StudentBean;

/**
 * Servlet implementation class SignUpStudent
 */
@WebServlet("/SignUpStudent")
public class SignUpStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Create Student Bean from request parameters
        StudentBean student = createStudentFromRequest(request);
        
        try {
            // 2. Attempt to insert student record
            int result = StudentDAO.insertStudentDetails(student);
            
            if (result > 0) {
                // 3. Success case
                handleSuccess(response, student.getEmail());
            } else {
                // 4. Failure case (email already exists)
                handleFailure(response, "Email already registered...");
            }
        } catch (Exception e) {
            // 5. Error case
            handleError(response, e);
        }
    }

    private StudentBean createStudentFromRequest(HttpServletRequest request) {
        StudentBean student = new StudentBean();
        student.setFirstName(request.getParameter("firstName"));
        student.setLastName(request.getParameter("lastName"));
        student.setEmail(request.getParameter("email"));
        student.setContactNo(request.getParameter("contactNo"));
        student.setPassword(request.getParameter("password"));
        return student;
    }

    private void handleSuccess(HttpServletResponse response, String email) throws IOException {
        String message = "Registration successful! Please check your email to activate your account.";
        SessionCookie.setNotificationCookie(response, message, true);
        response.sendRedirect("index.jsp#LogIn");
    }

    private void handleFailure(HttpServletResponse response, String errorMessage) throws IOException {
        SessionCookie.setNotificationCookie(response, errorMessage, false);
        response.sendRedirect("index.jsp#SignUp");
    }

    private void handleError(HttpServletResponse response, Exception e) throws IOException {
        System.err.println("Registration error: " + e.getMessage());
        String message = "System error during registration. Please try again.";
        SessionCookie.setNotificationCookie(response, message, false);
        response.sendRedirect("index.jsp#SignUp");
    }

}
