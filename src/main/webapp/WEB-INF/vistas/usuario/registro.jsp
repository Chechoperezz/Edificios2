<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-4">

<h2>Registro de nuevo usuario</h2>

<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<form method="post" action="registro">
    <div class="mb-3">
        <label for="username" class="form-label">Usuario</label>
        <input type="text" name="username" required class="form-control"/>
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Contraseña</label>
        <input type="password" name="password" required class="form-control"/>
    </div>
    <button type="submit" class="btn btn-primary">Registrarse</button>
</form>

<p class="mt-3">¿Ya tienes cuenta? <a href="login">Inicia sesión</a></p>

</body>
</html>
