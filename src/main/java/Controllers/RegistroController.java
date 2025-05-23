package Controllers;

import Models.Entities.Usuario;
import Models.Repositories.UsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/registro")
public class RegistroController extends HttpServlet {

    private UsuarioRepository usuarioRepository;

    @Override
    public void init() {
        usuarioRepository = new UsuarioRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/vistas/usuario/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Usuario nuevo = new Usuario();
        nuevo.setUsername(username);
        nuevo.setPassword(password);

        try {
            boolean registrado = usuarioRepository.registrarUsuario(nuevo);
            if (registrado) {
                response.sendRedirect("login");
            } else {
                request.setAttribute("error", "No se pudo registrar el usuario");
                request.getRequestDispatcher("/WEB-INF/vistas/usuario/registro.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

