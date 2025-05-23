<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.Entities.Edificio" %>
<%
    List<Edificio> edificios = (List<Edificio>) request.getAttribute("edificios");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Edificios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="">Edificios</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="?action=listar">Listar</a></li>
                <li class="nav-item"><a class="nav-link" href="?action=buscar">Buscar</a></li>
                <li class="nav-item"><a class="nav-link" href="?action=crear">Crear</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h1>Lista de Edificios</h1>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Ciudad</th>
            <th>Pais</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (edificios != null && !edificios.isEmpty()) {
                for (Edificio edificio : edificios) {
        %>
        <tr>
            <td><%= edificio.getId() %></td>
            <td><%= edificio.getNombre() %></td>
            <td><%= edificio.getCiudad() %></td>
            <td><%= edificio.getPais() %></td>
            <td>
                <a href="?action=ver&id=<%= edificio.getId() %>" class="btn btn-info btn-sm">Ver</a>
                <a href="?action=editar&id=<%= edificio.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                <a href="?action=eliminar&id=<%= edificio.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que desea eliminar este edificio?');">Eliminar</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center">No hay edificios registrados.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="?action=crear" class="btn btn-success">Crear Nuevo Edificio</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
