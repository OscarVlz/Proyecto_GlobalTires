<%-- 
    Document   : editProducto
    Created on : 13/11/2023, 11:56:20 PM
    Author     : oscar
--%>

<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ModeloProducto"%>
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
        <title>Modificar Producto</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body>
        <div class="container mt-5">
            <h1>Crear Producto</h1>
            <form action="CrudProductos?accion = mostrarCreado" method="get">
                <div class="form-group">
                    <label for="txtNom">Nombre:</label>
                    <input type="text" id="txtNom" name="txtNom" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtTipo">Tipo:</label>
                    <input type="text" id="txtTipo" name="txtTipo" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtimg">Imagen:</label>
                    <input type="text" id="txtimg" name="txtimg" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtPrecio">Precio:</label>
                    <input type="number" id="txtPrecio" name="txtPrecio" class="form-control"required>
                </div>
                <div class="form-group">
                    <label for="txtStock">Stock:</label>
                    <input type="number" id="txtStock" name="txtStock" class="form-control"required>
                </div>
                <div class="form-group">
                    <label for="txtDescripcion">Descripción:</label>
                    <input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control"required>
                </div>

                <button type="submit" name="accion" value="mostrarCreado" class="btn btn-primary">Crear</button>
                <a href="CrudProductos?accion=consultar" class="btn btn-secondary">Regresar</a>
            </form>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>