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
         <%
                ModeloProducto modelP = new ModeloProducto();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Producto c=(Producto)modelP.getProducto(id);
            %>
        <h1>Modificar Producto</h1>
        <form action="CrudProductos?accion=consultar" method="post">
            <div class="form-group">
                <label for="txtNom">Nombre:</label>
                <input type="text" id="txtNom" name="txtNom" class="form-control" value="<%= c.getNombre()%>">
            </div>
            <div class="form-group">
                <label for="txtTipo">Tipo:</label>
                <input type="text" id="txtTipo" name="txtTipo" class="form-control" value="<%= c.getTipo()%>">
            </div>
            <div class="form-group">
                <label for="txtimg">Imagen:</label>
                <input type="text" id="txtimg" name="txtimg" class="form-control" value="<%= c.getImg()%>">
            </div>
            <div class="form-group">
                <label for="txtPrecio">Precio:</label>
                <input type="text" id="txtPrecio" name="txtPrecio" class="form-control" value="<%= c.getPrecio()%>">
            </div>
            <div class="form-group">
                <label for="txtStock">Stock:</label>
                <input type="text" id="txtStock" name="txtStock" class="form-control" value="<%= c.getStock()%>">
            </div>
            <div class="form-group">
                <label for="txtDescripcion">Descripción:</label>
                <input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" value="<%= c.getDescripcion()%>">
            </div>

            <input type="hidden" name="txtid" value="<%= c.getId()%>">
            <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
            <a href="CrudProductos?accion=consultar" class="btn btn-secondary">Regresar</a>
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
