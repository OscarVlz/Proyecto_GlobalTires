<%-- 
    Document   : editCliente
    Created on : 13 nov. 2023, 20:09:56
    Author     : Equipo 2
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%
                ModeloCliente modelC = new ModeloCliente();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Cliente c=(Cliente)modelC.getCliente(id);
            %>
            <h1>Modificar Persona</h1>
            <form action="CrudClientes?accion=consultar">
                Usuario: <br>
                <input type="text" name="txtNom" value="<%= c.getUsuario()%>"><br>
                Contraseña:<br> 
                <input type="password" name="txtContrasena" value="<%= c.getClave()%>"><br>
                <input type="hidden" name="txtid"  value="<%= c.getId()%>">
                <input type="submit" name="accion" value="Actualizar">
                <button class="filled-button"> <a href="CrudClientes?accion=consultar">Regresar</a> </button>
            </form>
            
        </div>
    </body>
</html>
