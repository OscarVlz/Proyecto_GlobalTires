<%-- 
    Document   : Eliminar.jsp
    Created on : 14/11/2023, 01:13:06 AM
    Author     : oscar
--%>

<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ModeloProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuarioAdmin");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
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

    <body>
        <div>
            <%
                ModeloProducto modelP = new ModeloProducto();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Producto p=(Producto)modelP.getProducto(id);
            %>
            <h1>Eliminar Producto</h1>
            <form action="CrudProductos?accion=consultar">
                Nombre <br>
                <input type="text" name="txtNom" value="<%= p.getNombre()%>"><br>
                Tipo<br> 
                <input type="text" name="txtTipo" value="<%= p.getTipo()%>"><br>
                Imagen<br> 
                <input type="text" name="txtimg" value="<%= p.getImg()%>"><br> 
                Precio<br> 
                <input type="text" name="txtPrecio" value="<%= p.getPrecio()%>"><br>
                Stock<br> 
                <input type="text" name="txtStock" value="<%= p.getStock()%>"><br>
                Descripcion<br> 
                <input type="text" name="txtDescripcion" value="<%= p.getDescripcion()%>"><br>
                
                <input type="hidden" name="txtid"  value="<%= p.getId()%>">
                <input type="submit" name="accion" value="Eliminar">
                <button class="filled-button"> <a href="CrudProductos?accion=consultar">Regresar</a> </button>
            </form>
            
        </div>
    </body>
</html>
