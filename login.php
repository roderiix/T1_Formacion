<?php
session_start();
include 'config.php'; // Incluir archivo de conexión

// Chequear si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = mysqli_real_escape_string($conn, $_POST['usuario']);
    $contrasena = mysqli_real_escape_string($conn, $_POST['contrasena']);

    // Consultar la base de datos para el usuario
    $sql = "SELECT * FROM cuentas WHERE Usuarios = '$usuario' and Contraseña= '$contrasena' ";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo " Session exitosa ";
        
        $row = $result->fetch_assoc();
        $sql = "call reg('$usuario')";
        $result = $conn->query($sql);

        $_SESSION['usuario'] = $usuario;
        if (isset($_SESSION['usuario'])) {
            header("Location: wellcome.php");
            exit();
        }
         
    } else {
        echo "<script>showError();</script>";
        header("Location: iniciar_Sesion.php");
    }
    $conn->close();
}
?>
