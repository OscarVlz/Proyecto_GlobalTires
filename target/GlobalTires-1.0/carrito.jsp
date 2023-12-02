<%-- 
    Document   : carrito
    Created on : 11/11/2023, 09:40:25 PM
    Author     : Equipo 2
--%>

<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.dominio.Producto"%>
<%@page import="Modelo.dominio.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    Boolean compraExitosa = (Boolean) session.getAttribute("compraExitosa");
    if (compraExitosa != null && compraExitosa) {
%>
<script>
    $(document).ready(function () {
        $('#modalMensaje').modal('show');
    });
</script>
<%
        session.removeAttribute("compraExitosa");
    }
%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<%
String idProductoToRemove = request.getParameter("idToRemove");
if (idProductoToRemove != null && !idProductoToRemove.isEmpty()) {
    int id = Integer.parseInt(idProductoToRemove);
    if(articulos.contains(new Articulo(id))){
        articulos.remove(articulos.indexOf(new Articulo(id)));
    }
}
%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Nuestros productos</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
                            <a class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CerrarSesion">Salir</a>
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
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ControladorProducto cp = new ControladorProducto();
                                double total = 0;
                                if (articulos != null) {
                                    for (Articulo a : articulos) {
                                        Producto producto = cp.getProducto(a.getIdProducto());
                                        total += a.getCantidad() * producto.getPrecio();
                            %>
                            <tr data-id="<%= producto.getId()%>">
                                <td class="cart_product">
                                    <a id="idProducto" href="" hidden><%= producto.getId()%></a>
                                    <a href=""><img src="assets/images/<%= producto.getTipo()%>/<%= producto.getImg()%>" alt="" width="120" height="120"></a>
                                </td>
                                <td class="cart_description">
                                    <h4><a href=""><%= producto.getNombre()%></a></h4>
                                    <p><%= producto.getDescripcion()%></p>
                                </td>
                                <td class="cart_price">
                                    <p>$ <span class="precioUnitario"><%= producto.getPrecio()%></span> </p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href="#" onclick="cambiarCantidadCarrito('aumentar', this)"> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>"
                                               autocomplete="off" size="2">
                                        <a class="cart_quantity_down"  href="#" onclick="cambiarCantidadCarrito('reducir', this)"> - </a>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price">$<span class="subtotal"><%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></span></p>
                                </td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="#" onclick="eliminarCarrito(this)" id="deleteitem"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>
                            <% }
}%>
                        </tbody>
                    </table>
                    <% if (articulos == null || articulos.isEmpty()) {%>
                    <h4> No hay Articulos en el carro  </h4>
                    <% }
                    %>
                </div><a href="productos.jsp">Seguir Comprando</a>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header bg-dark text-white">Carrito</div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <td>Sub-total <span id="txt-subtotal"></td>
                                <td >$ <span id="sub-total"><%= Math.round(total * 100.0) / 100.0%></span></td></tr>
                            <tr><td>IVA<span></td>
                                <td>$ <span id="iva"><%= Math.round(total*16.0)/100.0%></span></span></td></tr>
                            <tr> <td>Total </td>
                                <td><span id="txt-total">$ <%= Math.round(total * 116.0) / 100.0%></span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-default update" href=""><i class="fa fa-shopping-cart"></i> Update</a>
                        <a class="btn btn-default check_out" href="" data-toggle="modal" data-target="#modalPago"><i class="fa fa-shopping-cart"></i> Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Footer -->
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
                            <input type="text" class="form-control" id="numeroTarjeta" placeholder="Ingresa el número de tarjeta">
                        </div>
                        <div class="form-group">
                            <label for="fechaVencimiento">Fecha de vencimiento</label>
                            <input type="date" class="form-control" id="fechaVencimiento">
                        </div>
                        <div class="form-group">
                            <label for="numSeguridad">Numero de seguridad</label>
                            <input type="number" class="form-control" id="numSeguridad">
                        </div>

                        <input type="hidden" value="<%= objSesion.getAttribute("id")%>" name="id">

                        <button type="button" id="botonPagar" class="btn btn-primary">Realizar Pago</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function cambiarCantidadCarrito(operacion, element) {
            const input = element.parentElement.querySelector('input');
            cantidad = input.value;

            if (operacion === 'aumentar') {
                const nuevaCantidad = parseInt(input.value) + 1;
                input.value = nuevaCantidad;
            }
            if (operacion === 'reducir') {
                if (cantidad == 1) {
                    const fila = element.closest('tr');
                    const idProducto = fila.querySelector('#idProducto').innerText;
                    fila.parentNode.removeChild(fila);
                    window.location.href = '?idToRemove=' + idProducto;

                }
                if (cantidad >= 2) {
                    const nuevaCantidad = parseInt(input.value) - 1;
                    input.value = nuevaCantidad;
                }

            }
            actualizarTotales()
        }
        function actualizarTotales() {
            let total = 0;

            document.querySelectorAll('tr[data-id]').forEach(fila => {
                const cantidad = parseInt(fila.querySelector('.cart_quantity_input').value);
                const precioUnitario = parseFloat(fila.querySelector('.precioUnitario').innerText);
                const subtotal = cantidad * precioUnitario;

                total += subtotal;

                fila.querySelector('.subtotal').innerText = subtotal.toFixed(2);
            });

            document.getElementById('sub-total').innerText = total.toFixed(2);
        }

        function eliminarCarrito(element) {
            const fila = element.closest('tr');
            const idProducto = fila.querySelector('#idProducto').innerText;
            fila.parentNode.removeChild(fila);
            window.location.href = '?idToRemove=' + idProducto;
        }

        function abrirModal(mensaje) {
            const textoModal = document.getElementById("textoModal").innerHTML = mensaje;
            $('#modalMensaje').modal('show');
        }

        function cerrarModalPago() {
            $('#modalPago').modal('hide');
        }

        const botonPagar = document.getElementById("botonPagar");
        const numTarjetaTxt = document.getElementById("numeroTarjeta");
        const fechaVencimientoTxt = document.getElementById("fechaVencimiento");
        const numSeguridadTxt = document.getElementById("numSeguridad");
        const tablaProductos = document.getElementById("shop-table");

        botonPagar.addEventListener("click", () => {
            const numTarjeta = numSeguridadTxt.value;
            const fechaVencimiento = fechaVencimientoTxt.value;
            const numSeguridad = numSeguridadTxt.value;
            filas = tablaProductos.rows;


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
                    totalProducto: parseFloat(celdas[4].querySelector(".cart_total_price").innerText.replace('$', ''))
                };

                infoCompra.CompraDTO.productos.push(producto);
            }
            const infoCompraJSON = JSON.stringify(infoCompra);

            cerrarModalPago();

            fetch("/GlobalTires/RealizarCompra", {
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
                        console.log('Respuesta:', data);
                        abrirModal("Pago realizado con exito!");
                    })
                    .catch(error => {
                        abrirModal("No se pudo realizar el pago del producto");
                        console.log(error);
                    });
        });




    </script>                  
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
</body>
</html>
