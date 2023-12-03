<%-- 
    Document   : sobreNosotros
    Created on : 12/11/2023, 04:35:21 PM
    Author     : Equipo 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.dominio.Cliente" %>
<%@page import="Modelo.ModeloCliente" %>
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

        <title>Acerca de nosotros</title>

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">

    </head>

    <body>

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
                                <a class="nav-link" href="productos.jsp"><i class="fa fa-car" aria-hidden="true"></i> Productos</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="sobreNosotros.jsp"><i class="fa fa-globe" aria-hidden="true"></i>Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="carrito.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="compras.jsp"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Mis compras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#updateUserModal">
                                    <i class="fa fa-user"  aria-hidden="true"> </i> <span id="nombreUsuario"><% out.println(usuario);%></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onclick="borrarDatos()" href="CerrarSesion">Salir</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <div class="page-heading about-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <h4>Sobre nosotros</h4>
                            <h2>Global Tires</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="best-features about-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Sobre Nosotros</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/chambeando.png" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <h4>Acerca de Global Tires</h4>
                            <p>Bienvenidos a Global Tires, tu destino confiable para todas tus necesidades de llantas y servicios automotrices en Hermosillo. Desde que abrimos nuestras puertas, nos hemos comprometido a brindar a nuestros clientes productos y servicios de la más alta calidad, respaldados por la experiencia y pasión de nuestro equipo.</p>
                            <ul class="social-icons">
                                <li><a href="https://www.facebook.com/profile.php?id=100057779225132&sk=about"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://www.instagram.com/globaltiresindustrial/"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <h2 style="text-align: center;">ENCUENTRANOS AQUI </h2>
        <br> 
        <iframe style="margin: 0 auto; display: block;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d738.136363155391!2d-110.91292791859814!3d29.030427394821473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86ce8531cbcc020f%3A0xab85dc9a2e5d1774!2sGLOBAL%20TIRES!5e1!3m2!1ses!2smx!4v1699941825077!5m2!1ses!2smx" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" ></iframe>
        <br>

        <div class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="service-item">
                            <div class="icon">
                                <i class="fa fa-gear"></i>
                            </div>
                            <div class="down-content">
                                <h4>Nuestra Historia</h4>
                                <p>Global Tires se fundó en 1995 con una visión clara: convertirnos en la llantera preferida de Hermosillo y sus alrededores. A lo largo de los años, hemos trabajado incansablemente para alcanzar y superar esa visión. Hoy en día, somos un nombre de confianza en la comunidad, conocidos por nuestro compromiso con la excelencia y el servicio al cliente.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item">
                            <div class="icon">
                                <i class="fa fa-gear"></i>
                            </div>
                            <div class="down-content">
                                <h4>Nuestra Misión</h4>
                                <p>Nuestra misión en Global Tires es simple pero poderosa: proporcionar a nuestros clientes llantas de alta calidad y servicios automotrices excepcionales que mantengan sus vehículos en las mejores condiciones posibles. Estamos comprometidos con la seguridad, el rendimiento y la satisfacción del cliente en cada paso del camino.</p>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item">
                            <div class="icon">
                                <i class="fa fa-gear"></i>
                            </div>
                            <div class="down-content">
                                <h4>Nuestra Visión</h4>
                                <p>En Global Tires, aspiramos a ser la referencia en calidad, confiabilidad y compromiso en todo México. Nuestra visión se basa en la excelencia en el servicio al cliente, la innovación continua, la sostenibilidad, el crecimiento sostenible y ser parte integral de la comunidad. Nuestra visión en Global Tires nos guía en nuestro compromiso con la excelencia y la innovación constante.</p>
                            </div>
                        </div>
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
                            <button type="button" class="btn btn-secondary" id="btnRestaurar">Restaurar</button>

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


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script>
                                    function borrarDatos() {
                                        sessionStorage.clear();
                                    }
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
                                    document.addEventListener('DOMContentLoaded', function () {
                                        let form = document.getElementById('updateUserForm');
                                        let btnRestaurar = document.getElementById('btnRestaurar');

                                        let initialValues = {
                                            usuario: '<%= c.getUsuario()%>',
                                            pass: '<%= c.getPass()%>',
                                            correo: '<%= c.getCorreo()%>',
                                            nombres: '<%= c.getNombres()%>',
                                            apellidoP: '<%= c.getApellidoP()%>',
                                            apellidoM: '<%= c.getApellidoM()%>'
                                        };

                                        function restaurarFormulario() {
                                            form.reset();
                                            Object.keys(initialValues).forEach(function (key) {
                                                document.getElementById(key).value = initialValues[key];
                                            });
                                        }

                                        btnRestaurar.addEventListener('click', function () {
                                            restaurarFormulario();
                                        });
                                    });
        </script>


    </body>

</html>

