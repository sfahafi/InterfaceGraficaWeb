package ar.org.centro8.curso.java.web.interfaces.managed.beans;
import ar.org.centro8.curso.java.aplicaciones.connectors.Connector;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_ArticuloRepository;
import ar.org.centro8.curso.java.aplicaciones.dao.jdbc.ArticuloRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Articulo;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;

@Named("articuloMB")
@SessionScoped
public class ArticuloManagedBean implements Serializable{
    private I_ArticuloRepository ar = new ArticuloRepository(Connector.getConnection());
    private Articulo articulo;
    private String buscarDescripcion="";
    private String mensaje;

    public ArticuloManagedBean() {
        articulo = new Articulo();
        mensaje = "";
    }
    
    public void save(){
        ar.save(articulo);
        mensaje = "Se dio de alta el Articulo ID: " + articulo.getId();
        articulo = new Articulo();
        
        FacesContext context = FacesContext.getCurrentInstance();         
        context.addMessage(null, new FacesMessage("Satisfactorio:", mensaje));
    }
    
    public List<Articulo> getAll(){
        return ar.getAll();
    }
    
    public List<Articulo> getLikeDescripcion(){
        return ar.getLikeDescripcion(buscarDescripcion);
    }

    public Articulo getArticulo() {
        return articulo;
    }

    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    public String getBuscarDescripcion() {
        return buscarDescripcion;
    }

    public void setBuscarDescripcion(String buscarDescripcion) {
        this.buscarDescripcion = buscarDescripcion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    
    
    
    
    
}
