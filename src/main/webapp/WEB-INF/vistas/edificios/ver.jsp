<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Entities.Edificio" %>
<%
  Edificio edificio = (Edificio) request.getAttribute("edificio");
  if (edificio == null) {
    response.sendRedirect("edificios?action=buscar");
    return;
  }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ver Edificio - <%= edificio.getNombre() %></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="">Edificios</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="?action=listar">Listar</a></li>
        <li class="nav-item"><a class="nav-link" href="?action=buscar">Buscar</a></li>
        <li class="nav-item"><a class="nav-link" href="?action=crear">Crear</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h1>Detalle del Edificio: <%= edificio.getNombre() %></h1>

  <table class="table table-bordered">
    <tbody>
    <tr><th>ID</th><td><%= edificio.getId() %></td></tr>
    <tr><th>Nombre</th><td><%= edificio.getNombre() %></td></tr>
    <tr><th>Metros Cuadrados</th><td><%= edificio.getMetrosCuadrados() %></td></tr>
    <tr><th>Altura</th><td><%= edificio.getAltura() %></td></tr>
    <tr><th>Valor Administración</th><td><%= edificio.getValorAdministracion() %></td></tr>
    <tr><th>Número de Pisos</th><td><%= edificio.getNumPisos() %></td></tr>
    <tr><th>Número de Apartamentos</th><td><%= edificio.getNumApartamentos() %></td></tr>
    <tr><th>Número de Oficinas</th><td><%= edificio.getNumOficinas() %></td></tr>
    <tr><th>Nombre Parqueadero</th><td><%= edificio.getNomParqueadero() %></td></tr>
    <tr><th>Número de Piscinas</th><td><%= edificio.getNumPisinas() %></td></tr>
    <tr><th>País</th><td><%= edificio.getPais() %></td></tr>
    <tr><th>Departamento</th><td><%= edificio.getDepartamento() %></td></tr>
    <tr><th>Ciudad</th><td><%= edificio.getCiudad() %></td></tr>
    <tr><th>¿Tiene Ascensor?</th><td><%= edificio.isTieneAsensor() ? "Sí" : "No" %></td></tr>
    <tr><th>¿Tiene Zona Social?</th><td><%= edificio.isTieneZonaSocial() ? "Sí" : "No" %></td></tr>
    </tbody>
  </table>

  <a href="?action=editar&id=<%= edificio.getId() %>" class="btn btn-warning me-2">Editar</a>
  <a href="?action=eliminar&id=<%= edificio.getId() %>" class="btn btn-danger"
     onclick="return confirm('¿Seguro que desea eliminar este edificio?');">Eliminar</a>
  <a href="?action=listar" class="btn btn-secondary ms-2">Volver a Listar</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

