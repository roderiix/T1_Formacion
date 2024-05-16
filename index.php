<!DOCTYPE html>
<html lang="es">

<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Formacion 1</title>
    <style>
        body{
            background-image: url(img/928481.jpg);
            background-size: center;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
    </style>
    
</head>
<body>
    <header>
        <h1 style="color: rgb(255, 255, 255); text-align: center; margin-top: 50px;">Bienvenidos a Franzber</h1>
    </header>
    
    <div style="background-color: rgba(0, 0, 0, 0.4); border: solid white 1px; width: 1000px; margin: auto; height: 1000px;">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="index.php">Franzber</a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item" >
                            <a class="nav-link active" aria-current="page" href="iniciar_Sesion.php" >Iniciar Sesion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Crear_cuenta.php">Crear Cuenta</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
            <h2 style="color: aliceblue; text-align: center;">Tabla de base de datos</h2>
            <div style="background-color: rgba(0, 0, 0, 0.8); border: solid white 1px; width: 800px; margin: auto; margin-bottom: 30px; height: 800px;">
                <h3 style="color: aliceblue; text-align: center; margin-top: 30px;">Llorar hace bien</h3>
                <div style="background-color: rgba(0, 0, 0, 0.2); width: 600px; margin: auto; margin-top: 30px; height: 600px;">
                    <table class="table table-dark table-striped">
                        <thead>
                          <tr>
                            <th scope="col">Usuario</th>
                            <th scope="col">Ultima conexion</th>
                            <th scope="col">Fecha registro</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Numeracion</th>
                            <th scope="col">Fecha_Hora</th>
                          </tr>
                        </thead>
                        <tbody>
                            <?php
                            include 'config.php';

                                // llamar tabla
                                $sql = "select * from vista;";
                                $result = $conn->query($sql);
                                
                                while ( $row = $result->fetch_assoc() ){
                                echo "<tr>
                                    <td><h5>".$row["Usuarios"]."</p></h5></td>
                                    <td><h5>".$row["Ult"]."</h5></td>
                                    <td><h5>".$row["Fecha_registro"]."</h5></td>
                                    <td><h5>".$row["Nombre"]."</h5></td>
                                    <td><h5>".$row["Numeracion"]."</h5></td>
                                    <td><h5>".$row["Fecha_Hora"]."</h5></td>";

                
                                //echo "<td><h1>".$row["hire_date"]."</h1></td>
                                echo "</tr>";
    }

                            //CERRAR LA CONEXION
                            $conn->close();

                        ?>
                          
                        </tbody>
                      </table>
                </div>
            </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>