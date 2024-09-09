<?php

require_once 'funciones.php';

if(isset($_POST['formulario'])){

    
    $formulario = $_POST['formulario'];
    
    if($formulario == 'registrarProducto'){

        $nombre = $_POST['nombre'];
        $cantidad = $_POST['cantidad'];
        $descripcion = $_POST['descripcion'];
        $fechaE = $_POST['fechaE'];
        $fechaS = $_POST['fechaS'];
        $estado = $_POST['estado'];
        $idMP = $_POST['idMP'];

        $registro = registrarProducto($nombre,$cantidad,$descripcion,$fechaE,$fechaS,$estado,$idMP);

        if($registro){
            header("Location: ../VISTA/productosterminados.php");
            return true;
        }
        return false;

    }elseif($formulario == 'actualizarProducto'){

        $id =  $_POST['id'];
        $nombre = $_POST['nombre'];
        $cantidad = $_POST['cantidad'];
        $descripcion = $_POST['descripcion'];
        $fechaE = $_POST['fechaE'];
        $fechaS = $_POST['fechaS'];
        $estado = $_POST['estado'];
        $idMP = $_POST['idMP'];

        $registro = actualizarProductos($id,$nombre,$cantidad,$descripcion,$fechaE,$fechaS,$estado,$idMP);

        if($registro){
            header("Location: ../VISTA/productosterminados.php");
            return true;
        }
        return false;

    }elseif($formulario == 'eliminarProducto'){

        $id =  $_POST['id'];

        $registro = eliminarProducto($id);

        if($registro){
            header("Location: ../VISTA/productosterminados.php");
            return true;
        }
        return false;

    }elseif($formulario == 'registrarProveedor'){
        $documento = $_POST['documento'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $fechaN = $_POST['fechaN'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
        $tipoDoc = $_POST['tipoDoc'];


        $registro = registrarProveedor($documento, $nombre, $apellidos, $fechaN, $direccion, $telefono, 5, $tipoDoc);


        if($registro){
            header("Location: ../VISTA/provedore.php");
            return true;
        }
        return false;

    } elseif($formulario == 'actualizarProveedor'){
        $id = $_POST['id'];
        $documento = $_POST['documento'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $fechaN = $_POST['fechaN'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
        $tipoDoc = $_POST['tipoDoc'];

        $registro = actualizarProveedor($documento, $nombre, $apellidos, $fechaN, $direccion, $telefono, $tipoDoc);

        if($registro){
            header("Location: ../VISTA/provedore.php");
            return true;
        }
        return false;

    } elseif($formulario == 'eliminarProveedor'){
        $id = $_POST['id'];

        $registro = eliminarProveedor($id);

        if($registro){
            header("Location: ../VISTA/provedore.php");
            return true;
        }
        return false;
    }
}




?>