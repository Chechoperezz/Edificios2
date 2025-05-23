package Controllers;

import Models.Entities.Usuario;
import Models.Repositories.UsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private UsuarioRepository usuarioRepository;

    @Override
    public void init() {
        usuarioRepository = new UsuarioRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/vistas/usuario/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Usuario usuario = usuarioRepository.validarUsuario(username, password);
            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogueado", usuario);
                response.sendRedirect("edificios");
            } else {
                request.setAttribute("error", "Usuario o contraseña inválidos");
                request.getRequestDispatcher("/WEB-INF/vistas/usuario/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
