<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Buscar Edificio</title>
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
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="?action=buscar">Buscar</a></li>
        <li class="nav-item"><a class="nav-link" href="?action=crear">Crear</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h1>Buscar Edificio</h1>
  <form action="?action=buscar" method="get" class="row g-3 align-items-center">
    <div class="col-auto">
      <label for="criterio" class="col-form-label">Nombre o ID:</label>
    </div>
    <div class="col-auto">
      <input type="text" id="parametro" name="parametro" class="form-control" placeholder="Ingrese nombre o ID" required>
    </div>
    <div class="col-auto">
      <button type="submit" class="btn btn-primary">Buscar</button>
    </div>
  </form>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

