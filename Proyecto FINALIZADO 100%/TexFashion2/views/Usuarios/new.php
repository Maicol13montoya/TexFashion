<div class="card w-75 m-auto">
    <div class="card-header container">
        <h2 class="m-auto">Crear Nuevo Usuario</h2>
    </div>

    <div class="card-body">
        <form action="?controller=Usuarios&method=save" method="post" onsubmit="return validarFormulario()">
            <div class="col mb-4">
                <div class="row">
                    <div class="col">
                        <label class="form-label">Nombres</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellido" required>
                    </div>
                </div>
            </div>

            <div class="col mb-4">
                <div class="row">
                    <div class="col">
                        <label class="form-label">Tipo Documento</label>
                        <select name="tipo_doc" class="form-control" required>
                            <option value="">Seleccione...</option>
                            <?php foreach ($tipos_doc as $tipo_doc): ?>
                                <option value="<?php echo $tipo_doc->IdDocumento ?>"><?php echo $tipo_doc->TipoDocumento ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="col">
                        <label class="form-label">Documento</label>
                        <input type="number" class="form-control" name="documento" required>
                    </div>
                </div>
            </div>

            <div class="col mb-4">
                <div class="row">
                    <div class="col">
                        <label class="form-label">Correo Electrónico</label>
                        <input type="text" class="form-control" name="correo" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" required>
                    </div>
                </div>
            </div>

            <div class="col mb-4">
                <div class="row">
                    <div class="col">
                        <label class="form-label">Teléfono</label>
                        <input type="number" class="form-control" name="telefono" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fecha_nacimiento" required>
                    </div>
                </div>
            </div>

            <div class="col mb-4">
                <div class="row">
                    <div class="col">
                        <label class="form-label">Rol</label>
                        <select name="rol" class="form-control" required>
                            <option value="">Seleccione...</option>
                            <?php foreach ($roles as $rol): ?>
                                <option value="<?php echo $rol->idRol ?>"><?php echo $rol->Rol ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group d-flex justify-content-center">
                <button class="btn btn-primary" id="submit">Guardar</button>
            </div>
        </form>
    </div>
</div>
<script>
    function validarFormulario() {
        // Validar nombre
        var nombre = document.querySelector('[name="nombre"]').value;
        var soloLetras = /^[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+$/;
        if (!soloLetras.test(nombre)) {
            alert("El campo 'Nombres' solo puede contener letras.");
            return false;
        }

        // Validar apellido
        var apellido = document.querySelector('[name="apellido"]').value;
        if (!soloLetras.test(apellido)) {
            alert("El campo 'Apellidos' solo puede contener letras.");
            return false;
        }

        // Obtener el valor del documento
        var documento = document.querySelector('[name="documento"]').value;
        if (documento.length !== 10) {
            alert("El documento debe tener exactamente 10 caracteres.");
            return false;
        }

        // Obtener el valor del teléfono
        var telefono = document.querySelector('[name="telefono"]').value;
        if (telefono.length !== 10) {
            alert("El número de teléfono debe tener exactamente 10 dígitos.");
            return false;
        }

        // Validar edad
        var fechaNacimiento = new Date(document.querySelector('[name="fecha_nacimiento"]').value);
        var fechaActual = new Date();
        var edad = fechaActual.getFullYear() - fechaNacimiento.getFullYear();
        var mes = fechaActual.getMonth() - fechaNacimiento.getMonth();
        if (mes < 0 || (mes === 0 && fechaActual.getDate() < fechaNacimiento.getDate())) {
            edad--;
        }
        if (edad < 18) {
            alert("Debe ser mayor de 18 años.");
            return false;
        }

        return true;
    }
</script>