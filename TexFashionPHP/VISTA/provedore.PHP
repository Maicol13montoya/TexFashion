<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <title>Proveedores Registrados</title>
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

        </a>
        <a href="login.html" class="btn btn-nav">
            <i class="bi bi-box-arrow-left"></i> Cerrar sesión
        </a>

    </ul>
    </nav>
    <br>
    <br>
    <h1>Proveedores Registrados</h1>
    <br>
    <br>
    <a href="AgregarProveedores.html" class="btn add-btn no-underline">
        <i class="bi bi-plus-circle"></i> Agregar proveedor

    </a>
    <br>
    <br>
    <div id="proveedoresContainer">
        <!-- Los proveedores se agregarán aquí dinámicamente -->
    </div>

    <script>
        // Datos de ejemplo, en un caso real podrías obtener estos datos desde un servidor
        const proveedores = [
            {
                idProveedores: '001',
                nombreEmpresa: 'Empresa A',
                telefono: '123-456-7890',
                nit: '1234567890',
                direccion: 'Calle Falsa 123',
                producto_idProducto: '1001'
            },
            {
                idProveedores: '002',
                nombreEmpresa: 'Empresa B',
                telefono: '098-765-4321',
                nit: '0987654321',
                direccion: 'Avenida Real 456',
                producto_idProducto: '1002'
            },
            // Puedes agregar más proveedores aquí
        ];

        const proveedoresContainer = document.getElementById('proveedoresContainer');

        proveedores.forEach(proveedor => {
            const proveedorDiv = document.createElement('div');
            proveedorDiv.className = 'proveedor';

            proveedorDiv.innerHTML = `
                <h3>ID: ${proveedor.idProveedores}</h3>
                <p><strong>Nombre Empresa:</strong> ${proveedor.nombreEmpresa}</p>
                <p><strong>Teléfono:</strong> ${proveedor.telefono}</p>
                <p><strong>NIT:</strong> ${proveedor.nit}</p>
                <p><strong>Dirección:</strong> ${proveedor.direccion}</p>
                <p><strong>ID Producto:</strong> ${proveedor.producto_idProducto}</p>
            `;

            proveedoresContainer.appendChild(proveedorDiv);
        });
    </script>
</body>

</html>