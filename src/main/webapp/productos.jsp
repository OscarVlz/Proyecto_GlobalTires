<%-- 
    Document   : productos
    Created on : 11/11/2023, 07:06:31 PM
    Author     : Equipo 2
--%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.dominio.Producto"%>
<%@page import="Modelo.dominio.Cliente" %>
<%@page import="Modelo.ModeloCliente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion=request.getSession(false);
String usuario=(String) new ModeloCliente().getCliente(Integer.parseInt(session.getAttribute("id").toString())).getUsuario(); 
if (usuario==null) { response.sendRedirect("index.jsp"); } %>


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
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Nuestros productos</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--
        
        TemplateMo 546 Sixteen Clothing
        
        https://templatemo.com/tm-546-sixteen-clothing
        
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
                    <a class="navbar-brand" href="principal.jsp"><img src="assets/images/logo.png" alt="" class="logoImg"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="principal.jsp"><i class="fa fa-home" aria-hidden="true"></i>Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="productos.jsp"><i class="fa fa-car" aria-hidden="true"></i> Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="sobreNosotros.jsp"><i class="fa fa-globe" aria-hidden="true"></i> Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="carrito.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="compras.jsp"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Mis compras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#updateUserModal">
                                    <i class="fa fa-user"  aria-hidden="true"> </i> <span id="nombreUsuario"><% out.println(usuario);%></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CerrarSesion">Salir</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <div class="page-heading products-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <h4>Productos</h4>
                            <h2>#TODOTIPODELLANTAS</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="filters">
                            <ul>
                                <li class="active" data-filter="*">All Products</li>
                                <li data-filter=".des">Automoviles</li>
                                <li data-filter=".dev">Vehiculos Pesados</li>
                                <li data-filter=".gra">Todoterreno</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="filters-content dev">
                            <div class="row grid">
                                <%=cp.getProductos()%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <ul class="pages">
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <!-- MODAL DE LOGIN -->
        <div class="modal fade1" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Inicio de Sesión</h4>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <form action="iniciar" method="post">
                                <div class="form-group">
                                    <input name="usuario" type="text" class="form-control" id="email1"placeholder="Nombre de usuario...">
                                </div>
                                <div class="form-group">
                                    <input name="pass" type="password" class="form-control" id="password1" placeholder="Escribir contraseña...">
                                </div>
                                <input type="submit" class="filled-button" value="Iniciar sesión">
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <div class="signup-section">No tienes cuenta? <a href="registro.jsp" class="text-info"> Registrar</a>.</div>
                    </div>
                </div>
            </div>      
        </div>                    
        <div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateUserModalLabel">Actualizar Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mt-3">
                        <%
      ModeloCliente modelC = new ModeloCliente();
      int id = Integer.parseInt(session.getAttribute("id").toString());
      Cliente c = (Cliente) modelC.getCliente(id);
                        %>
                        <form id="updateUserForm">
                            <h2>Actualizar Informacion</h2>
                            <input type="number" class="form-control" id="id" name="id" value="<%= c.getId()%>" hidden>
                            <div class="form-group">
                                <label for="usuario">Nombre de usuario:</label>
                                <input type="text" class="form-control" id="usuario" name="usuario" value="<%= c.getUsuario()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="pass">Password:</label>
                                <input type="password" class="form-control" id="pass" name="pass" value="<%= c.getPass()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="correo">Correo electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%= c.getCorreo()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="nombres">Nombres:</label>
                                <input type="text" class="form-control" id="nombres" name="nombres" value="<%= c.getNombres()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="apellidoP">Apellido Paterno:</label>
                                <input type="text" class="form-control" id="apellidoP" name="apellidoP" value="<%= c.getApellidoP()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="apellidoM">Apellido Materno:</label>
                                <input type="text" class="form-control" id="apellidoM" name="apellidoM" value="<%= c.getApellidoM()%>" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Actualizar Usuario</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="modalMensajeLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalMensajeLabel">Mensaje Importante</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="textoModal"></p>
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


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script>
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>
        <script>
            function abrirModal(mensaje) {
                const textoModal = document.getElementById("textoModal").innerHTML = mensaje;
                $('#modalMensaje').modal('show');
            }

            document.addEventListener("DOMContentLoaded", function () {
                const updateUserForm = document.getElementById("updateUserForm");

                updateUserForm.addEventListener("submit", function (event) {
                    event.preventDefault();

                    const formData = new FormData(updateUserForm);
                    const userData = {ClienteDTO: {}};

                    formData.forEach((value, key) => {
                        userData.ClienteDTO[key] = value;
                    });

                    fetch("/Proyecto_GlobalTires/CrudClientes", {
                        method: "POST",
                        body: JSON.stringify(userData)
                    })
                            .then(response => response.json())
                            .then(data => {
                                $("#updateUserModal").modal("hide");
                                abrirModal(JSON.stringify(data.respuesta).replaceAll('"', ''));
                                document.getElementById("nombreUsuario").innerHTML = JSON.stringify(data.valores.usuario).replaceAll('"', '');
                            })
                            .catch(error => {
                                console.error("Error al actualizar usuario:", error);
                            });
                });
            });
        </script>


    </body>

</html>
