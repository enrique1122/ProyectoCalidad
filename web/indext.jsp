<%-- 
    Document   : index
    Created on : 18-jun-2020, 17:04:05
    Author     : VB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>
        
        body{
            margin: 0px;
            background-image: url(imagenes/fondo.jpg);
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
             background-size: cover;
            
        }
        .xd{
            padding: 20px;            
        }
        a{
            padding: 10px;
            text-decoration: none;
            color: black;
            border: solid coral;
            border-radius: 20px;
            margin: 10px;
            font-size: 25px;
            font-family: initial;
            background: coral;
        }
        a:hover{
          color: white;              
        }
        
        .cerrar{
            float: right;
            margin: 0px 10px 10px 10px;
        }
        
        .usuario{
            color: white;
            padding-top: 850px;
            padding-left:  40px;
            color: chocolate;
            font-size: 50px;
        }
    </style>
    <body>
        <%
            String msg = request.getParameter("msg");
            if(msg != null){
                %> <script> alert("<%= msg %>"); </script> <%
            }
        %>
        <h1></h1>
        <div class="xd"></div>
        <a href="servletCliente?accion=listart">Listar CLiente</a>
        <a href="venta.jsp">Venta</a>
        <a class="cerrar"href="login.jsp">Cerrar Sesion</a>
        
        
        <div class="usuario"><img src="imagenes/loguin.gif" width="45px">
            <%out.print("Bienvenido: "+session.getAttribute("usuario"));%>
        </div>
    </body>
</html>



