<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Editar Edificio</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2>Editar Edificio</h2>

  <form id="editarEdificioForm" action="" method="post" onsubmit="return validarFormularioEditar();">
    <input type="hidden" name="action" value="editar" />
    <input type="hidden" name="id" value="${edificio.id}" />

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Nombre:</label>
        <input type="text" name="nombre" id="nombre" class="form-control" value="${edificio.nombre}" />
        <div id="errorNombre" class="invalid-feedback">Solo letras y espacios permitidos.</div>
      </div>
      <div class="col">
        <label class="form-label">Metros Cuadrados:</label>
        <input type="number" name="metrosCuadrados" id="metrosCuadrados" step="0.01" class="form-control" value="${edificio.metrosCuadrados}" />
        <div id="errorMetrosCuadrados" class="invalid-feedback">Debe ser un número positivo.</div>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Altura:</label>
        <input type="number" name="altura" id="altura" step="0.01" class="form-control" value="${edificio.altura}" />
        <div id="errorAltura" class="invalid-feedback">Debe ser un número positivo.</div>
      </div>
      <div class="col">
        <label class="form-label">Número de Pisos:</label>
        <input type="number" name="numPisos" id="numPisos" class="form-control" value="${edificio.numPisos}" />
        <div id="errorNumPisos" class="invalid-feedback">Debe ser un entero positivo.</div>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Número de Apartamentos:</label>
        <input type="number" name="numApartamentos" id="numApartamentos" class="form-control" value="${edificio.numApartamentos}" />
        <div id="errorNumApartamentos" class="invalid-feedback">Debe ser un entero positivo.</div>
      </div>
      <div class="col">
        <label class="form-label">Número de Oficinas:</label>
        <input type="number" name="numOficinas" id="numOficinas" class="form-control" value="${edificio.numOficinas}" />
        <div id="errorNumOficinas" class="invalid-feedback">Debe ser un entero positivo.</div>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Nombre del Parqueadero:</label>
        <input type="text" name="nomParqueadero" id="nomParqueadero" class="form-control" value="${edificio.nomParqueadero}" />
        <div id="errorNomParqueadero" class="invalid-feedback">Solo letras y espacios permitidos.</div>
      </div>
      <div class="col">
        <label class="form-label">Número de Piscinas:</label>
        <input type="number" name="numPisinas" id="numPisinas" class="form-control" value="${edificio.numPisinas}" />
        <div id="errorNumPisinas" class="invalid-feedback">Debe ser un entero positivo.</div>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">País:</label>
        <input type="text" name="pais" id="pais" class="form-control" value="${edificio.pais}" />
        <div id="errorPais" class="invalid-feedback">Solo letras y espacios permitidos.</div>
      </div>
      <div class="col">
        <label class="form-label">Departamento:</label>
        <input type="text" name="departamento" id="departamento" class="form-control" value="${edificio.departamento}" />
        <div id="errorDepartamento" class="invalid-feedback">Solo letras y espacios permitidos.</div>
      </div>
      <div class="col">
        <label class="form-label">Ciudad:</label>
        <input type="text" name="ciudad" id="ciudad" class="form-control" value="${edificio.ciudad}" />
        <div id="errorCiudad" class="invalid-feedback">Solo letras y espacios permitidos.</div>
      </div>
    </div>

    <div class="form-check mb-2">
      <input class="form-check-input" type="checkbox" name="tieneAsensor" id="tieneAsensor"
      ${edificio.tieneAsensor ? "checked" : ""}>
      <label class="form-check-label" for="tieneAsensor">Tiene Ascensor</label>
    </div>

    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" name="tieneZonaSocial" id="tieneZonaSocial"
      ${edificio.tieneZonaSocial ? "checked" : ""}>
      <label class="form-check-label" for="tieneZonaSocial">Tiene Zona Social</label>
    </div>

    <div class="mb-3">
      <label class="form-label">Valor Administración:</label>
      <input type="number" step="0.01" name="valorAdministracion" id="valorAdministracion" class="form-control" value="${edificio.valorAdministracion}" />
      <div id="errorValorAdministracion" class="invalid-feedback">Debe ser un número positivo.</div>
    </div>

    <button type="submit" class="btn btn-success">Actualizar</button>
    <a href="?action=listar" class="btn btn-secondary">Cancelar</a>
  </form>
</div>

<script>
  function validarFormularioEditar() {
    const soloLetras = /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/;

    function marcarError(campoId, errorId, tieneError) {
      const campo = document.getElementById(campoId);
      const error = document.getElementById(errorId);
      if (tieneError) {
        campo.classList.add('is-invalid');
        error.style.display = 'block';
      } else {
        campo.classList.remove('is-invalid');
        error.style.display = 'none';
      }
    }

    function validarTextoOpcional(id, errorId) {
      const campo = document.getElementById(id);
      const valor = campo.value.trim();
      if (valor !== "" && !soloLetras.test(valor)) {
        marcarError(id, errorId, true);
        campo.focus();
        return false;
      }
      marcarError(id, errorId, false);
      return true;
    }

    function validarNumeroPositivoOpcional(id, errorId, esEntero = false) {
      const campo = document.getElementById(id);
      const valor = campo.value.trim();
      if (valor !== "") {
        if (isNaN(valor) || Number(valor) <= 0 || (esEntero && !Number.isInteger(Number(valor)))) {
          marcarError(id, errorId, true);
          campo.focus();
          return false;
        }
      }
      marcarError(id, errorId, false);
      return true;
    }

    if (!validarTextoOpcional('nombre', 'errorNombre')) return false;
    if (!validarNumeroPositivoOpcional('metrosCuadrados', 'errorMetrosCuadrados')) return false;
    if (!validarNumeroPositivoOpcional('altura', 'errorAltura')) return false;
    if (!validarNumeroPositivoOpcional('numPisos', 'errorNumPisos', true)) return false;
    if (!validarNumeroPositivoOpcional('numApartamentos', 'errorNumApartamentos', true)) return false;
    if (!validarNumeroPositivoOpcional('numOficinas', 'errorNumOficinas', true)) return false;
    if (!validarTextoOpcional('nomParqueadero', 'errorNomParqueadero')) return false;
    if (!validarNumeroPositivoOpcional('numPisinas', 'errorNumPisinas', true)) return false;
    if (!validarTextoOpcional('pais', 'errorPais')) return false;
    if (!validarTextoOpcional('departamento', 'errorDepartamento')) return false;
    if (!validarTextoOpcional('ciudad', 'errorCiudad')) return false;
    if (!validarNumeroPositivoOpcional('valorAdministracion', 'errorValorAdministracion')) return false;

    return true;
  }
</script>
</body>
</html>



