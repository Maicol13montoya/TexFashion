<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css"
        rel="stylesheet">
    <title>Tabla de Órdenes</title>
    <link rel="stylesheet" href="./style/Style.css">
</head>

<body>
    <nav class="navbar">
        <div class="logo">
            <img src="./img/TexFashion.png" alt="Logo">
        </div>
        <ul class="nav-links">

           
            <a href="materiaprima.html" class="btn btn-nav">Materia Prima</a>
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
            <a href="Agregar Ordenes.html" class="btn add-btn no-underline">
                <i class="bi bi-plus-circle"></i> Agregar Orden
            </a>
        </button>
        <table id="ordersTable">
            <thead>
                <tr>
                    <br>
                    <br>

                    <th>ID de Orden</th>
                    <th>Fecha Orden</th>
                    <th>Estado Orden</th>
                    <th>Total Total</th>
                    <th>Documento Cliente</th>
                    <th>Cantidad Producto</th>
                    <th>Nombre del Producto</th>
                    <th>Método de Pago</th>
                    <th>Fecha Entrega</th>
                    <th>Comprobante ID</th>
                    <th>Materia Prima ID</th>
                    <th>Notas</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ORD12345</td>
                    <td>2024-08-01</td>
                    <td>Enviado</td>
                    <td>$450.00</td>
                    <td>123456789</td>
                    <td>20</td>
                    <td>Producto A</td>
                    <td>Tarjeta de Crédito</td>
                    <td>2024-08-10</td>
                    <td>COM123</td>
                    <td>MP456</td>
                    <td>Entrega en fin de semana</td>
                    <td>
                        <button class="btn update-btn">
                            <i class="bi bi-arrow-clockwise"></i> Actualizar
                        </button>
                        <BR></BR>
                        <button class="btn delete-btn" onclick="confirmDelete()">
                            <i class="bi bi-trash" style="font-size: 1.2rem;"></i> Eliminar
                        </button>
                    </td>
                </tr>
                <!-- Más filas aquí -->
            </tbody>
        </table>
    </div>

    <script src="Script.js"></script>
</body>

</html>