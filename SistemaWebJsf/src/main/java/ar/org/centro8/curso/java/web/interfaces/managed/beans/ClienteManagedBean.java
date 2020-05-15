package ar.org.centro8.curso.java.web.interfaces.managed.beans;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Cliente;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("clienteMB")
@SessionScoped
public class ClienteManagedBean implements Serializable{
    private Cliente cliente;
    private I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
    private String buscarApellido="";
    private String mensaje;

    public ClienteManagedBean() {
        mensaje="";
        cliente = new Cliente();
    }
       
    
    public void save(){
        cr.save(cliente);
        mensaje = "Se agrego el cliente id: " + cliente.getId();
        cliente = new Cliente();
    }
    
    public List<Cliente> getAll(){
        return cr.getAll();
    }
    
    public List<Cliente> getLikeApellido(){
        return cr.getLikeApellido(buscarApellido);
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getBuscarApellido() {
        return buscarApellido;
    }

    public void setBuscarApellido(String buscarApellido) {
        this.buscarApellido = buscarApellido;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    
    
    
}