<%@page import="ar.org.centro8.curso.java.interfaces.utils.TableHTML"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Factura"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.Letra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/site.css" type="text/css" >
        <link rel="stylesheet" href="css/facturas.css" type="text/css" >
        <title>Facturas</title>
    </head>
    <body>
        <div class="header">          
            <span class="title">Facturas</span>
            <div class="navs">  
                <a href="Clientes.jsp">Clientes</a>
                <a href="Articulos.jsp">Articulos</a>
            </div>
        </div>        
        <div class="container">

            <form action="FacturasAlta.jsp" method="GET">
                <h4>Registro de Factura</h4>
                <div class="form-row">
                    <div class="w-30">
                        <label>Letra:</label> 
                        <select name="letra">
                            <%
                                for (Letra l : Letra.values()) {
                                    out.println("<option value=" + l + ">" + l + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="w-70">
                        <label>Numero:</label> 
                        <input type="text" name="numero"/>
                    </div>
                </div>

                <div>
                    <label>ID Cliente:</label> 
                    <input type="text" name="idCliente" style="width: 82%;"/>
                </div>
                <div class="form-row">
                    <div class="w-50">
                        <label>Fecha:</label> 
                        <input type="text" name="fecha"/>
                    </div>
                    <div class="w-50">
                        <label>Monto:</label> 
                        <input type="text" name="monto"/>
                    </div>
                </div>

                <div class="form-footer">
                    <input type="reset" value="Borrar"/>
                    <input type="submit" value="Agregar"/>
                </div>
            </form>

            
            <div class="table-section">
                <strong>Facturas Registradas</strong>
                <form>
                    Buscar Fecha
                    <input type="text" name="buscarFecha"/>
                </form>
            </div>

            <%                    
                String buscar="";
                
                try {                    
                    buscar = request.getParameter("buscarFecha");                    
                } catch (Exception e) {                    
                }
                try {
                    
                    I_FacturaRepository fr = new FacturaRepository(Connector.getConnection());
                    List<Factura> lista = new ArrayList();
                    if(buscar == null || buscar=="") lista = fr.getAll();
                    else lista = fr.getByFecha(buscar);
                    out.println(new TableHTML<Factura>().getTable(lista));
                    
                } catch (Exception e) {
                    System.out.println("---------------------------------------");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("---------------------------------------");
                }
            %>

        </div>
    </body>
</html>
