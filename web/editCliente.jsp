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
            <%
                ModeloCliente modelC = new ModeloCliente();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Cliente c = (Cliente) modelC.getCliente(id);
            %>
            <h1>Modificar Cliente</h1>
            <form action="CrudClientes?accion=consultar" method="get">
                <div class="form-group">
                    <label for="txtNom">Usuario:</label>
                    <input type="text" id="txtNom" name="txtNom" class="form-control" value="<%= c.getUsuario()%>">
                </div>
                <div class="form-group">
                    <label for="txtContrasena">Contraseña:</label>
                    <input type="password" id="txtContrasena" name="txtContrasena" class="form-control" value="<%= c.getClave()%>">
                </div>
                <input type="hidden" name="txtid" value="<%= c.getId()%>">
                <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
                <a href="CrudClientes?accion=consultar" class="btn btn-secondary">Regresar</a>
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
