package ar.org.centro8.curso.java.web.interfaces.managed.beans;
import ar.org.centro8.curso.java.aplicaciones.enumerados.TipoDocumento;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("tipoDocMB")
@SessionScoped
public class TipoDocumentoManagedBean implements Serializable{
    public List<TipoDocumento>getTipoDocumento(){
        return Arrays.asList(TipoDocumento.values());
    }
}
