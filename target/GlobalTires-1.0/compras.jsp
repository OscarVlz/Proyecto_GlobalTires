<%-- 
    Document   : principal
    Created on : 12/11/2023, 04:32:01 PM
    Author     : Equipo 2
--%>

<%@page import="Controlador.ControladorCompras"%>
<%@page import="Modelo.dominio.Cliente"%>
<%@page import="Modelo.ModeloCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion=request.getSession(false);
String usuario=(String) new ModeloCliente().getCliente(Integer.parseInt(session.getAttribute("id").toString())).getUsuario(); 
if (usuario==null) { response.sendRedirect("index.jsp"); } %>
<%@page import="Controlador.ControladorProducto"%>
<%
    ControladorCompras cc = new ControladorCompras();
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

        <title>Mis compras</title>

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
                    <a class="navbar-brand" href="principal.jsp"><img src="assets/images/logo.png" alt="" class="logoImg"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="principal.jsp"></a> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="productos.jsp"><i class="fa fa-car" aria-hidden="true"></i> Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="sobreNosotros.jsp"><i class="fa fa-globe" aria-hidden="true"></i>Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="carrito.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrito</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link " href="compras.jsp"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Mis compras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onclick="openModal()"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CerrarSesion">Salir</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="banner header-text">

        </div>
        <div class="container mt-5">
            <h1 class="mb-4">Consulta de Compras</h1>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID de compra</th>
                            <th>Nombre del producto</th>
                            <th>Cantidad</th>
                            <th>Costo por unidad</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%= cc.getProductosTabla((int) session.getAttribute("id"))%>
                    </tbody>
                </table>
            </div>
            <br>
            <a href="principal.jsp" class="btn btn-primary">Regresar</a>
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


    </body>

</html>
