<%-- 
    Document   : principal
    Created on : 12/11/2023, 04:32:01 PM
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
<%@page import="Controlador.ControladorProducto"%>
<%
    ControladorProducto cp = new ControladorProducto();
%>
<!DOCTYPE html>
<html lang="en">

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
        <!--
      
      
        -->

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
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

        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class="banner header-text">
            <div class="owl-banner owl-carousel">
                <div class="banner-item-01">
                    <div class="text-content">
                        <h4>Global tires parque industrial</h4>
                        <h2>Seguridad en tu camino</h2>
                    </div>
                </div>
                <div class="banner-item-02">
                    <div class="text-content">
                        <h2>#TodoTipoDeLlantas</h2>
                    </div>
                </div>
                <div class="banner-item-03">
                    <div class="text-content">
                        <h4>Servicio Profesional</h4>
                        <h2>¡lo encuentras Aquí!</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Ends Here -->


        <div class="modal fade1" id="ModalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <button class="filled-button"><a href="" data-toggle="modal" data-target="#ModalProductos">Productos</a></button><br>
                            <button class="filled-button"><a href="" data-toggle="modal" data-target="#ModalClientes">Usuarios</a></button><br>
                        </div>
                    </div>
                </div>
            </div>      
        </div>

        <div class="modal fade1" id="ModalProductos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Administrar Productos</h4><br>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <button class="filled-button"><a href="CrudProductos?accion=consultar">Consultar</a></button><br>
                            <button class="filled-button"><a href="CrudProductos?accion=crear">Crear</a></button><br>

                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">

                    </div>
                </div>
            </div>      
        </div>

        <div class="modal fade1" id="ModalClientes" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Administrar Usuarios</h4><br>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <button class="filled-button"><a href="CrudClientes?accion=consultar">Consultar</a></button><br>
                            <button class="filled-button"><a href="CrudClientes?accion=crear">Crear</a></button><br>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">

                    </div>
                </div>
            </div>      
        </div>


        <div class="latest-products">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Ultimos productos</h2>
                            <a href="productos.jsp">Todos los productos <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <%=cp.getUltimosProductos()%>
                </div>
            </div>
        </div>

        <div class="best-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Acerca de Global Tires</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <h4>¿En busca de las mejores llantas?</h4>
                            <p>¡El Servicio Profesional que necesita tu Auto, lo encuentras Aquí!
                                Venta de Neumáticos Nuevos par
                                <br><br>  
                                Encuentranos en Carretera a Sahuaripa Km. 3.2 Col. Parque Industrial, Hermosillo, Mexico
                            </p>
                            <a href="about.html" class="filled-button">Mas aqui</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/logo3.png" alt="">
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

        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script language="text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>


    </body>

</html>
