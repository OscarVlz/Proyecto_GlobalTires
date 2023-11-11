<%-- 
    Document   : menu
    Created on : 31/10/2023, 10:52:07 AM
    Author     : oscar
--%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if(usuario == null){
       response.sendRedirect("index.jsp");
    }
%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-
              lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
            <a class="navbar-brand" href="#">Logo</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
            </ul>
            <ul class="navbar-nav" style="right: 5px; position: absolute;">
                <li class="nav-item text-white"><% out.println(usuario);%></li>
            </ul>
        </nav>
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
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="images/<%= producto.getImg()%>" alt="" width="120"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href=""><%= producto.getNombre()%></a></h4>
                                        <p>Web ID: <%= producto.getId()%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>$<%= producto.getPrecio()%></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_up" href=""> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>"
                                                   autocomplete="off" size="2">
                                            -
                                            <a class="cart_quantity_down" href=""> </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                    </td>
                                    <td class="cart_delete">
                                        <span id="idarticulo" style="display:none;"><%= producto.getId()%></span>
                                        <a class="cart_quantity_delete" href="" id="deleteitem"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                                <% }
                                }%>
                            </tbody>
                        </table>
                        <% if (articulos == null) {%>
                        <h4> No hay Articulos en el carro  </h4>
                        <% }%>
                    </div><a href="javascript:window.history.go(-2);">Seguir Comprando</a>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Carrito</div>
                        <div class="card-body">
                            <table>
                                <tr>
                                    <td>Sub-total <span id="txt-subtotal"></td>
                                    <td>$ <%= Math.round(total * 100.0) / 100.0%></span></td></tr>
                                <tr><td>IVA<span></td>
                                    <td>$ 0.0</span></td></tr>
                                <tr> <td>Total </td>
                                    <td><span id="txt-total">$ <%= Math.round(total * 100.0) / 100.0%></span></td>
                                </tr>
                            </table>
                        </div>
                        <div class="card-footer">
                            <a class="btn btn-default update" href=""><i class="fa fa-shopping-cart"></i> Update</a>
                            <a class="btn btn-default check_out" href=""><i class="fa fa-shopping-cart"></i> Check Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </body>
</html>
