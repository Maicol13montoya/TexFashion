<?php
require_once '../model/funciones.php';
require_once '../model/procesos.php';
$productos = obtenerProductosT();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style/Style.css">
    <title>Productos Terminados</title>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="./img/TexFashion.png" alt="Logo" width="30" height="30">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Ordenes.html">Ordenes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="materiaprima.html">Materia Prima</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.html">
                            <i class="bi bi-box-arrow-left"></i> Cerrar sesión
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Table and controls -->
    <div class="container mt-5">
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <input type="text" id="searchInput" class="form-control" placeholder="Buscar...">
                </div>
            </div>
            <div class="col-md-6 text-end">
                <!-- Button trigger modal for adding a product -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
                    <i class="bi bi-plus-circle"></i> Agregar producto
                </button>

                <!-- Modal for adding product -->
                <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Agregar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                            <form action="" method="post">
                                    <input type="hidden" name="formulario" value="registrarProducto">

                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre del Producto</label>
                                        <input type="text" name="nombre" class="form-control" placeholder="Nombre del producto" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="cantidad" class="form-label">Cantidad Disponible</label>
                                        <input type="number" name="cantidad" class="form-control" placeholder="Cantidad disponible" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="descripcion" class="form-label">Descripción</label>
                                        <input type="text" name="descripcion" class="form-control" placeholder="Descripción del producto" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="fechaE" class="form-label">Fecha de Entrada</label>
                                        <input type="date" name="fechaE" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="fechaS" class="form-label">Fecha de Salida</label>
                                        <input type="date" name="fechaS" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="estado" class="form-label">Estado</label>
                                        <select name="estado" class="form-select" aria-label="Seleccione el estado" required>
                                            <option selected disabled>Selecciona el estado</option>
                                            <option value="1">Disponible</option>
                                            <option value="2">No disponible</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="idMP" class="form-label">Materia Prima</label>
                                        <select name="idMP" class="form-select" aria-label="Seleccione materia prima" required>
                                            <option selected disabled>Selecciona la materia prima</option>
                                            <option value="1">Algodón</option>
                                            <option value="2">Mezclilla</option>
                                            <option value="3">Cuero Sintético</option>
                                            <option value="4">Seda</option>
                                            <option value="5">Cuero Natural</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Registrar</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table to display products -->
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre producto</th>
                    <th>Cantidad disponible</th>
                    <th>Descripción</th>
                    <th>Fecha entrada</th>
                    <th>Fecha salida</th>
                    <th>Estado</th>
                    <th>Orden</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($productos as $producto): ?>
                    <td><?= $producto['idProductos']?></td>
                    <td><?= $producto['Nombre_Producto']?></td>
                    <td><?= $producto['Cantidad_Disponible']?></td>
                    <td><?= $producto['Descripcion']?></td>
                    <td><?= $producto['Fecha_Entrada']?></td>
                    <td><?= $producto['Fecha_Salida']?></td>
                    <td><?= $producto['Estado']?></td>
                    <td><?= $producto['idmateria_prima']?></td>
                    <td>
                        <!-- Update button and modal -->
                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModalUpdate<?= $producto['idProductos'] ?>">
                        <i class="bi bi-arrow-clockwise"></i> Actualizar
                        </button>

                        <!-- Modal for updating product -->
                        <div class="modal fade" id="exampleModalUpdate<?= $producto['idProductos'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Actualizar Producto</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="" method="post">
                                            <input type="hidden" name="formulario" value="actualizarProducto">
                                            <input type="hidden" name="id" value="<?= $producto['idProductos']?>">
                                            
                                            <form action="" method="post">
                                            <input type="hidden" name="formulario" value="actualizarProducto">
                                            <input type="hidden" name="id" value="<?= $producto['idProductos']?>">
                                            <div class="mb-3">
                                                <label for="nombre" class="form-label">Nombre del Producto</label>
                                                <input type="text" name="nombre" class="form-control" placeholder="Nombre del producto" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="cantidad" class="form-label">Cantidad Disponible</label>
                                                <input type="number" name="cantidad" class="form-control" placeholder="Cantidad disponible" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="descripcion" class="form-label">Descripción</label>
                                                <input type="text" name="descripcion" class="form-control" placeholder="Descripción del producto" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="fechaE" class="form-label">Fecha de Entrada</label>
                                                <input type="date" name="fechaE" class="form-control" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="fechaS" class="form-label">Fecha de Salida</label>
                                                <input type="date" name="fechaS" class="form-control" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="estado" class="form-label">Estado</label>
                                                <select name="estado" class="form-select" aria-label="Seleccione el estado" required>
                                                    <option selected disabled>Selecciona el estado</option>
                                                    <option value="1">Disponible</option>
                                                    <option value="2">No disponible</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <label for="idMP" class="form-label">Materia Prima</label>
                                                <select name="idMP" class="form-select" aria-label="Seleccione materia prima" required>
                                                    <option selected disabled>Selecciona la materia prima</option>
                                                    <option value="1">Algodón</option>
                                                    <option value="2">Mezclilla</option>
                                                    <option value="3">Cuero Sintético</option>
                                                    <option value="4">Seda</option>
                                                    <option value="5">Cuero Natural</option>
                                                </select>
                                            </div>

                                            <button type="submit" class="btn btn-primary">Actualizar</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Delete button and modal -->
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModalDelete<?= $producto['idProductos'] ?>">
                            <i class="bi bi-trash"></i> Eliminar
                        </button>

                        <!-- Modal for deleting product -->
                        <div class="modal fade" id="exampleModalDelete<?= $producto['idProductos'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Confirmar Eliminación</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>¿Estás seguro de que deseas eliminar el producto <strong><?= $producto['Nombre_Producto'] ?></strong>?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="" method="post">
                                            <input type="hidden" name="formulario" value="eliminarProducto">
                                            <input type="hidden" name="id" value="<?= $producto['idProductos']?>">
                                            <button type="submit" class="btn btn-danger">Eliminar</button>
                                        </form>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Script.js"></script>
</body>

</html>
