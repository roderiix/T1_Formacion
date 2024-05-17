<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', 'rodrigo0201');
define('DB_NAME', 't1_formacion.sql');

// SE REALIZA LA CONEXION
$conn = new mysqli("localhost", "root", "rodrigo0201", "t1_formacion");
if ($conn->connect_error)  {
die("Connection failed: " . $conn->connect_error);
}       /* else {
echo "conexion exitosa";
} */
?>