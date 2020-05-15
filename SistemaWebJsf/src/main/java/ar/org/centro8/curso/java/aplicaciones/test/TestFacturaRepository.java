package ar.org.centro8.curso.java.aplicaciones.test;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Factura;
import ar.org.centro8.curso.java.aplicaciones.enumerados.Letra;
import java.sql.Connection;
public class TestFacturaRepository {
    public static void main(String[] args) {
        try (Connection conn = Connector.getConnection()){
            
            I_FacturaRepository fr = new FacturaRepository(conn);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            fr.remove(fr.getByLetraNumero(Letra.A, 1));
            System.out.println("Factura eliminada !!!");
                        
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            Factura factura = new Factura(Letra.A, 1, "05/05/2018", 1400, 2);
            fr.save(factura);
            System.out.println(factura + "\nAgregada a la base");
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            factura = fr.getByLetraNumero(Letra.A, 1);
            System.out.println("factura = " + factura);
            factura.setFecha("06/07/2019");
            factura.setMonto(2556.30);
            fr.update(factura);
            System.out.println("factura = " + factura);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            fr.getAll().forEach(System.out::println);
            
            
        } catch (Exception e) { e.printStackTrace(); }
    }
}
