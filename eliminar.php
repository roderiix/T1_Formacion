<?php
include 'config.php';

    if (isset($_GET['Usuario'])) {
     $usuario = $_GET['Usuario'];
    }
    // Consulta para eliminar el registro
    $sql = "DELETE FROM Cuentas WHERE Usuarios = ?";
        $records = $conn->prepare($sql);
        $records->bind_param("s", $usuario);
    
        $records->execute();
        if($records->affected_rows > 0){
            echo "Registro eliminado con éxito";
        } else {
        echo "Error eliminando el registro: " . $conn->error;
        }
        $records->close();
   
$conn->close();

// Redirigir de vuelta a la página principal
header("Location: index.php");
exit();
?>