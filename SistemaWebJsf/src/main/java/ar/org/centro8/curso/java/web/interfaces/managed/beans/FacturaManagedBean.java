package ar.org.centro8.curso.java.web.interfaces.managed.beans;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_FacturaRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.FacturaRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Cliente;
import ar.org.centro8.curso.java.aplicaciones.entities.Factura;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("facturaMB")
@SessionScoped
public class FacturaManagedBean implements Serializable{
    private I_FacturaRepository fr = new FacturaRepository(Connector.getConnection());
    private I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
    private Factura factura;
    private Cliente cliente;
    private String buscarFecha="";
    private String mensaje;
    
    
    public FacturaManagedBean(){
        factura = new Factura();
        mensaje="";
    }
    
    public void save(){
        fr.save(factura);
        mensaje = "Se dio de alta la Factura ID: " + factura.getId();
        factura = new Factura();
    }
    
//    public List<Cliente> getIdCliente(){
//        return cliente.getNombre()+", "+cliente.getApellido();
//    }
//    
    public List<Factura> getAll(){
        return fr.getAll();
    }
    
    public List<Factura> getLikeFecha(){
        return fr.getByFecha(buscarFecha);
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public String getBuscarFecha() {
        return buscarFecha;
    }

    public void setBuscarFecha(String buscarFecha) {
        this.buscarFecha = buscarFecha;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
        
}
