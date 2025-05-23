<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Eliminar Edificio</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
  <div class="card border-danger">
    <div class="card-header bg-danger text-white">
      <h3 class="mb-0">Confirmar eliminación</h3>
    </div>
    <div class="card-body">
      <p class="lead">¿Está seguro que desea eliminar este edificio?</p>

      <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Nombre:</strong> ${edificio.nombre}</li>
        <li class="list-group-item"><strong>Ciudad:</strong> ${edificio.ciudad}</li>
        <li class="list-group-item"><strong>Departamento:</strong> ${edificio.departamento}</li>
      </ul>

      <form action="edificios" method="post">
        <input type="hidden" name="action" value="eliminar" />
        <input type="hidden" name="id" value="${edificio.id}" />

        <button type="submit" class="btn btn-danger me-2">Eliminar</button>
        <a href="edificios" class="btn btn-secondary">Cancelar</a>
      </form>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


