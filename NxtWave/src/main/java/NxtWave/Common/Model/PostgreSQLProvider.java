package NxtWave.Common.Model;

public interface PostgreSQLProvider {
    // Alternative: For PostgreSQL
    String username = "postgres";
    String password = "1414"; // Default may be "postgres" or your password
    String connURL = "jdbc:postgresql://localhost:5432/NxtWave";
}
