<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enumerados.TipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="css/site.css" type="text/css" >
        <link rel="stylesheet" href="css/clientes.css" type="text/css" >

    </head>
    <body>
        <div class="header">          
            <span class="title">Clientes</span>
            <div class="navs">  
                <a href="Facturas.jsp">Facturas</a>
                <a href="Articulos.jsp">Articulos</a>
            </div>
        </div>
        <div class="container">

            <form>
                <h4>Registro de Clientes</h4>
                <div class="form-row">
                    <div class="w-50">
                        <label>Nombre:</label> 
                        <input type="text" name="nombre"/>
                    </div>
                    <div class="w-50">
                        <label>Apellido:</label> 
                        <input type="text" name="apellido"/>
                    </div>
                </div>
                <div>
                    <div class="w-40">
                        <label>Tipo Documento:</label> 
                        <select name="tipoDocumento">
                            <%
                                for (TipoDocumento t : TipoDocumento.values()) {
                                    out.println("<option value=" + t + ">" + t + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="w-60">
                        <label>Numero:</label> 
                        <input type="text" name="nroDocumento"/>
                    </div>
                </div>
                <div class="form-row">
                    <label>Dirección:</label> 
                    <input type="text" name="direccion"/>
                </div>
                <div>
                    <label>Comentarios:</label> 
                    <textarea name="comentarios" rows="6"></textarea>
                </div>

                <div class="form-footer">
                    <input type="reset" value="Borrar"/>
                    <input type="submit" value="Agregar"/>
                </div>
            </form>



            <%
                try (PreparedStatement ps = Connector.getConnection().prepareStatement(
                        "insert into clientes (nombre,apellido,tipoDocumento,numeroDocumento,direccion,comentarios) "
                        + "values (?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);) {
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String tipoDocumento = request.getParameter("tipoDocumento");
                    String numeroDocumento = request.getParameter("nroDocumento");
                    String direccion = request.getParameter("direccion");
                    String comentarios = request.getParameter("comentarios");

                    ps.setString(1, nombre);
                    ps.setString(2, apellido);
                    ps.setString(3, tipoDocumento);
                    ps.setString(4, numeroDocumento);
                    ps.setString(5, direccion);
                    ps.setString(6, comentarios);
                    ps.execute();

                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        out.println("<div class='center-text text-ok'><h4>Se dio de alta la cliente: " + rs.getInt(1) + "</h4></div>");
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
                    Buscar Apellido
                    <input type="text" name="buscarApellido"/>
                </form>
            </div>

            <%
                String buscar;
                String query="select * from clientes";
                try {
                        buscar=request.getParameter("buscarApellido");
                        if(buscar!=null && !buscar.isEmpty())
                        query="select * from clientes where apellido like '%"+buscar+"%'";
                    } catch (Exception e) {
                    }
                try (ResultSet rs = Connector.getConnection().createStatement().executeQuery(query)){
                        out.println("<div class='table-section'><table>");
                        out.println("<thead><tr>"
                                + "<th>ID</th>"
                                + "<th>Nombre</th>"
                                + "<th>Apellido</th>"
                                + "<th>Tipo Documento</th>"
                                + "<th>Numero Documento</th>"
                                + "<th>Direccion</th>"
                                + "<th>Comentarios</th>"
                                + "</tr></thead>"); 
                    
                        while(rs.next()){
                            out.println("<tr>");
                            out.println("<td>"+rs.getInt("id")+"</td>");                        
                            out.println("<td>"+rs.getString("nombre")+"</td>");                        
                            out.println("<td>"+rs.getString("apellido")+"</td>");                        
                            out.println("<td>"+rs.getString("tipoDocumento")+"</td>");                        
                            out.println("<td>"+rs.getString("numeroDocumento")+"</td>");                        
                            out.println("<td>"+rs.getString("direccion")+"</td>");                        
                            out.println("<td>"+rs.getString("comentarios")+"</td>");                        
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
