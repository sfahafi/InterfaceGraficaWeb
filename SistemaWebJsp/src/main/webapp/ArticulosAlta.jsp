<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Articulo"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Articulos</title>
        <link rel="stylesheet" href="css/site.css" type="text/css">
    </head>
    <body>
        
        <div class="header">
            <span class="title">Alta de Articulos</span>
        </div>
        
        <div class="container">
        
            <%
                try{
                    String descripcion = request.getParameter("descripcion");
                    float costo = Float.parseFloat(request.getParameter("costo"));
                    float precio = Float.parseFloat(request.getParameter("precio"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    int stockMin = Integer.parseInt(request.getParameter("stockMin"));
                    int stockMax = Integer.parseInt(request.getParameter("stockMax"));

                    I_ArticuloRepository ar = new ArticuloRepository(Connector.getConnection());
                    Articulo articulo = new Articulo(descripcion, costo, precio, stock, stockMin, stockMax);
                    ar.save(articulo);
                    out.println("<h4>Se dio de alta el articulo id: "+articulo.getId()+"</h4>");

                } catch (Exception e) {
                    out.println("<h4>Faltan completar datos</h4>");
                    System.out.println("---------------------------------------");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("---------------------------------------");
                }
            %>

            <form action="Articulos.jsp">
                <input type="submit" value="Volver">
            </form>
            
        </div>
            
    </body>
</html>
