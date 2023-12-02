<%-- 
    Document   : Eliminar.jsp
    Created on : 14/11/2023, 01:13:06 AM
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
                        <li class="nav-item active">
                            <a class="nav-link" href="principalAdmin.jsp> <i class="fa fa-home" aria-hidden="true"></i> Inicio
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"><i class="fa fa-user" aria-hidden="true"></i> <% out.println(usuario);%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="" data-toggle="modal" data-target="#ModalCRUD"><i class="fa fa-database" aria-hidden="true"></i> Administrar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
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
    </body>
</html>
