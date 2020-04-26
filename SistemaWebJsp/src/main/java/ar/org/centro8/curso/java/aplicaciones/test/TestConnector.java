package ar.org.centro8.curso.java.aplicaciones.test;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
public class TestConnector {
    public static void main(String[] args) throws Exception {
        //System.out.println("1");
        Connector
                .getConnection()
                .createStatement()
                .execute(
                        "delete from clientes where numeroDocumento='12345678'");
        //System.out.println("2");
        Connector
                .getConnection()
                .createStatement()
                .execute(
                        "delete from clientes where numeroDocumento='25555888'");
        //System.out.println("3");
        Connector
                .getConnection()
                .createStatement()
                .execute(
                        "insert into clientes"
                                + "(nombre,apellido,tipoDocumento,numeroDocumento,direccion)"
                                + "values"
                                + "('ana','soto','DNI','12345678','Medrano 162'),"
                                + "('Lucas','Guerra','DNI','25555888','Lavalle 1200')"
                );
        //System.out.println("4");
    }
}
