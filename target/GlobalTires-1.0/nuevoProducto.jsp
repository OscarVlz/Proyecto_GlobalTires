<%-- 
    Document   : editProducto
    Created on : 13/11/2023, 11:56:20 PM
    Author     : oscar
--%>

<%@page import="Modelo.dominio.Producto"%>
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
            <form action="CrudProductos?accion = mostrarCreado" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtNom">Nombre:</label>
                    <input type="text" placeholder="Ingrese el nombre del Producto" id="txtNom" pattern=".{5,25}" minlength="5" maxlength="25" name="txtNom"  class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtTipo">Tipo:</label>
                    <input type="text"  id="txtTipo" name="txtTipo" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtimg">Imagen:</label>
                    <input type="file" id="txtimg" name="txtimg" accept=".jpg, .png, .jpeg" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="txtPrecio">Precio:</label>
                    <input type="number" placeholder="Ingrese el precio del Producto" id="txtPrecio" pattern="^(?:[1-9]\d{2,6}|100)$" name="txtPrecio" class="form-control"required>
                </div>
                <div class="form-group">
                    <label for="txtStock">Stock:</label>
                    <input type="number" placeholder="Ingrese la cantidad de Producto" id="txtStock" name="txtStock" pattern="^(?:[1-9]|[1-9]\d|999)$" class="form-control"required>
                </div>
                <div class="form-group">
                    <label for="txtDescripcion">Descripción:</label>
                    <input type="text" placeholder="Ingrese la Descripción del Producto" id="txtDescripcion" name="txtDescripcion" pattern="^[A-Za-z0-9,.;:ÑñÁáÉéÍíÓóÚúÜü¿?!¡'\s]{20,175}$" minlength="20" maxlength="175" class="form-control"required>
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
