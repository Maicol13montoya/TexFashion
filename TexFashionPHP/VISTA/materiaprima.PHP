<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css"
        rel="stylesheet">
    <link rel="stylesheet" href="./style/Style.css">
    <title>Materia Prima</title>
</head>

<body>
    <nav class="navbar">
        <div class="logo">
            <img src="./img/TexFashion.png" alt="Logo">
        </div>
        <ul class="nav-links">

           
            <a href="Ordenes.html" class="btn btn-nav">Ordenes</a>
            <a href="productosterminados.html" class="btn btn-nav">Productos Terminados </a>
            <a href="login.html" class="btn btn-nav">
                <i class="bi bi-box-arrow-left"></i> Cerrar sesión
            </a>
        </ul>
    </nav>
    <div class="table-container">


        <br>

        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" id="searchInput" class="form-control" placeholder="Buscar...">




        </div>



        <br>
        <button class="btn add-btn">
            <a href="Agregar Materia Prima.html" class="btn add-btn no-underline">
                <i class="bi bi-plus-circle"></i> Agregar materia prima
            </a>
        </button>

        <br>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Fecha de Ingreso</th>
                    <th>Precio Unidad</th>
                    <th>Cantidad Stock</th>
                    <th>Proveedor</th>
                    <th>Categoría</th>
                    <th>Unidad Medida</th>
                    <th>Fecha Actualización</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            </br>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Harina</td>
                    <td>Harina de trigo</td>
                    <td>2024-12-31</td>
                    <td>$10.00</td>
                    <td>50 kg</td>
                    <td>Molino Central</td>
                    <td>Granos</td>
                    <td>Kilogramos</td>
                    <td>2024-12-31</td>
                    <td>Disponible</td>
                    <td>

                        <button class="btn update-btn">
                            <i class="bi bi-arrow-clockwise"></i> Actualizar
                        </button>
                        <br><br>
                        <button class="btn delete-btn" onclick="confirmDelete()">
                            <i class="bi bi-trash" style="font-size: 1.2rem;"></i> Eliminar
                        </button>
    </div>
    </td>
    </tr>
    </tbody>
    </table>
    <script src="Script.js"></script>
    </div>








</body>

</html>