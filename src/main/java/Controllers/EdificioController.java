package Controllers;

import Models.Entities.Edificio;
import Models.Services.EdificioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/edificios")
public class EdificioController extends HttpServlet {

    private EdificioService edificioService;

    @Override
    public void init() throws ServletException {
        super.init();
        edificioService = new EdificioService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "buscar";

        try {
            switch (action) {
                case "crear":
                    mostrarFormularioCrear(request, response);
                    break;
                case "editar":
                    mostrarFormularioEditar(request, response);
                    break;
                case "eliminar":
                    mostrarFormularioEliminar(request, response);
                    break;
                case "buscar":
                    buscarEdificio(request,response);
                    break;
                case "ver":
                    verEdificio(request, response);
                    break;
                default:
                    listarEdificios(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("crear".equals(action)) {
                crearEdificio(request, response);
            } else if ("editar".equals(action)) {
                editarEdificio(request, response);
            } else if ("eliminar".equals(action)) {
                eliminarEdificio(request, response);
            }
            else {
                response.sendRedirect("edificios");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void verEdificio(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Edificio edificio = edificioService.obtenerEdificioPorId(id);
        request.setAttribute("edificio", edificio);
        request.getRequestDispatcher("/WEB-INF/vistas/edificios/ver.jsp").forward(request, response);
    }

    private void listarEdificios(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Edificio> lista = edificioService.listarEdificios();
        request.setAttribute("edificios", lista);
        request.getRequestDispatcher("/WEB-INF/vistas/edificios/listar.jsp").forward(request, response);
    }

    private void mostrarFormularioCrear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/vistas/edificios/crear.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Edificio edificio = edificioService.obtenerEdificioPorId(id);
        request.setAttribute("edificio", edificio);
        request.getRequestDispatcher("/WEB-INF/vistas/edificios/editar.jsp").forward(request, response);
    }
    private void mostrarFormularioEliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Edificio edificio = edificioService.obtenerEdificioPorId(id);
        if (edificio == null) {
            response.sendRedirect("edificios?mensaje=Edificio no encontrado");
            return;
        }
        request.setAttribute("edificio", edificio);
        request.getRequestDispatcher("/WEB-INF/vistas/edificios/eliminar.jsp").forward(request, response);
    }


    private void crearEdificio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Edificio edificio = obtenerEdificioDesdeRequest(request);
        edificioService.crearEdificio(edificio);
        response.sendRedirect("edificios");
    }


    private void eliminarEdificio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        edificioService.eliminarEdificio(id);
        response.sendRedirect("edificios?mensaje=Edificio eliminado correctamente");
    }

    private void buscarEdificio(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String parametro = request.getParameter("parametro");
        Edificio edificio = null;

        if (parametro != null && !parametro.isEmpty()) {
            try {

                int id = Integer.parseInt(parametro);
                edificio = edificioService.obtenerEdificioPorId(id);
            } catch (NumberFormatException e) {
                edificio = edificioService.buscarPorNombre(parametro);
            }
        }

        if (edificio != null) {
            request.setAttribute("edificio", edificio);
            request.getRequestDispatcher("/WEB-INF/vistas/edificios/ver.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "No se encontró el edificio con el parámetro: " + parametro);
            request.getRequestDispatcher("/WEB-INF/vistas/edificios/buscar.jsp").forward(request, response);
        }
    }


    private void editarEdificio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Edificio edificioActual = edificioService.obtenerEdificioPorId(id);

        if (edificioActual == null) {
            response.sendRedirect("edificios?mensaje=Edificio no encontrado");
            return;
        }


        String nombre = request.getParameter("nombre");
        if (nombre != null && !nombre.trim().isEmpty()) {
            edificioActual.setNombre(nombre);
        }

        String metrosCuadradosStr = request.getParameter("metrosCuadrados");
        if (metrosCuadradosStr != null && !metrosCuadradosStr.trim().isEmpty()) {
            try {
                double metrosCuadrados = Double.parseDouble(metrosCuadradosStr);
                edificioActual.setMetrosCuadrados(metrosCuadrados);
            } catch (NumberFormatException e) {

            }
        }

        String alturaStr = request.getParameter("altura");
        if (alturaStr != null && !alturaStr.trim().isEmpty()) {
            try {
                double altura = Double.parseDouble(alturaStr);
                edificioActual.setAltura(altura);
            } catch (NumberFormatException e) {
            }
        }

        String numPisosStr = request.getParameter("numPisos");
        if (numPisosStr != null && !numPisosStr.trim().isEmpty()) {
            try {
                int numPisos = Integer.parseInt(numPisosStr);
                edificioActual.setNumPisos(numPisos);
            } catch (NumberFormatException e) {
            }
        }

        String numApartamentosStr = request.getParameter("numApartamentos");
        if (numApartamentosStr != null && !numApartamentosStr.trim().isEmpty()) {
            try {
                int numApartamentos = Integer.parseInt(numApartamentosStr);
                edificioActual.setNumApartamentos(numApartamentos);
            } catch (NumberFormatException e) {
            }
        }

        String numOficinasStr = request.getParameter("numOficinas");
        if (numOficinasStr != null && !numOficinasStr.trim().isEmpty()) {
            try {
                int numOficinas = Integer.parseInt(numOficinasStr);
                edificioActual.setNumOficinas(numOficinas);
            } catch (NumberFormatException e) {
            }
        }

        String nomParqueadero = request.getParameter("nomParqueadero");
        if (nomParqueadero != null && !nomParqueadero.trim().isEmpty()) {
            edificioActual.setNomParqueadero(nomParqueadero);
        }

        String numPisinasStr = request.getParameter("numPisinas");
        if (numPisinasStr != null && !numPisinasStr.trim().isEmpty()) {
            try {
                int numPisinas = Integer.parseInt(numPisinasStr);
                edificioActual.setNumPisinas(numPisinas);
            } catch (NumberFormatException e) {
            }
        }

        String pais = request.getParameter("pais");
        if (pais != null && !pais.trim().isEmpty()) {
            edificioActual.setPais(pais);
        }

        String departamento = request.getParameter("departamento");
        if (departamento != null && !departamento.trim().isEmpty()) {
            edificioActual.setDepartamento(departamento);
        }

        String ciudad = request.getParameter("ciudad");
        if (ciudad != null && !ciudad.trim().isEmpty()) {
            edificioActual.setCiudad(ciudad);
        }

        String tieneAsensorStr = request.getParameter("tieneAsensor");
        if (tieneAsensorStr != null) {
            edificioActual.setTieneAsensor(true);
        }

        String valorAdministracionStr = request.getParameter("valorAdministracion");
        if (valorAdministracionStr != null && !valorAdministracionStr.trim().isEmpty()) {
            try {
                double valorAdministracion = Double.parseDouble(valorAdministracionStr);
                edificioActual.setValorAdministracion(valorAdministracion);
            } catch (NumberFormatException e) {
            }
        }

        String tieneZonaSocialStr = request.getParameter("tieneZonaSocial");
        if (tieneZonaSocialStr != null) {
            edificioActual.setTieneZonaSocial(true);
        }


        edificioService.actualizarEdificio(edificioActual);
        response.sendRedirect("edificios");
    }

    private Edificio obtenerEdificioDesdeRequest(HttpServletRequest request) {
        String nombre = request.getParameter("nombre");
        double metrosCuadrados = Double.parseDouble(request.getParameter("metrosCuadrados"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        int numPisos = Integer.parseInt(request.getParameter("numPisos"));
        int numApartamentos = Integer.parseInt(request.getParameter("numApartamentos"));
        int numOficinas = Integer.parseInt(request.getParameter("numOficinas"));
        String nomParqueadero = request.getParameter("nomParqueadero");
        int numPisinas = Integer.parseInt(request.getParameter("numPisinas"));
        String pais = request.getParameter("pais");
        String departamento = request.getParameter("departamento");
        String ciudad = request.getParameter("ciudad");
        boolean tieneAsensor = "on".equals(request.getParameter("tieneAsensor"));
        double valorAdministracion = Double.parseDouble(request.getParameter("valorAdministracion"));
        boolean tieneZonaSocial = "on".equals(request.getParameter("tieneZonaSocial"));

        return new Edificio(nombre, metrosCuadrados, altura, numPisos, numApartamentos, numOficinas,
                nomParqueadero, numPisinas, pais, departamento, ciudad, tieneAsensor, valorAdministracion, tieneZonaSocial);
    }
}

