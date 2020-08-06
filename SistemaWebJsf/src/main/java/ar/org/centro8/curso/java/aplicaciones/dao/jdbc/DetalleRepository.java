package ar.org.centro8.curso.java.aplicaciones.dao.jdbc;
import ar.org.centro8.curso.java.aplicaciones.dao.interfaces.I_DetalleRepository;
import ar.org.centro8.curso.java.aplicaciones.entities.Detalle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class DetalleRepository implements I_DetalleRepository{
    private Connection conn;
    public DetalleRepository(Connection conn) { this.conn = conn; }
    
    @Override
    public void save(Detalle detalle) {
        if(detalle == null) return;
        try (PreparedStatement ps = conn.prepareStatement(
                "insert into detalles (idFactura,idArticulo,precio,cantidad)"
                        + "values (?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS)
            ){
            
            ps.setInt(1, detalle.getIdFactura());
            ps.setInt(2, detalle.getIdArticulo());
            ps.setFloat(3, detalle.getPrecio());
            ps.setInt(4, detalle.getCantidad());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            //if (rs.next()) detalle.set            
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void remove(Detalle detalle) {
        if(detalle == null) return;
        try (PreparedStatement ps = conn.prepareStatement(
                "delete from detalles where id=?")
            ){
            
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void update(Detalle detalle) {
        if(detalle == null) return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update detalles set  where id=?")
            ){
            
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public List<Detalle> getAll() {
        List<Detalle> list = new ArrayList();
        try (ResultSet rs = conn.createStatement().executeQuery(
                "select * from detalles")
            ){
            
            while (rs.next()){
                list.add(new Detalle(
                        
                ));
            }            
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
}
