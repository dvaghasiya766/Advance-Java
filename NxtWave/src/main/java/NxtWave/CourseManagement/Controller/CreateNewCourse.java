package NxtWave.CourseManagement.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.Common.Model.StoreFile;
import NxtWave.CourseManagement.DAO.CourseDAO;
import NxtWave.CourseManagement.Model.CourseBean;

/**
 * Servlet implementation class CreateNewCourse
 */
@WebServlet("/InstructorPanel/CreateNewCourse")
@MultipartConfig()
public class CreateNewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewCourse() {
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
	    try {
	        // Get form data
	        Part filePart1 = request.getPart("BGImage");
	        Part filePart2 = request.getPart("AVImage");
	        Integer customId = SessionCookie.getIdFromSession(request);
	        
	        // Validate inputs
	        if (filePart1 == null || filePart2 == null || customId == null) {
	            SessionCookie.setNotificationCookie(response, "Missing required files or session ID", false);
	            response.sendRedirect("MyCourse.jsp");
	            return;
	        }
	        
	        // Define storage paths
	        String uploadDirPath1 = getServletContext().getRealPath("") + File.separator + "Assets/Images/CourseBG";
	        String uploadDirPath2 = getServletContext().getRealPath("") + File.separator + "Assets/Images/CourseAvatar";
	        
	        // Create directories if they don't exist
	        new File(uploadDirPath1).mkdirs();
	        new File(uploadDirPath2).mkdirs();
	        
	        // Store files
	        String storedFilePath1 = StoreFile.storeUploadedFile(filePart1, customId.toString(), uploadDirPath1);
	        String storedFilePath2 = StoreFile.storeUploadedFile(filePart2, customId.toString(), uploadDirPath2);

	        // Extract filenames
	        String fileName1 = new File(storedFilePath1).getName();
	        String fileName2 = new File(storedFilePath2).getName();
	        
	        // Prepare paths for DB
	        String pathForDB1 = "Assets/Images/CourseBG/" + fileName1;
	        String pathForDB2 = "Assets/Images/CourseAvatar/" + fileName2;
	        
	        // Create CourseBean
	        CourseBean course = new CourseBean();
	        course.setBG(pathForDB1);
	        course.setAV(pathForDB2);
	        course.setCourseName(request.getParameter("coursename"));
	        course.setCourseOutlet(request.getParameter("courseotlt"));
	        course.setCourseColor(request.getParameter("coursecolor"));
	        course.setCourseCode(request.getParameter("coursecode"));
	        
	        // Handle instructor ID conversion safely
	        try {
	            course.setCourseInstructor(Integer.parseInt(request.getParameter("CourseInstructor")));
	            System.out.println(Integer.parseInt(request.getParameter("CourseInstructor")));
	        } catch (NumberFormatException e) {
	            SessionCookie.setNotificationCookie(response, "Invalid Instructor ID format", false);
	            response.sendRedirect("MyCourse.jsp");
	            return;
	        }
	        
	        // Insert course
	        int result = CourseDAO.insertCourseDetails(course);
	        
	        if (result > 0) {
	            SessionCookie.setNotificationCookie(response, "Course created successfully!", true);
	        } else {
	            SessionCookie.setNotificationCookie(response, "Failed to create course. Please try again.", false);
	        }
	        
	        response.sendRedirect("MyCourse.jsp");
	        
	    } catch (IllegalArgumentException e) {
	    		e.printStackTrace();
	        SessionCookie.setNotificationCookie(response, "Invalid input: " + e.getMessage(), false);
	        response.sendRedirect("MyCourse.jsp");
	    } catch (Exception e) {
	    		e.printStackTrace();
	        SessionCookie.setNotificationCookie(response, "System error occurred. Please try again.", false);
	        response.sendRedirect("MyCourse.jsp");
	    }
	}
}
