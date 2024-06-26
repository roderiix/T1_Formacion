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
    
    <div style="background-color: rgba(0, 0, 0, 0.4); border: solid white 1px; width: 1000px; margin: auto; ">
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
                    </ul>
                </div>
            </div>
        </nav>
            <h2 style="color: aliceblue; text-align: center;">Crear Cuenta</h2>
            <div style="background-color: rgba(0, 0, 0, 0.6); border: solid white 1px; width: 800px; margin: auto; margin-bottom: 40px;">
                <form style="text-align: center;" method="POST" action="registrar.php">
                    <div class="mb-3">
                      <label for="Nombre_Apellido" class="form-label" style="color: aliceblue; margin-top: 30px;">Nombre y Apellido</label>
                      <input type="text" class="form-control" name="nombre_apellido" aria-describedby="emailHelp" style="width: 600px; margin: auto; margin-bottom: 30px;" require> 
                    </div>
                    <div class="mb-3">
                        <label for="Usuario" class="form-label" style="color: aliceblue; margin-top: 30px;">Nombre de Usuario</label>
                        <input type="text" class="form-control" name="usuario" aria-describedby="emailHelp" style="width: 600px; margin: auto; margin-bottom: 30px;" require>
                        
                      </div>
                      <div class="mb-3">
                        <label for="contraseña" class="form-label" style="color: aliceblue;  margin-top: 30px;">Contraseña</label>
                        <input type="password" class="form-control" name="contraseña" style="width: 600px; margin: auto; margin-bottom: 30px;" require>
                      </div>
                    <button type="submit" class="btn btn-primary" style="margin-bottom: 30px;">Registrar</button>
                  </form>
            </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>