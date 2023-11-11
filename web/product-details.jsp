<%-- 
    Document   : menu
    Created on : 31/10/2023, 10:52:07 AM
    Author     : oscar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if(usuario == null){
       response.sendRedirect("index.jsp");
    }
%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%
    int id= Integer.parseInt(request.getParameter("id"));
    Producto producto = new ControladorProducto().getProducto(id);
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
        <div class="col-sm-9 padding-right">
            <div class="view-product">
                <img src="images/<%= producto.getImg()%>" alt="" />
                <h2><%= producto.getNombre()%></h2>
                <h4>Web ID: <%= producto.getId()%></h4>
                <img src="images/rating.png" alt="" />
                <form action="agregarproducto" method="post">
                    <span>
                        <span>Precio $<%= producto.getPrecio()%></span><br>
                        <label>Cantidad: </label>
                        <input type="hidden" value="<%= producto.getId()%>" name="idproducto">
                        <input type="text" value="1" id="txt-cantidad" name="cantidad"/><br>
                        <button type="submit" class="btn btn-fefault cart">
                            <i class="fa fa-shopping-cart"></i>
                            Add to cart
                        </button>
                    </span>
                </form>
            </div>
        </div>                
    </body>
</html>
