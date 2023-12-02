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
<%@page import="Modelo.dominio.Cliente"%>
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
        <style>
            .seccion {
                display: none;
            }
            .seccion-activa {
                display: block;
            }
        </style>
    </head>


    <body class="" style="background-color: #ffffff;">

        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
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
                            <li class="nav-item">
                                <a class="nav-link" href="principalAdmin.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="" data-toggle="modal"
                                   data-target="#ModalCRUD"><i class="fa fa-database"
                                                            aria-hidden="true"></i> Administrar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="banner header-text">

        </div>
        <br>
        <div class= "container navbar-collapse" style="background-color: #c2d1db;">
            <nav class="navbar navbar-expand-lg navbar-light" style="display: flex; justify-content: center;">
                <ul class="navbar-nav" style="            display: flex;
                    justify-content: center;
                    width: 100%;">
                    <li class="nav-item secNav active" id="seccionNavConsulta" style="flex: 1; text-align: center;">
                        <a class="nav-link" href="#" onclick="mostrarSeccion('consultas', 'seccionNavConsulta')">Consultas/eliminar/editar</a>
                    </li>
                    <li class="nav-item secNav" id="seccionNavCrear" style="flex: 1; text-align: center;">
                        <a class="nav-link" href="#" onclick="mostrarSeccion('crear', 'seccionNavCrear')">Crear</a>
                    </li>
                </ul>
            </nav>
        </div>
        <br>
        <div style="background-color: #accde2; border-radius: 3px; padding: 40px; margin-left: 20px; margin-right: 20px">
            <div class="container mt-5 seccion seccion-activa" id="consultas">
                <h1 class="mb-4">Consulta de Clientes</h1>
                <div class="table-responsive">
                    <table class="table table-bordered" style="background-color: #ffffff;border-radius: 10px">
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
            </div>
            <div class="container mt-5 seccion" id="crear">
                <h1>Nuevo Cliente</h1>
                <form action="CrudClientes?accion=mostrarCreado" method="get">
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
                    <button type="submit" name="accion" value="mostrarCreado" class="btn btn-primary">Crear</button>
                </form>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <a href="principalAdmin.jsp" class="btn btn-primary" style="margin-left: auto;  ">Regresar</a>
            </div>
        </div>
        <div class="modal fade1" id="ModalCRUD" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Administrar</h4><br>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <button class="filled-button"><a href="CrudProductos?accion=consultar">Productos</a></button><br>
                            <button class="filled-button"><a href="CrudClientes?accion=consultar">Usuarios</a></button>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
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
    <script>
                            function mostrarSeccion(idSeccion, idSeccionNav) {
                                const secciones = document.querySelectorAll('.seccion');
                                const seccionesNav = document.querySelectorAll('.secNav');

                                secciones.forEach(function (seccion) {
                                    seccion.classList.remove('seccion-activa');
                                });

                                seccionesNav.forEach(function (secNav) {
                                    secNav.classList.remove('active');
                                });

                                const seccionSeleccionada = document.getElementById(idSeccion);
                                const seccionASombrear = document.getElementById(idSeccionNav)
                                seccionSeleccionada.classList.add('seccion-activa');
                                seccionASombrear.classList.add('active');
                            }
    </script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/custom.js"></script>

</html>
