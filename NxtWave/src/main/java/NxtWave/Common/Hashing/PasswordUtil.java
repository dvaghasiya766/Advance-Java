package NxtWave.Common.Hashing;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

public class PasswordUtil {
    // Configuration parameters for PBKDF2
    private static final int ITERATIONS = 100000;
    private static final int KEY_LENGTH = 256; // bits
    private static final int SALT_LENGTH = 16; // bytes
    private static final String ALGORITHM = "PBKDF2WithHmacSHA256";

    /**
     * Hashes a password with a randomly generated salt using PBKDF2
     * 
     * @param password The password to hash
     * @return A string containing the salt and hash separated by colon (format: "salt:hash")
     * @throws RuntimeException if hashing fails
     */
    public static String hashPassword(String password) {
        if (password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }

        try {
            // Generate a random salt
            byte[] salt = new byte[SALT_LENGTH];
            new SecureRandom().nextBytes(salt);

            // Create the PBEKeySpec
            PBEKeySpec spec = new PBEKeySpec(
                password.toCharArray(),
                salt,
                ITERATIONS,
                KEY_LENGTH
            );

            // Get the SecretKeyFactory instance
            SecretKeyFactory skf = SecretKeyFactory.getInstance(ALGORITHM);

            // Generate the hash
            byte[] hash = skf.generateSecret(spec).getEncoded();

            // Combine salt and hash with colon separator
            return Base64.getEncoder().encodeToString(salt) + 
                   ":" + 
                   Base64.getEncoder().encodeToString(hash);

        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    /**
     * Verifies a password against a stored hash
     * 
     * @param inputPassword The password to verify
     * @param storedPassword The stored password hash (format: "salt:hash")
     * @return true if the password matches, false otherwise
     * @throws IllegalArgumentException if inputs are invalid or malformed
     */
    public static boolean verifyPassword(String inputPassword, String storedPassword) {
        // Validate inputs
        if (inputPassword == null || inputPassword.isEmpty()) {
            throw new IllegalArgumentException("Input password cannot be null or empty");
        }
        if (storedPassword == null || storedPassword.isEmpty()) {
            throw new IllegalArgumentException("Stored password cannot be null or empty");
        }

        // Split the stored password into components
        String[] parts = storedPassword.split(":");
        if (parts.length != 2) {
            throw new IllegalArgumentException("Invalid stored password format");
        }

        try {
            // Decode the salt and hash
            byte[] salt = Base64.getDecoder().decode(parts[0]);
            byte[] storedHash = Base64.getDecoder().decode(parts[1]);

            // Create the PBEKeySpec with the input password
            PBEKeySpec spec = new PBEKeySpec(
                inputPassword.toCharArray(),
                salt,
                ITERATIONS,
                KEY_LENGTH
            );

            // Get the SecretKeyFactory instance
            SecretKeyFactory skf = SecretKeyFactory.getInstance(ALGORITHM);

            // Generate the hash from the input password
            byte[] inputHash = skf.generateSecret(spec).getEncoded();

            // Compare the hashes in constant time
            return MessageDigest.isEqual(storedHash, inputHash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Password verification algorithm not available", e);
        } catch (InvalidKeySpecException e) {
            throw new IllegalArgumentException("Invalid key specification", e);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid Base64 encoding in stored password", e);
        }
    }
}