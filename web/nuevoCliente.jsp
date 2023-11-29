<%-- 
    Document   : editCliente
    Created on : 13 nov. 2023, 20:09:56
    Author     : Equipo 2
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ModeloCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuarioAdmin");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Modificar Cliente</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body>
        <div class="container mt-5">
            <h1>Nuevo Cliente</h1>
            <form action="CrudClientes?accion=mostrarCreado" method="get">
                <div class="form-group">
                    <label for="usuario">Nombre de Usuario:</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" pattern="[A-Za-z0-9.\-_]{3,16}" minlength="3" maxlength="16" placeholder="Nombre de Usuario" required>
                </div>
                <div class="form-group">
                    <label for="pass">Contraseña:</label>
                    <input type="password" id="pass" name="pass" pattern="[A-Za-z0-9~@#_^*%/.+:;=]{8,30}" minlength="8" maxlength="30" class="form-control" required>
                </div>
                <button type="submit" name="accion" value="mostrarCreado" class="btn btn-primary">Crear</button>
                <a href="principalAdmin.jsp" class="btn btn-secondary">Regresar</a>
            </form>

        </div>
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
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
       
    </body>

</html>
