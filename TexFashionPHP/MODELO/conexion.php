<?php

try{
    $conn = new PDO("mysql:host=localhost; dbname=texfashion_sql", 'root','');
}catch(PDOException $e){
    echo "Error: ".$e->getMessage();
}

?>