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

        <title>Global Tires - Iniciar Sesión</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body class="bg-light">
        <div class="container mt-5">
            <h1>Iniciar Sesión</h1>
            <form action="iniciar" method="post">
                <div class="form-group">
                    <label for="usuario">Nombre de Usuario:</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de Usuario" required>
                </div>
                <div class="form-group">
                    <label for="pass">Contraseña:</label>
                    <input type="password" id="pass" name="pass" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
            </form>
            <br>
            <p class="mt-3">¿No tienes cuenta? <a href="registro.jsp">Registrar</a></p>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
    </body>

</html>

