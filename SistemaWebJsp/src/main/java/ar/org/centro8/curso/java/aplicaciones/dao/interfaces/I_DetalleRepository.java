package ar.org.centro8.curso.java.aplicaciones.dao.interfaces;
import ar.org.centro8.curso.java.aplicaciones.entities.Detalle;
import java.util.List;
public interface I_DetalleRepository {
    void save(Detalle detalle);
    void remove(Detalle detalle);
    void update(Detalle detalle);
    List<Detalle>getAll();
    
    
    /*
   
List<Detalle> getByPrecio(float precio);

Detalle getByFacturaArticulo(int idFactura,int idArticulo)

    */
    
    
    default Detalle getByIdFactura(int id){
        return getAll()
                .stream()
                .filter(d -> d.getIdFactura() == id)
                .findFirst()
                .orElse(new Detalle());
    }
    
    default Detalle getByIdArticulo(int id){
        return getAll()
                .stream()
                .filter(d -> d.getIdArticulo() == id)
                .findFirst()
                .orElse(new Detalle());
    }
    
    default Detalle getByPrecio(float precio){
        return getAll()
                .stream()
                .filter(d -> d.getPrecio() == precio)
                .findFirst()
                .orElse(new Detalle());
    }
    
    default Detalle getByCantidad(int cantidad){
        return getAll()
                .stream()
                .filter(d -> d.getCantidad() == cantidad)
                .findFirst()
                .orElse(new Detalle());
    }
    
}
