package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.websocket.Session;

import java.io.File;
import java.io.IOException;

import NxtWave.Common.DAO.UserOperation;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.Common.Model.StoreFile;

/**
 * Servlet implementation class UpdateProfilePic
 */
@WebServlet("/StudentPanel/UpdateProfilePic")
@MultipartConfig
public class UpdateProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfilePic() {
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
            Part filePart = request.getPart("profileImage");
            Integer customId = SessionCookie.getIdFromSession(request);
            String customName =  customId == null ? null : customId.toString();

            // Validate inputs
            if (filePart == null || customName == null || customName.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing file or filename");
                SessionCookie.setNotificationCookie(response, "Error for Storing", false);
                return;
            }
            
            // Define storage path (using webapp's imgs directory)
            String uploadDirPath = getServletContext().getRealPath("") + File.separator + "Assets/Images/Avatar";
            
            // Store the file using our utility method
            String storedFilePath = StoreFile.storeUploadedFile(filePart, customName, uploadDirPath);
            
            // Get just the filename for response
            String fileName = storedFilePath.substring(storedFilePath.lastIndexOf(File.separator) + 1);
            String pathForDB = "Assets/Images/Avatar/" + fileName;
            
            UserOperation.setAvatar(pathForDB, customId);
            
            // Set success response
//            request.getSession().setAttribute("message", "File uploaded successfully: " + fileName);
            SessionCookie.setNotificationCookie(response, "Successfully Updated! " + fileName, true);
             response.sendRedirect("Profile.jsp");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            SessionCookie.setNotificationCookie(response, "Please Upload File! ", false);
             response.sendRedirect("Profile.jsp");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                    "Error uploading file: " + e.getMessage());
            SessionCookie.setNotificationCookie(response, "Cann't Upload! ", false);
             response.sendRedirect("Profile.jsp");
        }
	}

}
