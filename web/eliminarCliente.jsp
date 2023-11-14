<%-- 
    Document   : eliminarCliente
    Created on : 14/11/2023, 12:31:47 AM
    Author     : oscar
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ModeloCliente"%>
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
                ModeloCliente modelC = new ModeloCliente();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Cliente c=(Cliente)modelC.getCliente(id);
            %>
            <h1>Eliminar Cliente</h1>
            <form action="CrudClientes?accion=consultar">
                Usuario: <br>
                <input type="text" name="txtNom" readonly value="<%= c.getUsuario()%>"><br>
                Contraseña:<br> 
                <input type="password" name="txtContrasena" readonly value="<%= c.getClave()%>"><br>
                <input type="hidden" name="txtid"  value="<%= c.getId()%>">
                <input type="submit" name="accion" value="Eliminar">
                <button class="filled-button">  <a href="CrudClientes?accion=consultar">Regresar</a></button>
                
            </form>
            
        </div>
        
    </body>
</html>
