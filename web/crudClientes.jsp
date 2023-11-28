<%-- 
    Document   : crudUsuarios
    Created on : 12/11/2023, 07:54:07 PM
    Author     : Equipo 2
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuarioAdmin");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="Controlador.ControladorCliente"%>
<%@page import="Modelo.Cliente"%>
<%
    ControladorCliente cc = new ControladorCliente();
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Consulta de Clientes</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="assets/css/owl.css">
</head>

                    
<body class="bg-light">
    <header class="">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="principalAdmin.jsp"><img src="assets/images/logo.png" alt="" class="logoImg"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="principalAdmin.jsp> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="" data-toggle="modal" data-target="#ModalCRUD"><i class="fa fa-database" aria-hidden="true"></i> Administrar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-5">
        <h1 class="mb-4">Consulta de Clientes</h1>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Usuario</th>
                        <th>Clave</th>
                    </tr>
                </thead>
                <tbody>
                    <%= cc.getClientesTabla() %>
                </tbody>
            </table>
        </div>
        <br>
        <a href="principalAdmin.jsp" class="btn btn-primary">Regresar</a>
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
