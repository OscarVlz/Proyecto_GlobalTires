<%-- 
    Document   : menu
    Created on : 31/10/2023, 10:52:07 AM
    Author     : oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <title>Global Tires</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--
      
      
        -->

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form action="iniciar" method="post">
            <input type="text" name="usuario" placeholder="Nombre de Usuario"><br>
            <input type="password" name="pass"><br>
            <input type="submit" value="Iniciar Sesion">
        </form>
        <br>
        No tienes cuenta........<a href="registro.jsp">Registrar</a>
    </body>
</html>
