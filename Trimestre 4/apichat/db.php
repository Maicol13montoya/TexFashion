<?php
$servername = "localhost";
$username = "root"; // Cambia por tu usuario de base de datos
$password = ""; // Cambia por tu contraseña
$dbname = "texfashion"; // Cambia por el nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>