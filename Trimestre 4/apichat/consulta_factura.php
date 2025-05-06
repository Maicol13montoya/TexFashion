<?php
// Incluir archivo de conexión a la base de datos
include('db.php');

// Obtener el parámetro de búsqueda desde la solicitud
$referencia = isset($_GET['referencia']) ? $_GET['referencia'] : ''; // Referencia de pago o número de factura

// Verificar que la referencia no esté vacía
if (empty($referencia)) {
    echo json_encode(["response" => "Por favor, ingresa una referencia o número de factura válida."]);
    exit;
}

// Preparar la consulta SQL para buscar la factura por número de factura o referencia de pago
$sql = "SELECT * FROM facturas f JOIN productos_terminados pt ON pt.idProductos = f.Informacion_del_Producto JOIN estados e ON e.idEstados = f.Estado_Factura  WHERE f.Numero_Factura = ? OR f.Referencia_Pago = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $referencia, $referencia); // Usamos dos parámetros para la consulta
$stmt->execute();
$result = $stmt->get_result();

// Verificar si se encontró la factura
if ($result->num_rows > 0) {
    // Obtener los datos de la factura
    $factura = $result->fetch_assoc();

    // Crear la respuesta con los datos de la factura
    $response = "<h3>Factura encontrada:</h3>";
    $response .= "<strong>Número de Factura:</strong> " . $factura['Numero_Factura'] . "<br>";
    $response .= "<strong>Cantidad:</strong> " . $factura['Cantidad'] . "<br>";
    $response .= "<strong>Producto:</strong> " . $factura['Nombre_Producto'] . "<br>";
    $response .= "<strong>Fecha de Emisión:</strong> " . $factura['Fecha_de_Emision'] . "<br>";
    $response .= "<strong>Precio Total:</strong> $" . number_format($factura['Precio_Total'], 2) . "<br>";
    $response .= "<strong>Dirección de Facturación:</strong> " . $factura['Direccion_Facturacion'] . "<br>";
    $response .= "<strong>Estado de la Factura:</strong> " . $factura['Estados'] . "<br>";
    $response .= "<strong>Fecha de Pago:</strong> " . ($factura['Fecha_Pago'] ? $factura['Fecha_Pago'] : 'Pendiente') . "<br>";
    $response .= "<strong>Referencia de Pago:</strong> " . $factura['Referencia_Pago'] . "<br>";
} else {
    $response = "Lo siento, no se encontró ninguna factura con esa referencia o número de factura.";
}

$stmt->close();
$conn->close();

// Enviar la respuesta al chatbot en formato JSON
echo json_encode(["response" => $response]);
