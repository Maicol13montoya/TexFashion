<?php
function Conectarse() {
    $Conexion = mysqli_connect("localhost", "root", "", "texfashion_");
    return $Conexion;
}
?>
