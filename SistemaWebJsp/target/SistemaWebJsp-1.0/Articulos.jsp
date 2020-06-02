<%@page import="ar.org.centro8.curso.java.interfaces.utils.TableHTML"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articulos</title>
        <link rel="stylesheet" href="css/site.css" type="text/css" >
        <link rel="stylesheet" href="css/articulos.css" type="text/css" >        
    </head>
    <body>
        <div class="header">          
            <span class="title">Articulos</span>
            <div class="navs">  
                <a href="Clientes.jsp">Clientes</a>
                <a href="Facturas.jsp">Facturas</a>                                
            </div>
        </div>
        <div class="container">

            <form action="ArticulosAlta.jsp" method="GET">

                <h4>Descripción de Artículos</h4>

                <div>
                    <label>Descripcion:</label>
                    <input type="text" name="descripcion"/>
                </div>
                <div class="form-row">
                    <div class="w-33">
                        <label>Costo:</label>
                        <input type="text" name="costo"/>
                    </div>
                    <div class="w-33">
                        <label>Precio:</label>
                        <input type="text" name="precio"/>
                    </div>
                    <div class="w-33">
                        <label>Stock:</label>
                        <input type="text" name="stock"/>
                    </div>
                </div>
                <div class="w-50">
                    <label>Stock Mínimo:</label>
                    <input type="text" name="stockMin"/>
                </div>
                <div class="w-50">
                    <label>Stock Máximo:</label>
                    <input type="text" name="stockMax"/>
                </div>
                <div class="form-footer">
                    <input type="reset" value="Borrar"/>
                    <input type="submit" value="Agregar"/>
                </div>                    

            </form>

            <div class="table-section">
                <strong>Clientess Registrados</strong>
                <form>
                    Buscar Descripción
                    <input type="text" name="buscarDescripcion"/>
                </form>
            </div>


            <%                
                
                String buscar="";
                
                try {
                    buscar = request.getParameter("buscarDescripcion");
                } catch (Exception e) {
                }
                try {
                    
                    I_ArticuloRepository ar = new ArticuloRepository(Connector.getConnection());
                    List<Articulo> lista = new ArrayList();
                    if(buscar==null || buscar=="") lista=ar.getAll();
                    else lista=ar.getLikeDescripcion(buscar);
                    out.println(new TableHTML<Articulo>().getTable(lista));
                    
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
