use negocioWeb;
use S36WIHK7x4;
select * from cliente;
select * from factura;
select * from articulo;
select * from detalle;

describe cliente;
describe factura;
describe articulo;
describe detalle;

delete from factura where id = 1;

delete from articulos where descripcion = 'Juguetes';

-- update 	empleados
-- set		seccion = 'administracion'
-- where	nombre = 'mario' and apellido = 'lopez';

-- update	empleados
-- set		sueldo = sueldo * 1.08
-- where	sueldo < 5000;

insert into detalle(idFactura,idArticulo,precio,cantidad) values 
    (2,1,3578,50),
    (3,2,4353,5546),
    (4,5,5464,453);
