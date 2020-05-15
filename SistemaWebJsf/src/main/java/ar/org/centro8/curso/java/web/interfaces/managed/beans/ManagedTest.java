package ar.org.centro8.curso.java.web.interfaces.managed.beans;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("test")
@SessionScoped
public class ManagedTest implements Serializable{
    private String texto="Hola";
    
    public String getText(){
        return texto;
    }
}
