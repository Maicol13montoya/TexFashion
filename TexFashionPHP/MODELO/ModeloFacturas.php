<?php
// Incluye el archivo de conexión
include 'conexion.php';

// Definición de la clase Facturas
class Facturas {
    private $idFactura;
    private $Cantidad;
    private $Informacion_del_Producto;
    private $Fecha_de_Emision;
    private $Precio_Total;
    private $Numero_Factura;
    private $idCliente;
    private $Direccion_Facturacion;
    private $Estado_Factura;
    private $Fecha_Pago;
    private $Referencia_Pago;
    private $Conexion;

    // Constructor de la clase
    public function __construct($idFactura = null, $Cantidad = null, $Informacion_del_Producto = null, $Fecha_de_Emision = null, $Precio_Total = null, $Numero_Factura = null, $idCliente = null, $Direccion_Facturacion = null, $Estado_Factura = null, $Fecha_Pago = null, $Referencia_Pago = null) {
        $this->idFactura = $idFactura;
        $this->Cantidad = $Cantidad;
        $this->Informacion_del_Producto = $Informacion_del_Producto;
        $this->Fecha_de_Emision = $Fecha_de_Emision;
        $this->Precio_Total = $Precio_Total;
        $this->Numero_Factura = $Numero_Factura;
        $this->idCliente = $idCliente;
        $this->Direccion_Facturacion = $Direccion_Facturacion;
        $this->Estado_Factura = $Estado_Factura;
        $this->Fecha_Pago = $Fecha_Pago;
        $this->Referencia_Pago = $Referencia_Pago;
        
        // Establece la conexión a la base de datos
        $this->Conexion = Conectarse();
    }

    // Método para agregar una factura
    public function agregarFactura($idFactura, $Cantidad, $Informacion_del_Producto, $Fecha_de_Emision, $Precio_Total, $Numero_Factura, $idCliente, $Direccion_Facturacion, $Estado_Factura, $Fecha_Pago, $Referencia_Pago) {
        $sql = "INSERT INTO facturas (idFactura, Cantidad, Informacion_del_Producto, Fecha_de_Emision, Precio_Total, Numero_Factura, idCliente, Direccion_Facturacion, Estado_Factura, Fecha_Pago, Referencia_Pago) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->Conexion->prepare($sql);
    }
    public function consultarFactura($idFactura)
    {
        $this->Conexion = Conectarse();

        $sql = "SELECT * FROM facturas WHERE idFactura = ?";
        $stmt = $this->Conexion->prepare($sql);
        $stmt->bind_param("s", $ConNumero);
        $stmt->execute();
        $resultado = $stmt->get_result();
        $stmt->close();
        $this->Conexion->close();
        return $resultado;    
    }

    public function consultaridFacturas()
    {
        $this->Conexion = Conectarse();

        $sql = "SELECT * FROM facturas";
        $resultado = $this->Conexion->query($sql);
        $this->Conexion->close();
        return $resultado;    
    }

    public function borrarFactura($idFactura)
    {
        $this->Conexion = Conectarse();
    
        $sql = "DELETE FROM facturas WHERE idFactura = ?";
        $stmt = $this->Conexion->prepare($sql);
        $stmt->bind_param("s", $idFactura);
        $resultado = $stmt->execute();
        $stmt->close();
        $this->Conexion->close();
    
        return $resultado;
    }

    public function actualizarFactura ($idFactura, $Estado_Factura)
    {
        $this->Conexion = Conectarse();
    
        $sql = "UPDATE facturas SET Estado_Factura = ? WHERE idFactura = ?";
        $stmt = $this->Conexion->prepare($sql);
        $stmt->bind_param("ss", $Estado_Factura, $idFactura);
        $resultado = $stmt->execute();
        $stmt->close();
        $this->Conexion->close();
    
        return $resultado;
    }

}


?>
