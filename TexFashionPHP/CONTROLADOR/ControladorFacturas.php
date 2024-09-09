<?php
require_once '../MODELO/ModeloFacturas.php';

// Crear una instancia del modelo Facturas
$gestorFacturas = new Facturas();

// Obtener la acción deseada desde el formulario
$elegirAcciones = isset($_POST['Acciones']) ? $_POST['Acciones'] : 'Cargar';

// Ejecutar la acción correspondiente
switch ($elegirAcciones) {
    case 'Crear Factura':
        // Validar y sanitizar los datos antes de usarlos
        $idFactura = $_POST['idFactura'];
        $Cantidad = $_POST['Cantidad'];
        $Informacion_del_Producto = $_POST['Informacion_del_Producto'];
        $Fecha_de_Emision = $_POST['Fecha_de_Emision'];
        $Precio_Total = $_POST['Precio_Total'];
        $Numero_Factura = $_POST['Numero_Factura'];
        $idCliente = $_POST['idCliente'];
        $Direccion_Facturacion = $_POST['Direccion_Facturacion']; // Corregido
        $Estado_Factura = $_POST['Estado_Factura'];
        $Fecha_Pago = $_POST['Fecha_Pago'];
        $Referencia_Pago = $_POST['Referencia_Pago'];

        $gestorFacturas->agregarFactura(
            $idFactura,
            $Cantidad,
            $Informacion_del_Producto,
            $Fecha_de_Emision,
            $Precio_Total,
            $Numero_Factura,
            $idCliente,
            $Direccion_Facturacion,
            $Estado_Factura,
            $Fecha_Pago,
            $Referencia_Pago
        );
        break;

    case 'Actualizar Factura':
        $idFactura = $_POST['idFactura'];
        $Estado_Factura = $_POST['Estado_Factura'];

        $gestorFacturas->actualizarFactura($idFactura, $Estado_Factura);
        break;

    case 'Borrar Factura':
        $idFactura = $_POST['idFactura'];
        $gestorFacturas->borrarFactura($idFactura);
        break;

    case 'Buscar Factura':
        $idFactura = $_POST['idFactura'];
        $resultado = $gestorFacturas->consultarFactura($idFactura);
        break;

    default:
        // Consultar todas las facturas si no se especifica ninguna acción
        $resultado = $gestorFacturas->consultarFactura();
        break;
}

// Incluir la vista para mostrar los resultados
include "../VISTA/ListaFacturacion.php";
?>
