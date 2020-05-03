<%@page import="java.time.LocalDateTime"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Factura"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.Letra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de facturas</title>
        <link rel="stylesheet" href="css/site.css" type="text/css">
    </head>
    <body>
        
        <div class="header">
            <span class="title">Alta de Facturas</span>
        </div>
        
        <div class="container">
            
            <%

                try {
                        Letra letra = Letra.valueOf(request.getParameter("letra"));
                        int numero = Integer.parseInt(request.getParameter("numero"));
                        String fecha = request.getParameter("fecha");
                        double monto = Double.parseDouble(request.getParameter("monto"));
                        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

                        I_FacturaRepository fr = new FacturaRepository(Connector.getConnection());
                        Factura factura = new Factura(letra, numero, fecha, monto, idCliente);
                        fr.save(factura);
                        out.println("<h4>Se dio de alta la factura id: "+factura.getId()+"</h4>");

                    } catch (Exception e) {
                        out.println("<h4>Faltan completar datos</h4>");
                        System.out.println("---------------------------------------");
                        System.out.println(LocalDateTime.now());
                        e.printStackTrace();
                        System.out.println("---------------------------------------");
                    }

            %>
               
            <form action="Facturas.jsp">               
                <input type="submit" value="Volver">                
            </form>        
        
        </div>
        
    </body>
</html>
