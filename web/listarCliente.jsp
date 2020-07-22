<%-- 
    Document   : listar
    Created on : 18-jun-2020, 17:15:11
    Author     : VB
--%>

<%@page import="modelo.cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    function numeros(e){
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    numero = "0123456789";
    if (numero.indexOf(teclado) == -1) return false; 
    }

    function letras(e) {
        key = e.keyCode || e.which;
        teclado1 = String.fromCharCode(key).toLowerCase(); //convertir a minusculas
        letra = "abcdefghijklmnñopqrstuvwxyz ";
        if (letra.indexOf(teclado1) == -1)  return false;
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
        <h1 align="center">Lista de Clientes</h1>
        <table class="table table-striped">
            
            <thead>
                <tr>
                    <td colspan="2" align="center"> <a href="agregarCliente.jsp">Agregar</a></td>
                    <td><a href="index.jsp">Salir</a></td
                </tr>
                <tr align="center">
                    <td>Id</td><td>Dni</td><td>Nombre</td><td>Apellido</td><td>Direccion</td><td>Telefono</td><td colspan="2">ACCIONES</td>
                </tr>
            </thead>
            <tbody>
                <%
                List<cliente> lista = (ArrayList<cliente>)request.getAttribute("lista");
                for(int i=0;i<lista.size();i++){%>
                <tr align="center">
                    <td><%=lista.get(i).getId_cliente()%></td>
                    <td><%=lista.get(i).getDni_cli()%></td>
                    <td><%=lista.get(i).getNombre_cli()%></td>
                    <td><%=lista.get(i).getApellido_cli()%></td>
                    <td><%=lista.get(i).getDireccion_cli()%></td>
                    <td><%=lista.get(i).getTelefono_cli()%></td>
                    <td> <a href="editarCliente.jsp?cod=<%=lista.get(i).getId_cliente()%>">Actualizar</a> </td>
                    <td> <a href="servletCliente?accion=eliminar&cod=<%=lista.get(i).getId_cliente()%>">Eliminar</a> </td>
                </tr>
                <%}
                %>
            </tbody>
        </table>
        
        <form>
            <h1 align="center">Busqueda de Clientes</h1>
            <p align="center"> <input type="text" placeholder="Ingrese dni" name="buscado" required="" onkeypress="return numeros(event)" maxlength="8"> <input type="submit" name="Buscar" value="Buscar"> </p>
            <input type="hidden" name="accion" value="buscar">
        </form>    
            
       </div> 
    </body>
</html>

