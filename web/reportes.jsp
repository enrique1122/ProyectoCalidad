<%-- 
    Document   : reportes
    Created on : 14-jul-2020, 14:34:04
    Author     : VB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <style>
        body{
            margin: 0px;
            background-image: url(imagenes/resportes.jpg);  
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
             background-size: cover;
        }
        
        .nav-tabs{
            font-size: 30px;
        }
        
        .nav-link{
            color: #ffffff;
            margin-right: 10px;
        }
        
        .nav-link:hover{
            color: #cc6600;
        }
        
        h2{
            color: #ffffff;
            font-size: 50px;
            margin-top: 53px;
        }
    </style>
    <body>        
            <div class="container">
              <h2>Reportes</h2>
              <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" href="rdia.jsp">Dia</a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="index.jsp">Salir</a>
                </li>
              </ul>
            </div>

    </body>
</html>
