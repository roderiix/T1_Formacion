<?php
    include 'config.php';
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = $_POST['nombre_apellido'];
        $us = $_POST['usuario'];
        $contra = $_POST['contraseña'];
        
        $sql = "call registrar_d('$us', '$name', '$contra')";
        $result = $conn->query($sql);
        // Aquí puedes agregar la lógica para procesar los datos del formulario, como guardarlos en una base de datos.
        
        if ($result == TRUE) {

            $message= "Usuario creado correctamente";
            header('location: index.php');
         } else {
             $message= "El nombre de usuario ya está ocupado";
             header('location: Crear_cuenta.php');
         }
    } 
    // Cerrar la conexión
    $conn->close();
    
?>