<%-- 
    Document   : editProducto
    Created on : 13/11/2023, 11:56:20 PM
    Author     : oscar
--%>

<%@page import="Modelo.dominio.Producto"%>
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
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Modificar Producto</title>

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="jquery-3.6.4.min.js"></script>

        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>

    <body>
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="principalAdmin.jsp"><img src="assets/images/logo.png" alt="" class="logoImg"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="principalAdmin.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="" data-toggle="modal"
                                   data-target="#ModalCRUD"><i class="fa fa-database"
                                                            aria-hidden="true"></i> Administrar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="banner header-text">

        </div>

        <div class="container mt-5">
            <%
                   ModeloProducto modelP = new ModeloProducto();
                   int id = Integer.parseInt((String) request.getAttribute("idper"));
                   Producto c=(Producto)modelP.getProducto(id);
            %>
            <h1>Modificar Producto</h1>
            <form action="CrudProductos?accion=Actualizar" method="post">
                <div class="form-group">
                    <label for="txtNom">Nombre:</label>
                    <input type="text" id="txtNom" name="txtNom" class="form-control" value="<%= c.getNombre()%>">
                </div>
                <div class="form-group">
                    <label for="txtTipo">Tipo:</label>
                    <input type="text" id="txtTipo" name="txtTipo" class="form-control" value="<%= c.getTipo()%>">
                </div>
                <div class="form-group">
                    <label for="txtimg">Imagen:</label>
                    <input type="text" id="txtimg" name="txtimg" class="form-control" value="<%= c.getImg()%>">
                </div>
                <div class="form-group">
                    <label for="txtPrecio">Precio:</label>
                    <input type="text" id="txtPrecio" name="txtPrecio" class="form-control" value="<%= c.getPrecio()%>">
                </div>
                <div class="form-group">
                    <label for="txtStock">Stock:</label>
                    <input type="text" id="txtStock" name="txtStock" class="form-control" value="<%= c.getStock()%>">
                </div>
                <div class="form-group">
                    <label for="txtDescripcion">Descripción:</label>
                    <input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" value="<%= c.getDescripcion()%>">
                </div>

                <input type="hidden" name="txtid" value="<%= c.getId()%>">
                <button type="submit" name="accion" value="Actualizar" class="btn btn-primary">Actualizar</button>
                <button type="button" class="btn btn-secondary" id="btnRecargar">Restaurar</button>
                <a href="CrudProductos?accion=consultar" class="btn btn-secondary">Regresar</a>

            </form>
        </div>
        <div class="modal fade1" id="ModalCRUD" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Administrar</h4><br>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <button class="filled-button"><a href="CrudProductos?accion=consultar">Productos</a></button><br>
                            <button class="filled-button"><a href="CrudClientes?accion=consultar">Usuarios</a></button>
                            <br>
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

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                let btnRecargar = document.getElementById('btnRecargar');

                btnRecargar.addEventListener('click', function () {
                    location.reload(true);
                });
            });
        </script>        
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
