package NxtWave.Common.Hashing;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletResponse;

public class SessionCookie {
    
    /**
     * Sets user session attributes after successful authentication
     * 
     * @param request HttpServletRequest object
     * @param email User's email to store in session
     * @param role User's role to store in session
     * @return true if session was successfully set
     * @throws IllegalArgumentException if request is null
     */
    public static boolean setSession(HttpServletRequest request, int id, String email, String role) {
        if (request == null) {
            throw new IllegalArgumentException("HttpServletRequest cannot be null");
        }
        
        try {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("email", email);
            session.setAttribute("role", role);
            session.setAttribute("authenticated", true);
            session.setAttribute("ip", request.getRemoteAddr());
            session.setAttribute("userAgent", request.getHeader("User-Agent"));
            request.changeSessionId();
            
            // System.out.println(getIdFromSession(request));
            // Optional: Set session timeout (in seconds)
            session.setMaxInactiveInterval(50 * 60); // 50 minutes
            
            return true;
        } catch (Exception e) {
            // Log the error (consider using a logger)
            System.err.println("Error setting session: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Validates if a user session exists and is authenticated
     * 
     * @param request HttpServletRequest object
     * @return true if valid session exists
     */
    public static boolean isValidSession(HttpServletRequest request) {
        if (request == null) {
            return false;
        }
        
        HttpSession session = request.getSession(false);
        return session != null 
                && session.getAttribute("authenticated") != null 
                && (Boolean) session.getAttribute("authenticated");
    }
    
    /**
     * Invalidates the current user session (logout)
     * 
     * @param request HttpServletRequest object
     */
    /**
     * Invalidates the current user session (logout) with additional security measures
     * 
     * @param request HttpServletRequest object
     * @return true if session was successfully invalidated, false otherwise
     * @throws IllegalStateException if session invalidation fails
     */
    public static boolean invalidateSession(HttpServletRequest request) {
        // Null check
        if (request == null) {
            return false;
        }
        
        // Get existing session without creating a new one
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            try {
                // Clear all session attributes first
                session.removeAttribute("authenticated");
                session.removeAttribute("email");
                session.removeAttribute("role");
                session.removeAttribute("id");
                
                // Additional security cleanup
                Enumeration<String> attrNames = session.getAttributeNames();
                while (attrNames.hasMoreElements()) {
                    session.removeAttribute(attrNames.nextElement());
                }
                
                // Invalidate the session
                session.invalidate();
                return true;
            } catch (IllegalStateException e) {
                // Session was already invalidated
                System.err.println("Session invalidation failed: " + e.getMessage());
                throw new IllegalStateException("Session invalidation failed", e);
            }
        }
        
        // No session to invalidate
        return false;
    }
    
    /**
     * Sets a success/failure notification cookie
     * 
     * @param response HttpServletResponse object
     * @param message The message to store in cookie
     * @param isSuccess Whether this is a success message (affects cookie name)
     * @return true if cookie was set successfully
     * @throws IllegalArgumentException if response is null
     */
    
    /**
     * Sets a notification cookie with proper encoding (preserves spaces)
     */
    public static boolean setNotificationCookie(HttpServletResponse response, String message, boolean isSuccess) {
        if (response == null || message == null) {
            return false;
        }

        try {
            String cookieName = isSuccess ? "successMsg" : "errorMsg";
            // Encode the message while preserving spaces as %20
            String encodedValue = URLEncoder.encode(message, "UTF-8").replace("+", "%20");
            
            String cookieHeader = String.format(
                "%s=%s; Max-Age=10; Path=/; HttpOnly; Secure; SameSite=Lax",
                cookieName, 
                encodedValue
            );
            response.addHeader("Set-Cookie", cookieHeader);
            return true;
        } catch (UnsupportedEncodingException e) {
            System.err.println("Encoding error: " + e.getMessage());
            return false;
        }
    }

    /**
     * Extracts and decodes message from cookie (handles spaces properly)
     */
    public static String getMessageFromCookie(HttpServletRequest request, String cookieName) {
        if (request == null || cookieName == null) {
            return null;
        }

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    try {
                        // Decode the URL-encoded value
                        return URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        System.err.println("Decoding error: " + e.getMessage());
                        // Fallback to raw value with basic sanitization
                        return sanitizeCookieValue(cookie.getValue());
                    }
                }
            }
        }
        return null;
    }

    /**
     * Basic sanitization for fallback scenario
     */
    private static String sanitizeCookieValue(String value) {
        if (value == null) return "";
        // Remove only truly problematic characters but preserve spaces
        return value.replaceAll("[\\n\\r\\t,;\\\\\"]", "");
    }
    /**
     * Deletes a cookie by setting max age to 0
     */
    public static void deleteCookie(HttpServletResponse response, String cookieName) {
        if (response == null || cookieName == null) return;
        
        Cookie cookie = new Cookie(cookieName, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
    
    /**
     * @param request
     * @return
     * for get Student ID
     */
//    public static String getIdFromSession(HttpServletRequest request) {
//        Object idObj = request.getSession().getAttribute("id");
//        return (idObj != null) ? idObj.toString() : null;
//    }
    public static Integer getIdFromSession(HttpServletRequest request) {
    		Object idObj = request.getSession().getAttribute("id");
    		if (idObj instanceof Integer) {
    	        return (Integer) idObj;
    	    } else if (idObj instanceof String) {
    	        try {
    	            return Integer.parseInt((String) idObj);
    	        } catch (NumberFormatException e) {
    	            System.err.println("Invalid ID format in session: " + idObj);
    	            return null;
    	        }
    	    }
    	    return null;
	}
    public static String getLastPageFromSession(HttpServletRequest request) {
        Object lastPage = request.getSession().getAttribute("lastPage");
        return (lastPage != null) ? lastPage.toString() : null;
    }
    public static String getEmailIdFromSession(HttpServletRequest request) {
        Object studentId = request.getSession().getAttribute("email");
        return (studentId != null) ? studentId.toString() : null;
    }
    public static String getRoleFromSession(HttpServletRequest request) {
        Object studentId = request.getSession().getAttribute("role");
        return (studentId != null) ? studentId.toString() : null;
    }
}