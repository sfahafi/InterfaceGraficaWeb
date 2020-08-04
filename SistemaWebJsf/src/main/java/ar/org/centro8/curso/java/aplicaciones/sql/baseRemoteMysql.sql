use S36WIHK7x4;

drop table if exists detalles;
drop table if exists facturas;
drop table if exists articulos;
drop table if exists clientes;


create table cliente(
    id int auto_increment primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    tipoDocumento enum('DNI','LC','LE','PASS'),
    numeroDocumento char(8),
    direccion varchar(50),
    comentarios varchar(250)
);

alter table cliente
    add constraint I_Cliente_Tipo_DNI
    unique(tipoDocumento,numeroDocumento); -- evita que se coloquen dos nemuros repetidos

create table articulo(
    id int auto_increment primary key,
    descripcion varchar(50) not null,
    costo float,
    precio float,
    stock int,
    stockMin int,
    stockMax int
);

create table factura(
    id int auto_increment primary key,
    letra enum('A','B','C') not null,
    numero int not null,
    fecha char(10),
    monto double,
    idCliente int not null
);

alter table factura
    add constraint I_Factura_Letra_Numero
    unique(letra,numero);

alter table factura
    add constraint FK_Factura_Clientes_id
    foreign key(idCliente)
    references clientes(id);

create table detalle(
    idFactura int not null,
    idArticulo int not null,
    precio float not null,
    cantidad int not null,
    primary key(idFactura,idArticulo)
);

alter table detalle
    add constraint FK_Detalle_IdFactura
    foreign key(idFactura)
    references facturas(id);

alter table detalle
    add constraint FK_Detalle_IdArticulo
    foreign key(idArticulo)
    references articulos(id);
