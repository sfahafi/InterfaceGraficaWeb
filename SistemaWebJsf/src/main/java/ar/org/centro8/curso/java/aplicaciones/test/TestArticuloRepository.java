package ar.org.centro8.curso.java.aplicaciones.test;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Articulo;
import java.sql.Connection;
public class TestArticuloRepository {
    public static void main(String[] args) {
        
        try (Connection conn = Connector.getConnection()){
            
            I_ArticuloRepository ar = new ArticuloRepository(conn);
            
            Articulo articulo = new Articulo("Zapatos", 1200, 1500, 100, 5, 200);
            Articulo articulo2 = new Articulo("Remeras", 600, 800, 150, 10, 300);
            Articulo articulo3 = new Articulo("Pantalones", 1000, 1200, 80, 15, 400);
            ar.save(articulo);
            ar.save(articulo2);
            ar.save(articulo3);
            System.out.println("Articulos agregados a la base");
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            ar.getAll().forEach(System.out::println);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            //ar.remove(ar.getLikeDescripcion("p")); // Tengo problema con esta linea
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
           
            
        } catch (Exception e) { e.printStackTrace(); }
    }
}
