<%-- 
    Document   : listar
    Created on : 18-jun-2020, 17:15:11
    Author     : VB
--%>

<%@page import="ayuda.ayuditas"%>
<%@page import="modelo.empleado"%>
<%@page import="modelo.cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1 align="center">Lista de Empleados</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td colspan="2" align="center"> <a href="agregarEmpleado.jsp">Agregar</a></td>
                        <td><a href="index.jsp">Salir</a></td
                    </tr>
                    <tr align="center">
                        <td>Id</td><td>Dni</td><td>Nombre</td><td>Apellido</td><td>Direccion</td><td>Telefono</td><td>Rango</td><td>Usuario</td><td>Password</td><td colspan="2">ACCIONES</td>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<empleado> lista = (ArrayList<empleado>)request.getAttribute("lista");
                    for(int i=0;i<lista.size();i++){%>
                    <tr align="center">
                        <td><%=lista.get(i).getId()%></td>
                        <td><%=lista.get(i).getDni()%></td>
                        <td><%=lista.get(i).getNombre()%></td>
                        <td><%=lista.get(i).getApellido()%></td>
                        <td><%=lista.get(i).getDireccion()%></td>
                        <td><%=lista.get(i).getTelefono()%></td>
                        <td><%=new ayuditas().devolverRango(lista.get(i).getRango())%></td>
                        <td><%=lista.get(i).getUsuario()%></td>
                        <td><%=lista.get(i).getPassword()%></td>
                        <td> <a href="editarEmpleado.jsp?cod=<%=lista.get(i).getId()%>">Actualizar</a> </td>
                        <td> <a href="servletEmpleado?accion=eliminar&cod=<%=lista.get(i).getId()%>">Eliminar</a> </td>
                    </tr>
                    <%}
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
