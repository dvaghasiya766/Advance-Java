package NxtWave.Common.Model;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.http.Part;

public class StoreFile {
    
    /**
     * Stores an uploaded file with a custom name at the specified path
     * @param filePart The file part from the request
     * @param customName The desired name for the file (without extension)
     * @param storagePath The directory path where the file should be stored
     * @return The full path of the stored file
     * @throws IOException If there's an error during file operations
     * @throws IllegalArgumentException If parameters are invalid
     */
    public static String storeUploadedFile(Part filePart, String customName, String storagePath) 
            throws IOException, IllegalArgumentException {
        
        // Validate inputs
        if (filePart == null || filePart.getSize() == 0) {
            throw new IllegalArgumentException("No file was uploaded");
        }
        
        if (customName == null || customName.trim().isEmpty()) {
            throw new IllegalArgumentException("Custom file name cannot be empty");
        }
        
        if (storagePath == null || storagePath.trim().isEmpty()) {
            throw new IllegalArgumentException("Storage path cannot be empty");
        }

        // Get original file extension
        String submittedFileName = filePart.getSubmittedFileName();
        String extension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
        
        // Create storage directory if it doesn't exist
        File uploadDir = new File(storagePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Create the new file path
        String newFilePath = storagePath + File.separator + customName + extension;
        
        // Optional: Delete the old file with same name (in case it exists)
        File oldFile = new File(newFilePath);
        if (oldFile.exists()) {
            oldFile.delete();
        }
        
        // Save the file
        filePart.write(newFilePath);
        
        return newFilePath;
    }
}