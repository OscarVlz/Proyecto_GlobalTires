<%-- 
    Document   : eliminarCliente
    Created on : 14/11/2023, 12:31:47 AM
    Author     : oscar
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

    ModeloCliente modelC = new ModeloCliente();
    int id = Integer.parseInt((String) request.getAttribute("idper"));
    Cliente c = (Cliente) modelC.getCliente(id);
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Eliminar Cliente</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="assets/css/owl.css">
</head>

<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h1 class="mb-0">Eliminar Cliente</h1>
                    </div>
                    <div class="card-body">
                        <form action="CrudClientes?accion=consultar" method="post">
                            <div class="form-group">
                                <label for="txtNom">Usuario:</label>
                                <input type="text" id="txtNom" name="txtNom" class="form-control" readonly value="<%= c.getUsuario()%>">
                            </div>
                            <div class="form-group">
                                <label for="txtContrasena">Contraseña:</label>
                                <input type="password" id="txtContrasena" name="txtContrasena" class="form-control" readonly value="<%= c.getClave()%>">
                            </div>
                            <input type="hidden" name="txtid" value="<%= c.getId()%>">
                            <button type="submit" name="accion" value="Eliminar" class="btn btn-danger">Eliminar</button>
                            <a href="CrudClientes?accion=consultar" class="btn btn-secondary">Regresar</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
