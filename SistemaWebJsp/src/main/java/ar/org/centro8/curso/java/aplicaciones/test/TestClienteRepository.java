package ar.org.centro8.curso.java.aplicaciones.test;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Cliente;
import ar.org.centro8.curso.java.aplicaciones.enumerados.TipoDocumento;
import java.sql.Connection;
public class TestClienteRepository {
    public static void main(String[] args) {
                
        try (Connection conn = Connector.getConnection()){
            
            I_ClienteRepository cr = new ClienteRepository(conn);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
           cr.remove(cr.getByTipoNumero(TipoDocumento.DNI, 95959595));
//            System.out.println("Cliente con DNI: 16777888, eliminado !!!");
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            Cliente cliente = new Cliente("Sharbel", "Fahafi", TipoDocumento.DNI, 95723542, "flores", "Spring Boot Test");
            cr.save(cliente);
            System.out.println(cliente + "\nAgregado a la base");
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
//            cliente = (Cliente) cr.getLikeApellido("FAhafi");
//            System.out.println("cliente = " + cliente);
//            //cliente.setNombre("Pedro");
//            cliente.setApellido("Fahafi");
//            cr.update(cliente);
//            System.out.println("cliente = " + cliente);            
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
                       
            cr.getAll().forEach(System.out::println);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            //cr.getLikeApellido("sot").forEach(System.out::println);
            
            System.out.println("\n" + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + "\n");
            
            //cr.getLikeNombreApellido("lu", "gu").forEach(System.out::println);
            
        } catch (Exception e) { e.printStackTrace(); }
                
    }
}
