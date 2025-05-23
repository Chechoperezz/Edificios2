package Models.Repositories;

import Models.Entities.Usuario;

import java.sql.*;

public class UsuarioRepository {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/Edificios?useSSL=false&serverTimezone=UTC";
    private final String jdbcUser = "root";
    private final String jdbcPassword = "1055";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
    }

    public Usuario validarUsuario(String username, String password) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Usuario(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
                }
            }
        }
        return null;
    }

    public boolean registrarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (username, password) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getPassword());
            return ps.executeUpdate() > 0;
        }
    }

}
