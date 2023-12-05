<%-- 
    Document   : carrito
    Created on : 11/11/2023, 09:40:25 PM
    Author     : Equipo 2
--%>

<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.dominio.Producto"%>
<%@page import="Modelo.dominio.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ModeloCliente"%>
<%@page import="Modelo.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion=request.getSession(false);
String usuario=(String) new ModeloCliente().getCliente(Integer.parseInt(session.getAttribute("id").toString())).getUsuario(); 
if (usuario==null) { response.sendRedirect("index.jsp"); } %>
<%
    Boolean compraExitosa = (Boolean) session.getAttribute("compraExitosa");
    if (compraExitosa != null && compraExitosa) {
%>
<script>
    $(document).ready(function () {
        $('#modalMensaje').modal('show');
    });</script>
    <%
            session.removeAttribute("compraExitosa");
        }
    %>
    <%
        HttpSession sesion = request.getSession(true);
        ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
    %>
<!DOCTYPE html>
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
                            <a class="nav-link " href="productos.jsp"><i class="fa fa-car" aria-hidden="true"></i> Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sobreNosotros.jsp"><i class="fa fa-globe" aria-hidden="true"></i> Nosotros</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="carrito.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrito</a>
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
    <br>
    <br>
    <br>
    <br>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <div class="table-responsive cart_info" id="cart-container">
                    <table class="table table-condensed" id="shop-table">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Productos</td>
                                <td class="description">Descripción</td>
                                <td class="price">Precio</td>
                                <td class="quantity">Cantidad</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody id="tablaBody">
                        </tbody>
                    </table>
                </div><a href="productos.jsp">Seguir Comprando</a>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header bg-dark text-white">Carrito</div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <td>Sub-total <span id="txt-subtotal"></td>
                                <td >$ <span id="sub-total"></span></td></tr>
                            <tr><td>IVA<span></td>
                                <td>$ <span id="iva"></span></span></td></tr>
                            <tr> <td>Total </td>
                                <td>$ <span id="txt-total"> </span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-default check_out" href="" data-toggle="modal" data-target="#modalPago"><i class="fa fa-shopping-cart"></i> Pagar</a>
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

    <div class="modal fade" id="modalPago" tabindex="-1" role="dialog" aria-labelledby="modalPagoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalPagoLabel">Realizar Pago</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalBodyPago">
                    <form id="formularioPago">
                        <div class="form-group">
                            <label for="numeroTarjeta">Número de Tarjeta</label>
                            <input type="text" class="form-control" id="numeroTarjeta" placeholder="Ingresa el número de tarjeta" pattern="[0-9]{16}" maxlength="16">
                        </div>
                        <div class="form-group">
                            <label for="fechaVencimiento">Fecha de vencimiento</label>
                            <input type="date" class="form-control" id="fechaVencimiento" required>
                        </div>
                        <div class="form-group">
                            <label for="numSeguridad">Numero de seguridad</label>
                            <input type="text" class="form-control" id="numSeguridad" pattern="[0-9]{3}" maxlength="3" required>
                        </div>

                        <input type="hidden" value="<%= objSesion.getAttribute("id")%>" name="id">

                        <button type="button" id="botonPagar" class="btn btn-primary">Realizar Pago</button>
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

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/validaciones.js"></script>
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script>
                                function borrarDatos() {
                                    sessionStorage.clear();
                                }

                                let productosEnCarrito = sessionStorage.getItem("productos-en-carrito");
                                productosEnCarrito = JSON.parse(productosEnCarrito);

                                function cargarCarrito() {
                                    productosEnCarrito = sessionStorage.getItem("productos-en-carrito");
                                    const contenedorCarritoProductos = document.querySelector("#tablaBody");
                                    productosEnCarrito = JSON.parse(productosEnCarrito);
                                    contenedorCarritoProductos.innerHTML = "";

                                    if (productosEnCarrito && productosEnCarrito.length > 0) {
                                        productosEnCarrito.forEach(producto => {
                                            const tr = document.createElement("tr");
                                            tr.setAttribute("data-id", producto.id);
                                            tr.innerHTML = `
                <td class="cart_product">
                    <a id="idProducto" hidden>` + producto.id + `</a>
                    <a><img src=` + producto.imageSrc + ` alt="" width="120" height="120"></a>
                </td>
                <td class="cart_description">
                    <h4><a>` + producto.name + `</a></h4>
                    <p>` + producto.description + `</p>
                </td>
                <td class="cart_price">
                    <p>$ <span class="precioUnitario">` + producto.price + `</span> </p>
                </td>
                <td class="cart_quantity">
                    <div class="cart_quantity_button">
                        <a class="cart_quantity_up" href="#" onclick="cambiarCantidadCarrito('aumentar', this)"> + </a>
                        <input class="cart_quantity_input" type="text" name="quantity" value="` + producto.cantidad + `" max="99" autocomplete="off" size="2" disabled>
                        <a class="cart_quantity_down"  href="#" onclick="cambiarCantidadCarrito('reducir', this)"> - </a>
                    </div>
                </td>
                <td class="cart_delete">
                    <a class="cart_quantity_delete" href="#" id="deleteitem"><i class="fa fa-times"></i></a>
                </td>`;

                                            contenedorCarritoProductos.appendChild(tr);
                                        });
                                        actualizarTotales();
                                        asignarBotones();
                                    } else {
                                        const div = document.createElement("tr");
                                        div.innerHTML = `<h2>Carrito vacio</h2>`;
                                        contenedorCarritoProductos.appendChild(div);
                                        actualizarTotales();
                                    }
                                }
                                cargarCarrito();

                                function asignarBotones() {
                                    let botonesEliminar = document.querySelectorAll(".cart_quantity_delete");
                                    botonesEliminar.forEach(boton => {
                                        boton.addEventListener("click", eliminarDelCarrito);
                                    });
                                }

                                function eliminarDelCarrito(e) {
                                    const fila = e.target.closest('tr');
                                    const idProducto = fila.querySelector('#idProducto').innerText;
                                    const index = productosEnCarrito.findIndex(producto => producto.id === idProducto);

                                    productosEnCarrito.splice(index, 1);
                                    sessionStorage.setItem("productos-en-carrito", JSON.stringify(productosEnCarrito));
                                    cargarCarrito();
                                }

                                function cambiarCantidadCarrito(operacion, element) {
                                    const input = element.parentElement.querySelector('input');
                                    cantidad = input.value;

                                    if (operacion === 'aumentar' && cantidad < 99) {
                                        const nuevaCantidad = parseInt(input.value) + 1;
                                        input.value = nuevaCantidad;
                                    }
                                    if (operacion === 'reducir') {
                                        if (cantidad <= 1) {
                                            return;
                                        }
                                        if (cantidad >= 2) {
                                            const nuevaCantidad = parseInt(input.value) - 1;
                                            input.value = nuevaCantidad;
                                        }
                                    }
                                    actualizarTotales();
                                }

                                function actualizarTotales() {
                                    let subtotal = 0.0;
                                    let iva = 0.0;
                                    document.querySelectorAll('tr[data-id]').forEach(fila => {
                                        const cantidad = parseInt(fila.querySelector('.cart_quantity_input').value);
                                        const precioUnitario = parseFloat(fila.querySelector('.precioUnitario').innerText);
                                        const aux = cantidad * precioUnitario;

                                        subtotal += aux;

                                    });
                                    iva = subtotal * 0.16;

                                    document.getElementById('sub-total').innerText = subtotal.toFixed(2);
                                    document.getElementById('iva').innerText = (iva).toFixed(2);
                                    document.getElementById('txt-total').innerText = (subtotal + iva).toFixed(2);
                                }


                                function abrirModal(mensaje) {
                                    const textoModal = document.getElementById("textoModal").innerHTML = mensaje;
                                    $('#modalMensaje').modal('show');
                                }

                                function cerrarModalPago() {
                                    $('#modalPago').modal('hide');
                                }
                                function validarPago(numTarjeta, fecha, numSeguridad) {
                                    if (!(/^\d{16}$/.test(numTarjeta))) {
                                        alert("Formato de tarjeta invalido");
                                        return false;
                                    }
                                    if (!(/^[0-9]{3}$/.test(numSeguridad))) {
                                        alert("Numero de seguridad invalido");
                                        return false;
                                    }

                                    if (new Date(fecha) <= new Date()) {
                                        alert("Tarjeta vencida");
                                        return false;
                                    }
                                    return true;
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

                                const botonPagar = document.getElementById("botonPagar");
                                const numTarjetaTxt = document.getElementById("numeroTarjeta");
                                const fechaVencimientoTxt = document.getElementById("fechaVencimiento");
                                const numSeguridadTxt = document.getElementById("numSeguridad");
                                const tablaProductos = document.getElementById("shop-table");

                                botonPagar.addEventListener("click", () => {
                                    const numTarjeta = numTarjetaTxt.value;
                                    const fechaVencimiento = fechaVencimientoTxt.value;
                                    const numSeguridad = numSeguridadTxt.value;
                                    filas = tablaProductos.rows;

                                    if (!validarPago(numTarjeta, fechaVencimiento, numSeguridad)) {
                                        return;
                                    }

                                    const infoCompra = {
                                        CompraDTO: {
                                            numTarjeta,
                                            fechaVencimiento,
                                            numSeguridad,
                                            productos: []
                                        }
                                    };
                                    for (let i = 1; i < filas.length; i++) {
                                        const celdas = filas[i].cells;
                                        console.log(celdas[0].querySelector('#idProducto').innerText);

                                        const producto = {
                                            id: celdas[0].querySelector('#idProducto').innerText,
                                            precio: parseFloat(celdas[2].querySelector("p").innerText.replace('$', '')),
                                            cantidad: parseInt(celdas[3].querySelector(".cart_quantity_input").value),
                                            totalProducto: parseFloat(celdas[2].querySelector("p").innerText.replace('$', '')) * parseInt(celdas[3].querySelector(".cart_quantity_input").value)
                                        };

                                        infoCompra.CompraDTO.productos.push(producto);
                                    }
                                    const infoCompraJSON = JSON.stringify(infoCompra);

                                    cerrarModalPago();

                                    fetch("/Proyecto_GlobalTires/RealizarCompra", {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json'
                                        },
                                        body: infoCompraJSON
                                    }).then(response => {
                                        if (!response.ok) {
                                            throw new Error(response.statusText);
                                        }
                                        return response.json();
                                    })
                                            .then(data => {
                                                if (data.respuesta === "exito") {
                                                    abrirModal("Pago realizado con exito!");
                                                    $('#modalMensaje').on('hidden.bs.modal', function () {
                                                        sessionStorage.setItem("productos-en-carrito", JSON.stringify([]));
                                                        cargarCarrito();
                                                        window.location.href = "compras.jsp";
                                                    });
                                                } else {
                                                    console.log(data);
                                                    abrirModal(JSON.stringify(data.valores.mensaje).replaceAll('"', ''));
                                                }
                                            })
                                            .catch(error => {
                                                abrirModal(JSON.stringify(data.valores.mensaje).replaceAll('"', ''));
                                                console.log(error);
                                            });
                                });
                                function abrirModal(mensaje) {
                                    const textoModal = document.getElementById("textoModal").innerHTML = mensaje;
                                    $('#modalMensaje').modal('show');
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

                                        if (!validarFormulario(usuario, pass, nombres, apellidoP, apellidoM, correo, )) {
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
