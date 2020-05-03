package ar.org.centro8.curso.java.interfaces.utils;
import java.lang.reflect.Field;
import java.util.List;
public class TableHTML <E> {
    public String getTable(List<E> list){
        if(list==null || list.isEmpty()) return "<table></table>";
        String tableHtml = "<div class='table-section'><table>";        
        
        tableHtml +="<thead><tr>";        
        E e = list.get(0);
        Field[] campos = e.getClass().getDeclaredFields();
        for(Field f: campos){
            tableHtml +="<th>";
            tableHtml += f.getName();
            tableHtml +="</th>";
        }
        tableHtml +="</tr></thead>";
        
        for(E ee:list){
            tableHtml +="<tr>";
            for(Field f: campos){
                tableHtml +="<td>";
                String method="get"
                        + f.getName().substring(0,1).toUpperCase()
                        + f.getName().substring(1);
                try {
                   tableHtml += e.getClass().getDeclaredMethod(method, null).invoke(ee, null);
                } catch (Exception ex) { ex.printStackTrace(); }
                tableHtml +="</td>";
            }
            tableHtml +="</tr>";
        }         
        
        tableHtml +="</table></div>";
        
        return tableHtml;
    }
}
