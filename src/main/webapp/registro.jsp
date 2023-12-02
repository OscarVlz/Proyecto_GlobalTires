<%-- 
    Document   : menu
    Created on : 31/10/2023, 10:52:07 AM
    Author     : Equipo 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <title>Global Tires</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body class="bg-light">
    <body class="bg-light">
        <header class="">
            <nav class="navbar">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo.png" alt="" class="logoImg"></a>
                </div>
            </nav>
        </header>   
        <div class="banner header-text">

        </div>

        <div class="container mt-5" style="background-color: #898c84; border-radius: 3px; padding: 40px">
            <h1>Registrar Usuario</h1>
            <form action="nuevousuario" method="post">
                <div class="form-group">
                    <label for="usuario">Nombre de Usuario:</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de Usuario" required>
                </div>
                <div class="form-group">
                    <label for="pass">Contraseña:</label>
                    <input type="password" id="pass" name="pass" class="form-control" placeholder="Contraseña" required>
                </div>
                <div class="form-group">
                    <label for="pass">Nombres:</label>
                    <input type="text" id="nombres" name="nombres" class="form-control" placeholder="Nombres" required>
                </div>
                <div class="form-group">
                    <label for="pass">Apellido paterno:</label>
                    <input type="text" id="apellidoP" name="apellidoP" class="form-control" placeholder="Apellido paterno" required>
                </div>
                <div class="form-group">
                    <label for="pass">Apellido materno:</label>
                    <input type="text" id="apellidoM" name="apellidoM" class="form-control" placeholder="Apellido materno" required>
                </div>
                <div class="form-group">
                    <label for="pass">Correo:</label>
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="correo@mail.com" required>
                </div>
                <button type="submit" class="btn btn-primary" style="background-color: #324c69;">Registrar Usuario</button>
            </form>

            <hr class="my-4"> 

            <a href="index.jsp" class="btn btn-primary" style="background-color: #324c69;">Regresar</a>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="inner-content">
                        <p> &copy; 2023 Equipo 2 & Global Tires
                    </div>
                </div>
            </div>
        </div>
    </footer>

</html>
