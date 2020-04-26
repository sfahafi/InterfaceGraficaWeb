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

            <form class="form">

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

            <%

                try (PreparedStatement ps = Connector.getConnection().prepareStatement(
                        "insert into articulos (descripcion,costo,precio,stock,stockMin,stockMax) "
                        + "values (?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);) {

                    String descripcion = request.getParameter("descripcion");
                    String costo = request.getParameter("costo");
                    String precio = request.getParameter("precio");
                    String stock = request.getParameter("stock");
                    String stockMin = request.getParameter("stockMin");
                    String stockMax = request.getParameter("stockMax");

                    ps.setString(1, descripcion);
                    ps.setString(2, costo);
                    ps.setString(3, precio);
                    ps.setString(4, stock);
                    ps.setString(5, stockMin);
                    ps.setString(6, stockMax);
                    ps.execute();

                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        out.println("<div class='center-text text-ok'><h4>Se dio de alta el artículo: " + rs.getInt(1) + "</h4></div>");
                    }

                } catch (Exception e) {
                    out.println("<div class='center-text text-error'><h4>Faltan completar datos</h4></div>");
                    System.out.println("---------------------------------------");
                    System.out.println(LocalDateTime.now());
                    e.printStackTrace();
                    System.out.println("---------------------------------------");
                }

            %>



            <div class="table-section">
                <strong>Clientess Registrados</strong>
                <form>
                    Buscar Descripción
                    <input type="text" name="buscarDescripcion"/>
                </form>
            </div>


            <%                String buscar;
                String query = "select * from articulos";
                try {
                    buscar = request.getParameter("buscarDescripcion");
                    if (buscar != null && !buscar.isEmpty()) {
                        query = "select * from articulos where descripcion like '%" + buscar + "%'";
                    }
                } catch (Exception e) {
                }
                try (ResultSet rs = Connector.getConnection().createStatement().executeQuery(query)) {
                    out.println("<div class='table-section'><table>");
                    out.println("<thead><tr>"
                            + "<th>ID</th>"
                            + "<th>Descripción</th>"
                            + "<th>Costo</th>"
                            + "<th>Precio</th>"
                            + "<th>Stock</th>"
                            + "<th>Stock Mínimo</th>"
                            + "<th>Stock Máximo</th>"
                            + "</tr></thead>");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("descripcion") + "</td>");
                        out.println("<td class='text-right'>" + rs.getFloat("costo") + "</td>");
                        out.println("<td class='text-right'>" + rs.getFloat("precio") + "</td>");
                        out.println("<td>" + rs.getInt("stock") + "</td>");
                        out.println("<td>" + rs.getInt("stockMin") + "</td>");
                        out.println("<td>" + rs.getInt("stockMax") + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</table></div>");
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
