package Models.Repositories;

import Models.Entities.Edificio;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EdificioRepository {

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


    public void crear(Edificio edificio) throws SQLException {
        String sql = "INSERT INTO edificios (nombre, metrosCuadrados, altura, numPisos, numApartamentos, numOficinas, " +
                "nomParqueadero, numPisinas, pais, departamento, ciudad, tieneAsensor, valorAdministracion, tieneZonaSocial) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, edificio.getNombre());
            ps.setDouble(2, edificio.getMetrosCuadrados());
            ps.setDouble(3, edificio.getAltura());
            ps.setInt(4, edificio.getNumPisos());
            ps.setInt(5, edificio.getNumApartamentos());
            ps.setInt(6, edificio.getNumOficinas());
            ps.setString(7, edificio.getNomParqueadero());
            ps.setInt(8, edificio.getNumPisinas());
            ps.setString(9, edificio.getPais());
            ps.setString(10, edificio.getDepartamento());
            ps.setString(11, edificio.getCiudad());
            ps.setBoolean(12, edificio.isTieneAsensor());
            ps.setDouble(13, edificio.getValorAdministracion());
            ps.setBoolean(14, edificio.isTieneZonaSocial());

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    edificio.setId(rs.getInt(1));
                }
            }
        }
    }


    public List<Edificio> listarTodos() throws SQLException {
        List<Edificio> lista = new ArrayList<>();
        String sql = "SELECT * FROM edificios";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Edificio e = mapearEdificio(rs);
                lista.add(e);
            }
        }
        return lista;
    }


    public Edificio buscarPorId(int id) throws SQLException {
        Edificio edificio = null;
        String sql = "SELECT * FROM edificios WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    edificio = mapearEdificio(rs);
                }
            }
        }
        return edificio;
    }


    public Edificio buscarPorNombre(String nombre) throws SQLException {
        Edificio edificio = null;
        String sql = "SELECT * FROM edificios WHERE nombre = ? LIMIT 1";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nombre);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    edificio = mapearEdificio(rs);
                }
            }
        }
        return edificio;
    }



    public boolean actualizar(Edificio edificio) throws SQLException {
        String sql = "UPDATE edificios SET nombre=?, metrosCuadrados=?, altura=?, numPisos=?, numApartamentos=?, " +
                "numOficinas=?, nomParqueadero=?, numPisinas=?, pais=?, departamento=?, ciudad=?, tieneAsensor=?, " +
                "valorAdministracion=?, tieneZonaSocial=? WHERE id=?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, edificio.getNombre());
            ps.setDouble(2, edificio.getMetrosCuadrados());
            ps.setDouble(3, edificio.getAltura());
            ps.setInt(4, edificio.getNumPisos());
            ps.setInt(5, edificio.getNumApartamentos());
            ps.setInt(6, edificio.getNumOficinas());
            ps.setString(7, edificio.getNomParqueadero());
            ps.setInt(8, edificio.getNumPisinas());
            ps.setString(9, edificio.getPais());
            ps.setString(10, edificio.getDepartamento());
            ps.setString(11, edificio.getCiudad());
            ps.setBoolean(12, edificio.isTieneAsensor());
            ps.setDouble(13, edificio.getValorAdministracion());
            ps.setBoolean(14, edificio.isTieneZonaSocial());
            ps.setInt(15, edificio.getId());

            int filas = ps.executeUpdate();
            return filas > 0;
        }
    }


    public boolean eliminar(int id) throws SQLException {
        String sql = "DELETE FROM edificios WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int filas = ps.executeUpdate();
            return filas > 0;
        }
    }


    private Edificio mapearEdificio(ResultSet rs) throws SQLException {
        Edificio e = new Edificio();
        e.setId(rs.getInt("id"));
        e.setNombre(rs.getString("nombre"));
        e.setMetrosCuadrados(rs.getDouble("metrosCuadrados"));
        e.setAltura(rs.getDouble("altura"));
        e.setNumPisos(rs.getInt("numPisos"));
        e.setNumApartamentos(rs.getInt("numApartamentos"));
        e.setNumOficinas(rs.getInt("numOficinas"));
        e.setNomParqueadero(rs.getString("nomParqueadero"));
        e.setNumPisinas(rs.getInt("numPisinas"));
        e.setPais(rs.getString("pais"));
        e.setDepartamento(rs.getString("departamento"));
        e.setCiudad(rs.getString("ciudad"));
        e.setTieneAsensor(rs.getBoolean("tieneAsensor"));
        e.setValorAdministracion(rs.getDouble("valorAdministracion"));
        e.setTieneZonaSocial(rs.getBoolean("tieneZonaSocial"));
        return e;
    }
}
