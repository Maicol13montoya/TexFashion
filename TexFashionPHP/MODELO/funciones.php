<?php

function obtenerProductosT(){
    require_once 'conexion.php';
    
    $sql = 'SELECT * FROM productos_terminados';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $producto = $stmt->fetchAll(PDO::FETCH_ASSOC);


    if($producto){
        return $producto;
    }

}

function registrarProducto($nombre, $cantidad, $descripcion, $fechaE, $fechaS, $estados, $idMP){

    require_once 'conexion.php';

    $sql = 'INSERT INTO `productos_terminados`(`Nombre_Producto`, `Cantidad_Disponible`, `Descripcion`, `Fecha_Entrada`, `Fecha_Salida`, `Estado`, `idmateria_prima`) 
    VALUES (:nombre, :cantidad, :descripcion, :fechaE, :fechaS, :estados, :idMP)';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':nombre',$nombre);
    $stmt->bindValue(':cantidad',$cantidad);
    $stmt->bindValue(':descripcion',$descripcion);
    $stmt->bindValue(':fechaE',$fechaE);
    $stmt->bindValue(':fechaS',$fechaS);
    $stmt->bindValue(':estados',$estados);
    $stmt->bindValue(':idMP',$idMP);
    
    if($stmt->execute()){
        return true;
    }
    return false;

}

function actualizarProductos($id,$nombre,$cantidad,$descripcion,$fechaE,$fechaS,$estado,$idMP){
    require_once 'conexion.php';

    $sql = 'UPDATE productos_terminados SET Nombre_Producto = :nombre, Cantidad_Disponible = :cantidad , Descripcion = :descripcion ,Fecha_Entrada = :fechaE,Fecha_Salida = :fechaS, Estado = :estado, idmateria_prima = :idMP WHERE idProductos = :id';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':id',$id);
    $stmt->bindValue(':nombre',$nombre);
    $stmt->bindValue(':cantidad',$cantidad);
    $stmt->bindValue(':descripcion',$descripcion);
    $stmt->bindValue(':fechaE',$fechaE);
    $stmt->bindValue(':fechaS',$fechaS);
    $stmt->bindValue(':estado',$estado);
    $stmt->bindValue(':idMP',$idMP);
    
    if($stmt->execute()){
        return true;
    }
    return false;

}

function eliminarProducto($id){

    require_once 'conexion.php';

    $sql = 'DELETE FROM `productos_terminados` WHERE idProductos = :id';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':id', $id);

    if($stmt->execute()){
        return true;
    }
    return false;
}


function obtenerProveedores(){
    require_once 'conexion.php';
    
    $sql = 'SELECT * FROM usuario WHERE Rol = 5';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $proveedores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if($proveedores){
        return $proveedores;
    }
    return [];
}

function registrarProveedor($documento, $nombre, $apellidos, $fechaN, $direccion, $telefono, $rol, $tipoDoc) {
    require_once 'conexion.php';

    $sql = 'INSERT INTO usuario (Documento, Nombre_Usuario, Apellidos, Fecha_Nacimiento, Direccion_Usuario, Telefono, Rol, TipoDoc) 
            VALUES (:documento, :nombre, :apellidos, :fechaN, :direccion, :telefono, :rol, :tipoDoc)';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':documento', $documento);
    $stmt->bindValue(':nombre', $nombre);
    $stmt->bindValue(':apellidos', $apellidos);
    $stmt->bindValue(':fechaN', $fechaN);
    $stmt->bindValue(':direccion', $direccion);
    $stmt->bindValue(':telefono', $telefono);
    $stmt->bindValue(':rol', $rol);
    $stmt->bindValue(':tipoDoc', $tipoDoc);

    if ($stmt->execute()) {
        return true;
    }
    return false;
}


function actualizarProveedor($documento, $nombre, $apellidos, $fechaN, $direccion, $telefono, $rol, $tipoDoc) {
    require_once 'conexion.php';

    // Consulta SQL para actualizar el proveedor basado en el documento
    $sql = 'UPDATE usuario 
            SET Nombre_Usuario = :nombre, 
                Apellidos = :apellidos, 
                Fecha_Nacimiento = :fechaN, 
                Direccion_Usuario = :direccion, 
                Telefono = :telefono, 
                Rol = :rol, 
                TipoDoc = :tipoDoc 
            WHERE Documento = :documento';

    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':documento', $documento);
    $stmt->bindValue(':nombre', $nombre);
    $stmt->bindValue(':apellidos', $apellidos);
    $stmt->bindValue(':fechaN', $fechaN);
    $stmt->bindValue(':direccion', $direccion);
    $stmt->bindValue(':telefono', $telefono);
    $stmt->bindValue(':rol', $rol);
    $stmt->bindValue(':tipoDoc', $tipoDoc);

    // Ejecuta la consulta y devuelve true o false basado en el resultado
    if ($stmt->execute()) {
        return true;
    }
    return false;
}


function eliminarProveedor($id){
    require_once 'conexion.php';

    $sql = 'DELETE FROM usuario WHERE Documento = :id AND Rol = 5';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':id', $id);

    if($stmt->execute()){
        return true;
    }
    return false;
}




?>