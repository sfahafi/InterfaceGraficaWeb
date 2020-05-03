<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.TipoDocumento"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de clientes</title>
        <link rel="stylesheet" href="css/site.css" type="text/css">
    </head>
    <body>
        
        <div class="header">
            <span class="title">Alta de Clientes</span>
        </div>
        
        <div class="container">

            <%
                try{
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    TipoDocumento tipoDocumento = TipoDocumento.valueOf(request.getParameter("tipoDocumento"));
                    int numeroDocumento = Integer.parseInt(request.getParameter("nroDocumento"));
                    String direccion = request.getParameter("direccion");
                    String comentarios = request.getParameter("comentarios");

                    I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
                    Cliente cliente = new Cliente(nombre, apellido, tipoDocumento, numeroDocumento, direccion, comentarios);
                    cr.save(cliente);
                    out.println("<h4>Se dio de alta el cliente id: "+cliente.getId()+"</h4>");

                } catch (Exception e) {
                    out.println("<h4>Faltan completar datos</h4>");
                    System.out.println("---------------------------------------");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("---------------------------------------");
                }
            %>

            <form action="Clientes.jsp">
                <input type="submit" value="Volver">
            </form>
        
        </div>
            
    </body>
</html>
