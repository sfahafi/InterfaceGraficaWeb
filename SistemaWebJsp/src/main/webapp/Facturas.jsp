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

            <form>
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

            <%
                try (PreparedStatement ps = Connector.getConnection().prepareStatement(
                        "insert into facturas (letra,numero,fecha,monto,idCliente) values (?,?,?,?,?)",
                        PreparedStatement.RETURN_GENERATED_KEYS);) {

                    String letra = request.getParameter("letra");
                    String numero = request.getParameter("numero");
                    String fecha = request.getParameter("fecha");
                    String monto = request.getParameter("monto");
                    String idCliente = request.getParameter("idCliente");

                    ps.setString(1, letra);
                    ps.setString(2, numero);
                    ps.setString(3, fecha);
                    ps.setString(4, monto);
                    ps.setString(5, idCliente);
                    ps.execute();

                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        out.println("<div class='center-text text-ok'><h4>Se dio de alta la factura: " + rs.getInt(1) + "</h4></div>");
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
                <strong>Facturas Registradas</strong>
                <form>
                    Buscar Fecha
                    <input type="text" name="buscarFecha"/>
                </form>
            </div>

            <%                    String buscar;
                String query = "select * from facturas";
                try {
                    buscar = request.getParameter("buscarFecha");
                    if (buscar != null && !buscar.isEmpty()) {
                        query = "select * from facturas where fecha like '%" + buscar + "%'";
                    }
                } catch (Exception e) {
                }
                try (ResultSet rs = Connector.getConnection().createStatement().executeQuery(query)) {
                    out.println("<div class='table-section'><table>");
                    out.println("<thead><tr>"
                            + "<th>ID</th>"
                            + "<th>Letra</th>"
                            + "<th>Numero</th>"
                            + "<th>ID Cliente</th>"
                            + "<th>Fecha</th>"
                            + "<th>Monto</th>"
                            + "</tr></thead>");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("letra") + "</td>");
                        out.println("<td>" + rs.getInt("numero") + "</td>");
                        out.println("<td>" + rs.getInt("idCliente") + "</td>");
                        out.println("<td>" + rs.getString("fecha") + "</td>");
                        out.println("<td class='text-right'>" + rs.getDouble("monto") + "</td>");
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
