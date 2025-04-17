package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import NxtWave.Common.Connection.MailApp;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.StudentManagement.DAO.StudentDAO;
import NxtWave.StudentManagement.Model.StudentBean;

/**
 * Servlet implementation class UpdateUserInfo
 */
@WebServlet("/StudentPanel/UpdateUserInfo")
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfo() {
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
	    if (!SessionCookie.isValidSession(request)) {
	        response.sendRedirect(request.getContextPath() + "/index.jsp#LogIn");
	        return;
	    }
        try {
        		// 1. Create Student Bean from request parameters
            StudentBean student = createStudentFromRequest(request);

            // 1.1  Validate required fields
//            if (student.getFirstName() == null || student.getFirstName().trim().isEmpty() ||
//                student.getEmail() == null || student.getEmail().trim().isEmpty()) {
//                handleFailure(response, "All Fields are required...");
//                return;
//            }
            
            // 2. Attempt to insert student record
            int result = StudentDAO.updateStudentDetails(student);
            
            if (result > 0) {
                // 3. Success case
                handleSuccess(response, student.getEmail());
            } else {
                // 4. Failure case (email already exists)
                handleFailure(response, "Somthing Error occurs while updating Data..." + student.getEmail());
            }
        } catch (Exception e) {
            // 5. Error case
            handleError(response, e);
        }
	}
	
	private StudentBean createStudentFromRequest(HttpServletRequest request) {
        StudentBean student = new StudentBean();
        student.setFirstName(request.getParameter("firstname"));
        student.setLastName(request.getParameter("lastname"));
        student.setEmail(request.getParameter("email"));
        student.setContactNo(request.getParameter("contactNo"));
        student.setCountry(request.getParameter("Country"));
        String dob = request.getParameter("dob");
        Date dateOfBirth = null;
        if (dob != null && !dob.isEmpty()) {
            LocalDate localDate = LocalDate.parse(dob); // parses yyyy-MM-dd
            dateOfBirth = Date.valueOf(localDate);      // convert to java.sql.Date
        }
        student.setDob(dateOfBirth);
        return student;
    }
    private void handleSuccess(HttpServletResponse response, String email) throws IOException {
        String message = "Updatation successfully!";
        MailApp.sendActivationMail(email);
        SessionCookie.setNotificationCookie(response, message, true);
        response.sendRedirect("Profile.jsp");
    }

    private void handleFailure(HttpServletResponse response, String errorMessage) throws IOException {
        SessionCookie.setNotificationCookie(response, errorMessage, false);
        response.sendRedirect("Profile.jsp");
    }

    private void handleError(HttpServletResponse response, Exception e) throws IOException {
        System.err.println("Registration error: " + e.getMessage());
        String message = "System error during Updation. Please try again.";
        SessionCookie.setNotificationCookie(response, message, false);
        response.sendRedirect("Profile.jsp");
    }
}
