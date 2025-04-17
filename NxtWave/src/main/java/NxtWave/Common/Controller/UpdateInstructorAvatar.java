package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import NxtWave.Common.DAO.UserOperation;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.Common.Model.StoreFile;

@WebServlet("/InstructorPanel/UpdateInstructorAvatar")
@MultipartConfig

public class UpdateInstructorAvatar extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UpdateInstructorAvatar.class.getName());
    private static final long serialVersionUID = 1L;
    private static final String AVATAR_DIR = "Assets/Images/Avatar";
    private static final String[] ALLOWED_MIME_TYPES = {"image/jpeg", "image/png", "image/gif"};

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // 1. Validate session and get user ID
            Integer customId = SessionCookie.getIdFromSession(request);
            if (customId == null) {
                sendErrorResponse(response, "Session expired. Please login again.", "Profile.jsp");
                return;
            }

            // 2. Validate file part
            Part filePart = request.getPart("profileImage");
            if (filePart == null || filePart.getSize() == 0) {
                sendErrorResponse(response, "No file uploaded.", "Profile.jsp");
                return;
            }

            // 3. Validate file type
            if (!isValidFileType(filePart)) {
                sendErrorResponse(response, "Invalid file type. Only images are allowed.", "Profile.jsp");
                return;
            }

            // 4. Prepare upload directory
            String uploadDirPath = getServletContext().getRealPath("") + File.separator + AVATAR_DIR;
            File uploadDir = new File(uploadDirPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 5. Store the file
            String storedFilePath = StoreFile.storeUploadedFile(filePart, customId.toString(), uploadDirPath);
            String fileName = Paths.get(storedFilePath).getFileName().toString();
            String pathForDB = AVATAR_DIR + "/" + fileName;

            // 6. Update database
            if (UserOperation.setAvatar(pathForDB, customId) > 1) {
                sendErrorResponse(response, "Failed to update profile in database.", "Profile.jsp");
                return;
            }

            // 7. Success response
            SessionCookie.setNotificationCookie(response, "Profile picture updated successfully!", true);
            response.sendRedirect("Profile.jsp");

        } catch (IllegalArgumentException e) {
            logger.log(Level.WARNING, "Validation error: " + e.getMessage(), e);
            sendErrorResponse(response, e.getMessage(), "Profile.jsp");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Unexpected error: " + e.getMessage(), e);
            sendErrorResponse(response, "An unexpected error occurred. Please try again.", "Profile.jsp");
        }
    }

    private boolean isValidFileType(Part filePart) {
        String contentType = filePart.getContentType();
        for (String mime : ALLOWED_MIME_TYPES) {
            if (mime.equals(contentType)) {
                return true;
            }
        }
        return false;
    }

    private void sendErrorResponse(HttpServletResponse response, String message, String redirectPage) 
            throws IOException {
        SessionCookie.setNotificationCookie(response, message, false);
        response.sendRedirect(redirectPage);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}