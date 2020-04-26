<%-- 
    Document   : Test
    Created on : 13 abr. 2020, 13:07:29
    Author     : toro
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>         
    </head>
    <body>
        <h1>Hello World!</h1>
        <!-- comentarios -->
        <% 
            // codigo Java o JSP
            out.println("<h1>Hola Mundo JSP</h1>");
            List<String>lista=new ArrayList();
            lista.add("Lunes");
            lista.add("Martes");
            lista.add("Miercoles");
            lista.add("Jueves");
            lista.add("Viernes");
            lista.forEach(System.out::println);
            /*lista.forEach(item->{
                try {
                        out.println(item);
                    } catch (Exception e) { e.printStackTrace(); }
            });*/
            
        %>
        
    </body>
</html>
