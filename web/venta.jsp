<%-- 
    Document   : venta
    Created on : 30-jun-2020, 22:49:52
    Author     : VB
--%>

<%@page import="fecha.Fecha"%>
<%@page import="modelo.detalleVenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.producto"%>
<%@page import="modelo.categoria"%>
<%@page import="ayuda.ayuditas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<producto> listaa = null;
  double total = 0;
  double igv = 0;
  double subtotal = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    
    <style>
        .productos{
            float: right;
        }
        
        .clientes{
            float: left;
        }
        
        .xdxdxd{            
            margin-top: 44px;
        }
        
        .fecha{
            margin-left: 47.5%;
            color: blue;
            font-size: 20px;
        }
        
        .limpiar{
            clear: both;
        }
    </style>
    
    <script>
        function cliente(){
            var cliente = document.getElementById("dni").value;
        if(cliente.length != 8){
           alert("El dni debe tener 8 caracteres");
        return false;}
        }
        
        function cliente2(){
            var cliente = document.getElementById("dni").value;
            var clientee = document.getElementById("dnii");
        if(clientee === null){
           alert("ingrese un cliente");
            return false;
        }
        }
        
        function producto(){
            var stock = parseInt(document.getElementById("stock").value);
            var cantidad = parseInt(document.getElementById("cantidad").value);
        if(stock < cantidad){
           alert("no hay suficientes productos");
        return false;}
        }
        
        
        
    </script>
    
    <body>
        <%String dni = "00000000";%>
        <h1 align="center">Venta</h1>
        <div class="fecha">
            <%out.print(new Fecha().getDate());
            %>
        </div>
        <div class="container">
            <div class="clientes">
                <form action="servletVenta">
                    <%
                        if(request.getParameter("mensaje") != null) {%> <script> alert("<%=request.getParameter("mensaje")%>"); </script> <%
                   } %>
                    <h2 class="xdxdxd">Busca tu Cliente</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td colspan="2"><input type="text" placeholder="Ingrese Dni" name="dni" id="dni" required=""> <input class="btn btn-primary" type="submit" name="Enviar" value="Enviar" onclick="return cliente()"></td>
                 
                        </tr>
                        <tr>
                            <td>Id</td><td>Cliente</td> 
                        </tr>
                    </thead>
                    <input type="hidden" name="nombre_empleado" value="<%=session.getAttribute("usuario")%>"> 
                    <input type="hidden" name="accion" value="ventaFantasma"> 
                    <tbody>
                        <%
                            if(request.getParameter("dni") != null){
                            List<String> lista = new ayuditas().llenarClieneEnVenta(request.getParameter("dni"));
                            %><input type="hidden" id="dnii" value="<%=request.getParameter("dni")%>"><%
                        %>
                        
                        <td><%=lista.get(0)%></td>
                        <td><%=lista.get(1)%></td>

                        <%}%>
                    </tbody>
                    </table>
                </form>
            </div>
        
      
            <div class="productos">
                <form action="">
                    <br><br/>
                    <% if(request.getParameter("dni") != null){%>
                    <input type="hidden" name="dni" value="<%=request.getParameter("dni")%>"> <%}%>
                    <h2 align="center">Buscar Producto</h2>
                    <p align="center"><input type="text" name="id_producto" placeholder="Ingrese Codigo" required=""> <input class="btn btn-primary" type="submit" name="Enviarr" value="Buscar" onclick="return cliente2()">
                    <input type="hidden" name="activo" value="1"></p>
                </form>    
                <%
                    int r = -1;
                    r = new ayuditas().llenarDetalleProductoAyuda(request.getParameter("id_producto"));
                    if(request.getParameter("id_producto") != null && r != 0){
                    listaa = new ayuditas().llenarDetalleProducto(request.getParameter("id_producto"));  %> 
                    
                    <form action="servletDetalleventa"> 
                        <p align="center">Nombre: <label><%=listaa.get(0).getNombre()%></label></p>
                        <p align="center">Precio: <label><%=listaa.get(0).getPreciov()%></label></p>
                        <p align="center">Stock :  <input id="stock" value="<%=listaa.get(0).getCantidad()%>" disabled='1'></p>
                        <p align="center">Cantidad: <input type="number" name="cantidad" required="" id="cantidad"></p>
                        <input type="hidden" name="idd_producto" value="<%=listaa.get(0).getId()%>"> 
                        <p align="center"><input type="submit" name="accion" value="agregar" onclick="return producto()"></p>
                        <input type="hidden" name="dni" value="<%=request.getParameter("dni")%>">
                    </form>                  
                    
                <%}
                    
                %>
            </div>
            <div class="limpiar"></div>
                    <form>
                    
                        <br>
                        <h2 align="center">DETALLE DE VENTA</h2>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td>Numero</td><td>Descripcion</td><td>Precio</td><td>Cantidad</td><td>Monto</td><td>Acciones</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                   if(request.getParameter("activo")!=null){
                                       List<detalleVenta> listaventa = new ayuditas().listarDetalleVenta();
                                         for (int i = 0; i < listaventa.size(); i++) {
                                             List<producto> listaproducto = new ayuditas().listarDetalleVentaProducto(listaventa.get(i).getId_producto());%>
                                             <tr>
                                                 <td><%= i+1 %></td>
                                                 <td><%=listaproducto.get(0).getNombre()%></td>
                                                 <td><%=listaproducto.get(0).getPreciov()%></td>
                                                 <td><%=listaventa.get(i).getCantidad()%></td>
                                                 <td><%out.print(listaventa.get(i).getCantidad()*listaproducto.get(0).getPreciov());%></td>
                                                 <% total += (listaventa.get(i).getCantidad()*listaproducto.get(0).getPreciov()); %>  
                                                 <td> <a href="servletDetalleventa?dni=<%=request.getParameter("dni")%>&accion=eliminarp&codigop=<%=listaventa.get(i).getId_producto()%>">Eliminar</a> </td>
                                             </tr>
                                         <%}

                                    }


                                %>
                                <tr></tr><tr></tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>Subtotal</td>
                                    <td><%=total%></td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>IGV</td>
                                    <td><%=total*0.18%></td>
                                </tr>                            
                                <tr>
                                    <td colspan="3"></td>
                                    <td>Total</td>
                                    <td><%=total*1.18%></td>
                                </tr>
                                <input type="hidden" name="total" value="<%=total*1.18%>">
                            </tbody>
                        </table >
                        <p align="center"><input type="submit" name="vender" value="Vender"><input type="submit" name="Cancelar" value="Cancelar" ></p>
                             <%
                                 String lolo = String.valueOf(session.getAttribute("rango"));
                                 if(request.getParameter("vender") != null){ 
                                    out.print(session.getAttribute("rango"));
                                    new ayuditas().Venta(Double.parseDouble(request.getParameter("total")));
                                    new ayuditas().copiarTabla();
                                    if(lolo.equals("0")) {response.sendRedirect("index.jsp?msg=La venta se realizo con Exito");}
                                    else {response.sendRedirect("indext.jsp?msg=La venta se realizo con Exito");}
                                 }
                                 if(request.getParameter("Cancelar") != null){
                                    new ayuditas().copiarTabla2();
                                    if(lolo.equals("0")) {response.sendRedirect("index.jsp?msg=La venta se realizo con Exito");}
                                    else {response.sendRedirect("indext.jsp?msg=La venta se cancelo con Exito");}
                                 }
                             %>
                    </form>        
                
            
     </div>         
    </body>
</html>
