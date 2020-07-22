<%-- 
    Document   : rdia.jsp
    Created on : 14-jul-2020, 14:37:14
    Author     : VB
--%>

<%@page import="modelo.detalleVenta"%>
<%@page import="ayuda.ayuditas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.venta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        .enviar{
            text-align: center;
        }
        body{
            margin: 0px;
            background-image: url(imagenes/dia.jpg);  
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
             background-size: cover;
        }
        .titulo{
            text-align: center;
            color: #ffffff;
            margin: 30px 40px;
        }
        
        td{
            font-size: 20px;
            color: #ffffff;
        }
        
        .fechin{
            font-size: 20px;
            margin: 10px ;
            background: #ff9966;
        }
        .f1{
           margin-top: 30px; 
        }
        
        .subt{
            color: #ffffff;
            font-size: 30px;
            margin: 20px;
            text-align: center;
        }
        
        .cbo{
            width: 200px;
            color: #ff9900;
            font-size: 20px;
            text-align: center;
        }
        input{
            margin: 20px;
        }
        .keke{
            text-align: center;
        }
    </style> 
    <%
        double total = 0;
    %>
    <body>
        <div class="container">
        <h1 class="titulo">Reporte Por Dia</h1>
        <form action="servletReporte" class="enviar">
            <div class="subt">Seleccione Año </div> 
            <div class="container">
                <select class="cbo" name="fecha">
                <%
                    List<Integer> listaa = new ayuditas().Year();
                    for (int i = 0; i < listaa.size(); i++) {%>
                    <option value="<%=listaa.get(i)%>"><%=listaa.get(i)%></option>      
                    <%    }
                %>
                
                </select>
            </div>
            <input type="submit" name="accion" value="EnviarYear" class="btn btn-primary">
        </form>
        <form>
            <table class="table table-striped">
                <tr>
                    <td>Id</td><td>Cliente</td><td>Empleado</td><td>Fecha</td><td>Total</td><td>Detalle</td>
                </tr>
                <%
                    if(request.getAttribute("lista") != null) {
                        List<venta> lista = (ArrayList<venta>)request.getAttribute("lista");
                        for (int i = 0; i < lista.size(); i++) { total += lista.get(i).getTotal();  %>
                        <tr>
                            <td><%=lista.get(i).getId()%></td>
                            <td><%= new ayuditas().ObtenerNombreClienteReporte(String.valueOf(lista.get(i).getCliente()))%></td>
                            <td><%= new ayuditas().ObtenerNombreEmpleadoReporte(String.valueOf(lista.get(i).getEmpleado()))%></td>
                            <td><%=lista.get(i).getFecha()%></td>
                            <td><%=lista.get(i).getTotal()%></td>
                            <td><input type="radio" name="id" value="<%=lista.get(i).getId()%>"></td>
                        </tr>
                        
                        <%}
                    }
                %>
                   
                        <tr>
                            <td colspan="4"></td>
                            <td><% out.print("S/. "+total); %></td>
                        </tr>
            </table>
            <p align="center"><input type="submit" name="accion" value="Ver Detalle De Factura Year" class="btn btn-primary">
                                    <a  href="index.jsp" class="btn btn-primary"/>Salir</a>
</p>            
        </form>
        <form>
            <table class="table table-striped">
                
                <%
                    if(request.getAttribute("listaDVY") != null) {
                        List<detalleVenta> lista = (ArrayList<detalleVenta>)request.getAttribute("listaDVY");%>
                        <tr>
                            <td>Id</td><td>Venta</td><td>Producto</td><td>Cantidad</td>
                        </tr>
                        <%
                        for (int i = 0; i < lista.size(); i++) {%>
                        <tr>
                            <td><%=lista.get(i).getId()%></td>
                            <td><%=lista.get(i).getId_venta()%></td>
                            <td><%= new ayuditas().ObtenerNombreProductoReporte(String.valueOf(lista.get(i).getId_producto()))%></td>
                            <td><%=lista.get(i).getCantidad()%></td>
                        </tr>    
                        <%}
                    }
                %>
                
            </table>        
        </form>
    </div>
    </body>
</html>
