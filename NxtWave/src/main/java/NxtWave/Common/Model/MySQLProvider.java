package NxtWave.Common.Model;

public interface MySQLProvider {
    // For MySQL (XAMPP default)
	String username = "root";       // Default XAMPP MySQL username
	String password = "";           // Default XAMPP MySQL password (empty)
	String connURL = "jdbc:mysql://localhost:3306/nxtwave";
}
