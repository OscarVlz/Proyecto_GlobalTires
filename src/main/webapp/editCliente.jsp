<%-- 
    Document   : editCliente
    Created on : 13 nov. 2023, 20:09:56
    Author     : Equipo 2
--%>

<%@page import="Modelo.dominio.Cliente"%>
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
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Modificar Cliente</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body>
        <div class="container mt-5">
            <%
                ModeloCliente modelC = new ModeloCliente();
                int id = Integer.parseInt((String) request.getAttribute("idper"));
                Cliente c = (Cliente) modelC.getCliente(id);
            %>
            <h1>Modificar Cliente</h1>
            <form action="CrudClientes?accion=consultar" method="get">
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" id="usuario" name="usuario" placeholder="Nombre de Usuario" class="form-control" maxlength="16" pattern="/^(?![\s]+$)[a-zA-Z0-9._-]+$/" value="<%= c.getUsuario()%>">
                </div>
                <div class="form-group">
                    <label for="pass">Contraseña:</label>
                    <input type="password" id="pass" name="pass" class="form-control"  placeholder="Contraseña" maxlength="30"  value="<%= c.getPass()%>">
                </div>
                <div class="form-group">
                    <label for="pass">Nombres:</label>
                    <input type="text" id="nombres" name="nombres" class="form-control" placeholder="Nombres" maxlength="50"  value="<%= c.getNombres()%>" required>
                </div>
                <div class="form-group">
                    <label for="pass">Apellido paterno:</label>
                    <input type="text" id="apellidoP" name="apellidoP" class="form-control" placeholder="Apellido paterno" maxlength="40"  value="<%= c.getApellidoP()%>" required>
                </div>
                <div class="form-group">
                    <label for="pass">Apellido materno:</label>
                    <input type="text" id="apellidoM" name="apellidoM" class="form-control" placeholder="Apellido materno" maxlength="40"  value="<%= c.getApellidoM()%>" required>
                </div>
                <div class="form-group">
                    <label for="pass">Correo:</label>
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="correo@mail.com" maxlength="60"  value="<%= c.getCorreo()%>" required>
                </div>
                <input type="hidden" name="txtid" value="<%= c.getId()%>">
                <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
                <button type="button" class="btn btn-secondary" id="btnRecargar">Restaurar</button>
                <a href="CrudClientes?accion=consultar" class="btn btn-secondary">Regresar</a>
            </form>
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
            document.addEventListener('DOMContentLoaded', function () {
                let btnRecargar = document.getElementById('btnRecargar');

                btnRecargar.addEventListener('click', function () {
                    location.reload(true);
                });
            });
        </script>        
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
