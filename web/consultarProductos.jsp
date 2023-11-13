<%-- 
    Document   : crudProductos
    Created on : 12/11/2023, 07:53:56 PM
    Author     : JORGE
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
<%@page import="Modelo.Producto"%>
<%
    ControladorProducto cp = new ControladorProducto();
%>
<!DOCTYPE html>
<html>
    <head>
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

    </head>
    <body>
        <h1>Consulta</h1>
        <div>
            <h1>Productos</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Img_producto</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Descripcion</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%=cp.getProductosTabla()%>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
