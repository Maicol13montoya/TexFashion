<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <title>Sistema de Facturación Electrónica TexFashion</title>
    <link rel="stylesheet" href="../style/Style.css">
    <style>
        /* CSS Interno para ocultar y mostrar el formulario */
        .form-section {
            display: none;
        }
    </style>
</head>

<body>
    <nav class="navbar">
        <div class="logo">
            <img src="../img/TexFashion.png" alt="Logo">
        </div>
        <ul class="nav-links">
            <a href="Ordenes.html" class="btn btn-nav">Ordenes</a>
            <a href="materiaprima.html" class="btn btn-nav">Materia Prima</a>
            <a href="productosterminados.html" class="btn btn-nav">Productos Terminados</a>
            <a href="ListaFacturacion.html" class="btn btn-nav">Lista de Facturas</a>
            <a href="login.html" class="btn btn-nav">
                <i class="bi bi-box-arrow-left"></i> Cerrar sesión
            </a>
        </ul>
    </nav>

    <main>
        <section class="search-and-actions mt-5">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <input type="text" id="searchInput" class="form-control" placeholder="Buscar...">
                <button id="toggleFormBtn" class="btn add-btn no-underline">
                    <i class="bi bi-plus-circle"></i> Agregar factura
                </button>
            </div>
        </section>

        <section class="form-section bg-white p-5 rounded shadow-sm mt-5" id="invoiceFormSection">
            <h2 class="text-center mb-4">Agregar Factura</h2>
            <form id="invoiceForm">
                <div class="mb-3">
                    <label for="cantidad" class="form-label">
                        <i class="bi bi-list-ol me-2"></i>Cantidad:
                    </label>
                    <input type="number" class="form-control" id="cantidad" name="cantidad" required>
                </div>

                <div class="mb-3">
                    <label for="fechaEmision" class="form-label">
                        <i class="bi bi-calendar-date me-2"></i>Fecha de Emisión:
                    </label>
                    <input type="date" class="form-control" id="fechaEmision" name="fechaEmision" required>
                </div>

                <div class="mb-3">
                    <label for="precioTotal" class="form-label">
                        <i class="bi bi-cash-stack me-2"></i>Precio Total:
                    </label>
                    <input type="number" class="form-control" id="precioTotal" name="precioTotal" step="0.01" required>
                </div>

                <div class="mb-3">
                    <label for="numeroFactura" class="form-label">
                        <i class="bi bi-receipt me-2"></i>Número de Factura:
                    </label>
                    <input type="text" class="form-control" id="numeroFactura" name="numeroFactura" required>
                </div>

                <div class="mb-3">
                    <label for="nombreCliente" class="form-label">
                        <i class="bi bi-person me-2"></i>Nombre del Cliente:
                    </label>
                    <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                </div>

                <div class="mb-3">
                    <label for="direccionFacturacion" class="form-label">
                        <i class="bi bi-geo-alt me-2"></i>Dirección de Facturación:
                    </label>
                    <input type="text" class="form-control" id="direccionFacturacion" name="direccionFacturacion" required>
                </div>

                <div class="mb-3">
                    <label for="estadoComprobante" class="form-label">
                        <i class="bi bi-info-circle me-2"></i>Estado del Comprobante:
                    </label>
                    <select id="estadoComprobante" name="estadoComprobante" class="form-select" required>
                        <option value="Pendiente">Pendiente</option>
                        <option value="Pagado">Pagado</option>
                        <option value="Cancelado">Cancelado</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="fechaPago" class="form-label">
                        <i class="bi bi-calendar-check me-2"></i>Fecha de Pago:
                    </label>
                    <input type="date" class="form-control" id="fechaPago" name="fechaPago">
                </div>

                <div class="mb-3">
                    <label for="referenciaPago" class="form-label">
                        <i class="bi bi-receipt-cutoff me-2"></i>Referencia de Pago:
                    </label>
                    <input type="text" class="form-control" id="referenciaPago" name="referenciaPago">
                </div>

                <button type="submit" class="btn btn-success w-100">
                    <i class="bi bi-save me-2"></i>Guardar Factura
                </button>
            </form>
        </section>

        <section class="table-container mt-5">
            <h2>Lista de Facturas</h2>
            <table id="invoiceTable">
                <thead>
                    <tr>
                        <th>Cantidad</th>
                        <th>Fecha de Emisión</th>
                        <th>Precio Total</th>
                        <th>Número de Factura</th>
                        <th>Nombre del Cliente</th>
                        <th>Dirección de Facturación</th>
                        <th>Estado del Comprobante</th>
                        <th>Fecha de Pago</th>
                        <th>Referencia de Pago</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Las filas de la tabla se llenarán dinámicamente -->
                </tbody>
            </table>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // JavaScript para alternar la visibilidad del formulario
        document.getElementById('toggleFormBtn').addEventListener('click', function() {
            var formSection = document.getElementById('invoiceFormSection');
            if (formSection.style.display === 'none' || formSection.style.display === '') {
                formSection.style.display = 'block';
            } else {
                formSection.style.display = 'none';
            }
        });
    </script>
</body>

</html>
