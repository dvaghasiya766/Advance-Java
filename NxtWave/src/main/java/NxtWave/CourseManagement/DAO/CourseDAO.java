package NxtWave.CourseManagement.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import NxtWave.Common.Connection.PostgreSQLConnection;
import NxtWave.CourseManagement.Model.CourseBean;

public class CourseDAO {
	public static int insertCourseDetails(CourseBean c) {
        Connection conn = null;
        PreparedStatement pstm = null;
        int status = 0;
        
        try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return status;
            }
            
            // 2. Prepare SQL statement
            String sql = "INSERT INTO Courses ("
                    + "    background_image,"
                    + "    avatar,"
                    + "    course_name,"
                    + "    course_instructor_id,"
                    + "    course_code,"
                    + "    course_color,"
                    + "    course_outlet"
                    + ") VALUES (?, ?, ?, ?, ?, ?, ?)";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
            pstm.setString(1, c.getBG());
            pstm.setString(2, c.getAV());
            pstm.setString(3, c.getCourseName());
            pstm.setInt(4, c.getCourseInstructor());
            pstm.setString(5, c.getCourseCode());
            pstm.setString(6, c.getCourseColor());
            pstm.setString(7, c.getCourseOutlet());
            
            // 4. Execute update
            status = pstm.executeUpdate();            
        } catch (SQLException e) {
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 5. Close resources
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
        return status;
    }
	
	public static ResultSet getCourseDetailseByInstructorID(Integer ID) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return null;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT * FROM Courses WHERE course_instructor_id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setInt(1, ID);

            // 4. Execute update
            rs = pstm.executeQuery();
            return rs;
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
		}
		
		return rs;
	}
	
	public static int changeCourseStatus(Boolean Status, Integer ID) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int rs = 0;
		
		try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return rs;
            }
            
            // 2. Prepare SQL statement
            String sql = "UPDATE Courses SET status = ? WHERE id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setBoolean(1, !Status);
			pstm.setInt(2, ID);

            // 4. Execute update
            rs = pstm.executeUpdate();
            return rs;
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
		}
		
		return rs;
	}
	
	public static int updateCourseDesc(String Desc, Integer ID) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int rs = 0;
		
		try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return rs;
            }
            
            // 2. Prepare SQL statement
            String sql = "UPDATE Courses SET course_description = ? WHERE id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setString(1, Desc);
			pstm.setInt(2, ID);

            // 4. Execute update
            rs = pstm.executeUpdate();
            return rs;
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
		}
		
		return rs;
	}
	
	public static ResultSet getCourseDetailseByCourseIDForInstructor(Integer CID, Integer UID) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return null;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT * FROM Courses WHERE id = ? AND course_instructor_id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setInt(1, CID);
			pstm.setInt(2, UID);

            // 4. Execute update
            rs = pstm.executeQuery();
            return rs;
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
		}
		
		return rs;
	}
	
	public static ResultSet getActiveCourseDetailseForStudent(Integer CID, Integer UID) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return null;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT * FROM Courses WHERE id = ? AND course_instructor_id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setInt(1, CID);
			pstm.setInt(2, UID);

            // 4. Execute update
            rs = pstm.executeQuery();
            return rs;
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
		}
		
		return rs;
	}
	
	public static ResultSet getActiveCourseDetails() {
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        
        try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return null;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT * FROM Courses WHERE status = true";        
			pstm = conn.prepareStatement(sql);
			            
            // 3. Execute update
            rs = pstm.executeQuery();
            return rs;
        } catch (SQLException e) {
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
	}
}
