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
                                <input type="text" class="form-control" id="usuario" name="usuario" maxlength="16" value="<%= c.getUsuario()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="pass">Password:</label>
                                <input type="password" class="form-control" id="pass" name="pass" maxlength="30" value="<%= c.getPass()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="correo">Correo electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" maxlength="60" value="<%= c.getCorreo()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="nombres">Nombres:</label>
                                <input type="text" class="form-control" id="nombres" name="nombres" maxlength="50" value="<%= c.getNombres()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="apellidoP">Apellido Paterno:</label>
                                <input type="text" class="form-control" id="apellidoP" name="apellidoP" maxlength="40" value="<%= c.getApellidoP()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="apellidoM">Apellido Materno:</label>
                                <input type="text" class="form-control" id="apellidoM" name="apellidoM" maxlength="40" value="<%= c.getApellidoM()%>" required>
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


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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

                                    function validarFormulario(usuario, pass, nombres, apellidoP, apellidoM, correo) {

                                        if (usuario.length < 8 || !(/^[a-zA-Z0-9._-]+$/.test(usuario)) || !(/^(?!\s+$).+/.test(usuario))) {
                                            alert('El usuario debe tener al menos 8 caracteres. Puede contener numeros y los caracteres= ". - _"');
                                            return false;
                                        }

                                        if (pass.length < 8 || !(/^(?!\s+$).+/.test(pass))) {
                                            alert('La contraseña debe de tener al menos 8 caracteres');
                                            return false;
                                        }

                                        if (nombres.length < 3 || !(/^[a-zA-Z\s]+$/.test(nombres)) || !(/^(?!\s+$).+/.test(nombres))) {
                                            alert('El nombre debe tener almenos 3 caracteres y solo puede contener letras y espacios.');
                                            return false;
                                        }

                                        if (apellidoP.length < 3 || !(/^[a-zA-Z\s]+$/.test(apellidoP)) || !(/^(?!\s+$).+/.test(apellidoP))) {
                                            alert('El apellido paterno debe de tener almenos 3 caracteres y solo puede contener letras y espacios');
                                            return false;
                                        }

                                        if (apellidoM.length < 3 || !(/^[a-zA-Z\s]+$/.test(apellidoM) || !(/^(?!\s+$).+/.test(apellidoM)))) {
                                            alert('El apellido materno debe de tener almenos 3 caracteres y solo puede contener letras y espacios');
                                            return false;
                                        }

                                        if (correo.length < 8 || !(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(correo)) || !(/^(?!\s+$).+/.test(correo))) {
                                            alert('El correo debe de seguir el formato example@example.com');
                                            return false;
                                        }

                                        return true;
                                    }

                                    document.addEventListener("DOMContentLoaded", function () {
                                        const updateUserForm = document.getElementById("updateUserForm");
                                        const botonRegistrar = document.getElementById("botonRegistrar");
                                        const inputUsuario = document.getElementById("usuario");
                                        const inputPass = document.getElementById("pass");
                                        const inputNombres = document.getElementById("nombres");
                                        const inputApellidoP = document.getElementById("apellidoP");
                                        const inputApellidoM = document.getElementById("apellidoM");
                                        const inputCorreo = document.getElementById("correo");

                                        updateUserForm.addEventListener("submit", function (event) {
                                            event.preventDefault();

                                            const formData = new FormData(updateUserForm);
                                            const userData = {ClienteDTO: {}};
                                            let usuario = inputUsuario.value;
                                            let pass = inputPass.value;
                                            let nombres = inputNombres.value;
                                            let apellidoP = inputApellidoP.value;
                                            let apellidoM = inputApellidoM.value;
                                            let correo = inputCorreo.value;

                                            if (!validarFormulario(usuario, pass, nombres, apellidoP, apellidoM, correo)) {
                                                return;
                                            }

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
