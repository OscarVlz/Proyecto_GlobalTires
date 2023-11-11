<%-- 
    Document   : menu
    Created on : 31/10/2023, 10:52:07 AM
    Author     : oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
    </head>
    <body>
        <h1>Registrar Usuario</h1>
        <form action="nuevousuario" method="post">
            <input type="text" name="usuario" placeholder="Nombre de Usuario"><br>
            <input type="password" name="pass"><br>
            <input type="submit" value="Registrar Usuario">
        </form>
    </body>
</html>
