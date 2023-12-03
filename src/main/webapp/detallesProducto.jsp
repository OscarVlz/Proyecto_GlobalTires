<%-- 
    Document   : detallesProducto
    Created on : 11/11/2023, 08:39:53 PM
    Author     : Equipo 2
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion=request.getSession(false);
String usuario=(String) new ModeloCliente().getCliente(Integer.parseInt(session.getAttribute("id").toString())).getUsuario(); 
if (usuario==null) { response.sendRedirect("index.jsp"); } %>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.dominio.Producto"%>
<%@page import="Modelo.dominio.Cliente" %>
<%@page import="Modelo.ModeloCliente" %>
<%
    int idPro = Integer.parseInt(request.getParameter("idPro"));
    Producto producto = new ControladorProducto().getProducto(idPro);
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
                                <a class="nav-link active" href="products.html"><i class="fa fa-car" aria-hidden="true"></i> Productos</a>
                            </li>
                            <li class="nav-item">
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
                                <a class="nav-link" href="CerrarSesion">Salir</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="row">
                <div class="col-sm-9 padding-right">
                    <div class="view-product" id="product-container">
                        <div class="mt-3 mb-3">
                            <img src="assets/images/<%= producto.getTipo()%>/<%= producto.getImg()%>" alt="" id="imagenProducto" class="img-fluid" width="500" height="500"/>
                        </div>
                        <h2><%= producto.getNombre()%></h2>
                        <h4><%= producto.getDescripcion()%></h4>
                        
                        <form action="carrito.jsp" method="post" class="mt-3">
                            <div class="form-group">
                                <span class="d-block">Precio $<%= producto.getPrecio()%></span>
                                <label for="txt-cantidad">Cantidad:</label>
                                <input type="hidden" value="<%= producto.getId()%>" name="idproducto">
                                <input id="precio" type="hidden" value="<%= producto.getPrecio()%>" name="precio">
                                <input type="number" value="1" id="txt-cantidad" name="cantidad" class="form-control" min="1"/>
                            </div>
                            <div class="form-group">
                                <button id="botonAgregar" type="submit" href="carrito.jsp" class="btn btn-primary">
                                    <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                </button>
                                <a href="productos.jsp" class="btn btn-secondary ml-2">Volver</a>
                            </div>
                        </form>
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


        <script>
            console.log(document.getElementById("imagenProducto").getAttribute("src"));
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


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/carrito.js"></script>
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/isotope.js"></script>
        <script src="assets/js/accordions.js"></script>


        <script language = "text/Javascript">
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
    <script>
        let productData = {};
        document.addEventListener("DOMContentLoaded", function () {

            const productContainer = document.getElementById("product-container");
            if (productContainer) {
                const productName = productContainer.querySelector("h2").innerText;
                const productDescription = productContainer.querySelector("h4").innerText;
                const productPrice = parseFloat(document.getElementById("precio").value);
                const productId = productContainer.querySelector("input[name='idproducto']").value;
                const productImageSrc = document.getElementById("imagenProducto").getAttribute("src").replaceAll(' ','%20');

                productData = {
                    name: productName,
                    description: productDescription,
                    price: productPrice,
                    id: productId,
                    imageSrc: productImageSrc
                };
            }
        });

        let productosEnCarrito;

        let productosEnCarritoLS = sessionStorage.getItem("productos-en-carrito");

        if (productosEnCarritoLS) {
            productosEnCarrito = JSON.parse(productosEnCarritoLS);
        } else {
            productosEnCarrito = [];
        }

        const boton = document.getElementById("botonAgregar");
        boton.addEventListener("click", agregarAlCarrito);

        function agregarAlCarrito(e) {

            if (productosEnCarrito.some((element) => element.id === productData.id)) {
                const index = productosEnCarrito.findIndex((element) => element.id === productData.id);
                productosEnCarrito[index].cantidad += parseInt(document.getElementById("txt-cantidad").value);
            } else {
                productData.cantidad = parseInt(document.getElementById("txt-cantidad").value);
                productosEnCarrito.push(productData);
            }

            sessionStorage.setItem("productos-en-carrito", JSON.stringify(productosEnCarrito));
        }
    </script>
</html>
