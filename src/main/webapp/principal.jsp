<%-- Document : principal Created on : 12/11/2023, 04:32:01 PM Author : Equipo 2 --%>

<%@page import="Modelo.dominio.Cliente" %>
<%@page import="Modelo.ModeloCliente" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% HttpSession objSesion=request.getSession(false);
String usuario=(String) new ModeloCliente().getCliente(Integer.parseInt(session.getAttribute("id").toString())).getUsuario(); 
if (usuario==null) { response.sendRedirect("index.jsp"); } %>
<%@page import="Controlador.ControladorProducto" %>

<% ControladorProducto cp=new ControladorProducto(); 
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
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
                    <a class="navbar-brand" href="principal.jsp"><img
                            src="assets/images/logo.png" alt="" class="logoImg"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarResponsive" aria-controls="navbarResponsive"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="principal.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="productos.jsp"><i class="fa fa-car"
                                                                            aria-hidden="true"></i> Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="sobreNosotros.jsp"><i
                                        class="fa fa-globe" aria-hidden="true"></i>Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="carrito.jsp"><i
                                        class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="compras.jsp"><i
                                        class="fa fa-shopping-bag" aria-hidden="true"></i> Mis
                                    compras</a>
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

        <div class="latest-products">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Ultimos productos</h2>
                            <a href="productos.jsp">Todos los productos <i
                                    class="fa fa-angle-right"></i></a>
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
                            <p>¡El Servicio Profesional que necesita tu Auto, lo encuentras
                                Aquí!
                                Venta de Neumáticos Nuevos par
                                <br><br>
                                Encuentranos en Carretera a Sahuaripa Km. 3.2 Col. Parque
                                Industrial, Hermosillo, Mexico
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
            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.querySelector("button");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            function openModal() {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            function closeModal() {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };

            // Handle form submission
            document.getElementById("profileForm").addEventListener("submit", function (event) {
                event.preventDefault();

                // Update profile information
                var newName = document.getElementById("newName").value;
                var newPassword = document.getElementById("newPassword").value;

                document.getElementById("nombre").innerText = newName;
                document.getElementById("pass").innerText = newPassword;

                // Close the modal
                closeModal();
            });
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
                                document.getElementById("nombreUsuario").innerHTML = JSON.stringify(data.valores.usuario).replaceAll('"','');
                            })
                            .catch(error => {
                                console.error("Error al actualizar usuario:", error);
                            });
                });
            });
        </script>


    </body>

</html>