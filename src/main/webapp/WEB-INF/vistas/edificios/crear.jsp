<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Crear Edificio</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<div class="container mt-4">
  <h1 class="mb-4">Crear Edificio</h1>
  <form id="crearEdificioForm" action="?action=crear" method="post" onsubmit="return validarFormulario();">

    <div class="mb-3">
      <label for="nombre" class="form-label">Nombre</label>
      <input type="text" class="form-control" id="nombre" name="nombre" required>
      <div id="errorNombre" class="invalid-feedback" style="display:none;">
        Solo letras y espacios permitidos.
      </div>
    </div>

    <div class="row">

      <div class="mb-3 col-md-4">
        <label for="metrosCuadrados" class="form-label">Metros Cuadrados</label>
        <input type="number" step="0.01" class="form-control" id="metrosCuadrados" name="metrosCuadrados" required>
        <div id="errorMetrosCuadrados" class="invalid-feedback" style="display:none;">
          Debe ser un número positivo.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="altura" class="form-label">Altura</label>
        <input type="number" step="0.01" class="form-control" id="altura" name="altura" required>
        <div id="errorAltura" class="invalid-feedback" style="display:none;">
          Debe ser un número positivo.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="valorAdministracion" class="form-label">Valor Administración</label>
        <input type="number" step="0.01" class="form-control" id="valorAdministracion" name="valorAdministracion" required>
        <div id="errorValorAdministracion" class="invalid-feedback" style="display:none;">
          Debe ser un número positivo.
        </div>
      </div>
    </div>

    <div class="row">

      <div class="mb-3 col-md-4">
        <label for="numPisos" class="form-label">Número de Pisos</label>
        <input type="number" class="form-control" id="numPisos" name="numPisos" required>
        <div id="errorNumPisos" class="invalid-feedback" style="display:none;">
          Debe ser un entero positivo.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="numApartamentos" class="form-label">Número de Apartamentos</label>
        <input type="number" class="form-control" id="numApartamentos" name="numApartamentos" required>
        <div id="errorNumApartamentos" class="invalid-feedback" style="display:none;">
          Debe ser un entero positivo.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="numOficinas" class="form-label">Número de Oficinas</label>
        <input type="number" class="form-control" id="numOficinas" name="numOficinas" required>
        <div id="errorNumOficinas" class="invalid-feedback" style="display:none;">
          Debe ser un entero positivo.
        </div>
      </div>
    </div>

    <div class="row">

      <div class="mb-3 col-md-6">
        <label for="nomParqueadero" class="form-label">Nombre Parqueadero</label>
        <input type="text" class="form-control" id="nomParqueadero" name="nomParqueadero">
        <div id="errorNomParqueadero" class="invalid-feedback" style="display:none;">
          Solo letras y espacios permitidos.
        </div>
      </div>


      <div class="mb-3 col-md-6">
        <label for="numPisinas" class="form-label">Número de Piscinas</label>
        <input type="number" class="form-control" id="numPisinas" name="numPisinas">
        <div id="errorNumPisinas" class="invalid-feedback" style="display:none;">
          Debe ser un entero positivo.
        </div>
      </div>
    </div>

    <div class="row">

      <div class="mb-3 col-md-4">
        <label for="pais" class="form-label">País</label>
        <input type="text" class="form-control" id="pais" name="pais" required>
        <div id="errorPais" class="invalid-feedback" style="display:none;">
          Solo letras y espacios permitidos.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="departamento" class="form-label">Departamento</label>
        <input type="text" class="form-control" id="departamento" name="departamento" required>
        <div id="errorDepartamento" class="invalid-feedback" style="display:none;">
          Solo letras y espacios permitidos.
        </div>
      </div>


      <div class="mb-3 col-md-4">
        <label for="ciudad" class="form-label">Ciudad</label>
        <input type="text" class="form-control" id="ciudad" name="ciudad" required>
        <div id="errorCiudad" class="invalid-feedback" style="display:none;">
          Solo letras y espacios permitidos.
        </div>
      </div>
    </div>

    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" id="tieneAsensor" name="tieneAsensor">
      <label class="form-check-label" for="tieneAsensor">Tiene Ascensor</label>
    </div>

    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" id="tieneZonaSocial" name="tieneZonaSocial">
      <label class="form-check-label" for="tieneZonaSocial">Tiene Zona Social</label>
    </div>

    <button type="submit" class="btn btn-primary">Crear Edificio</button>
    <a href="?action=listar" class="btn btn-secondary ms-2">Cancelar</a>
  </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function validarFormulario() {
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

    function validarTexto(id, errorId) {
      const campo = document.getElementById(id);
      const valor = campo.value.trim();
      if (!valor || !soloLetras.test(valor)) {
        marcarError(id, errorId, true);
        campo.focus();
        return false;
      }
      marcarError(id, errorId, false);
      return true;
    }

    function validarTextoOpcional(id, errorId) {
      const campo = document.getElementById(id);
      const valor = campo.value.trim();
      if (valor && !soloLetras.test(valor)) {
        marcarError(id, errorId, true);
        campo.focus();
        return false;
      }
      marcarError(id, errorId, false);
      return true;
    }

    function validarNumeroPositivo(id, errorId, esEntero = false) {
      const campo = document.getElementById(id);
      const valor = campo.value.trim();
      if (!valor || isNaN(valor) || Number(valor) <= 0 || (esEntero && !Number.isInteger(Number(valor)))) {
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
      if (valor && (isNaN(valor) || Number(valor) < 0 || (esEntero && !Number.isInteger(Number(valor))))) {
        marcarError(id, errorId, true);
        campo.focus();
        return false;
      }
      marcarError(id, errorId, false);
      return true;
    }

    if (!validarTexto('nombre', 'errorNombre')) return false;
    if (!validarNumeroPositivo('metrosCuadrados', 'errorMetrosCuadrados')) return false;
    if (!validarNumeroPositivo('altura', 'errorAltura')) return false;
    if (!validarNumeroPositivo('valorAdministracion', 'errorValorAdministracion')) return false;
    if (!validarNumeroPositivo('numPisos', 'errorNumPisos', true)) return false;
    if (!validarNumeroPositivo('numApartamentos', 'errorNumApartamentos', true)) return false;
    if (!validarNumeroPositivo('numOficinas', 'errorNumOficinas', true)) return false;
    if (!validarTextoOpcional('nomParqueadero', 'errorNomParqueadero')) return false;
    if (!validarNumeroPositivoOpcional('numPisinas', 'errorNumPisinas', true)) return false;
    if (!validarTexto('pais', 'errorPais')) return false;
    if (!validarTexto('departamento', 'errorDepartamento')) return false;
    if (!validarTexto('ciudad', 'errorCiudad')) return false;

    return true;
  }
</script>

</body>
</html>




