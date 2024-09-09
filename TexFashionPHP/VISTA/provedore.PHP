<?php
require_once '../model/funciones.php';
$proveedores = obtenerProveedores();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <title>Proveedores Registrados</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Proveedores</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="productosterminados.php">Productos Terminados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.html">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <!-- Add button -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarProveedor">
            <i class="bi bi-plus-circle"></i> Agregar Proveedor
        </button>

        <!-- Table to display suppliers -->
        <table class="table table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Documento</th>
                    <th>Nombre</th>
                    <th>Pellidos</th>
                    <th>Fecha Nacimiento</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Rol</th>
                    <th>Tipo de documento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($proveedores as $proveedor): ?>
                <tr>
                    <td><?= $proveedor['Documento'] ?></td>
                    <td><?= $proveedor['Nombre_Usuario'] ?></td>
                    <td><?= $proveedor['Apellidos'] ?></td>
                    <td><?= $proveedor['Fecha_Nacimiento'] ?></td>
                    <td><?= $proveedor['Direccion_Usuario'] ?></td>
                    <td><?= $proveedor['Telefono'] ?></td>
                    <td><?= $proveedor['Rol'] ?></td>
                    <td><?= $proveedor['TipoDoc'] ?></td>
                    <td>
                        <!-- Update button -->
                        <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalActualizarProveedor<?= $proveedor['Documento'] ?>">Actualizar</button>
                        <!-- Delete button -->
                        <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#modalEliminarProveedor<?= $proveedor['Documento'] ?>">Eliminar</button>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- Modal Agregar Proveedor -->
    <div class="modal fade" id="modalAgregarProveedor" tabindex="-1" aria-labelledby="modalAgregarProveedorLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarProveedorLabel">Agregar Proveedor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="../model/procesos.php" method="POST">
                    <div class="modal-body">
                        <div class="mb-3">
                            <select name="tipoDoc" id="">
                                <option selected disabled>Selecciona el tipo de documento</option>
                                <option value="1">Cedula Ciudadana</option>
                                <option value="2">Cedula Extrangera</option>
                                <option value="3">RUT</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="documento" class="form-label">Documento</label>
                            <input type="number" class="form-control" id="documento" name="documento" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="nit" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaN" class="form-label">Fecha Nacimineto</label>
                            <input type="date" class="form-control" id="fechaN" name="fechaN" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="number" class="form-control" id="telefono" name="telefono" required>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="formulario" value="registrarProveedor">
                        <button type="submit" class="btn btn-primary">Guardar Proveedor</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Actualizar Proveedor -->
    <?php foreach($proveedores as $proveedor): ?>
    <div class="modal fade" id="modalActualizarProveedor<?= $proveedor['Documento'] ?>" tabindex="-1" aria-labelledby="modalActualizarProveedorLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalActualizarProveedorLabel">Actualizar Proveedor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="../model/procesos.php" method="POST">
                    <div class="modal-body">
                        <div class="mb-3">
                        <input type="hidden" name="id" value="<?= $proveedor['Documento'] ?>">
                            <select name="tipoDoc" id="tipoDoc">
                                <option selected disabled>Selecciona el tipo de documento</option>
                                <option value="1">Cedula Ciudadana</option>
                                <option value="2">Cedula Extrangera</option>
                                <option value="3">RUT</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="documento" class="form-label">Documento</label>
                            <input type="text" class="form-control" id="documento" name="documento" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="nit" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaN" class="form-label">Fecha Nacimineto</label>
                            <input type="date" class="form-control" id="fechaN" name="fechaN" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="formulario" value="registrarProveedor">
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                    <input type="hidden" name="rol" values="5">
                </form>
            </div>
        </div>
    </div>
    <?php endforeach; ?>

    <!-- Modal Eliminar Proveedor -->
    <?php foreach($proveedores as $proveedor): ?>
    <div class="modal fade" id="modalEliminarProveedor<?= $proveedor['Documento'] ?>" tabindex="-1" aria-labelledby="modalEliminarProveedorLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEliminarProveedorLabel">Eliminar Proveedor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="../model/procesos.php" method="POST">
                    <div class="modal-body">
                        <p>¿Estás seguro de que deseas eliminar el proveedor <strong><?= $proveedor['Nombre_Usuario'] ?></strong>?</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<?= $proveedor['Documento'] ?>">
                        <input type="hidden" name="formulario" value="eliminarProveedor">
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php endforeach; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
