create table CLIENTE
(
    cedulaCliente int not null,
    nombre varchar(60) not null,
    direccion varchar(50) not null,
    cuidad varchar(50) not null,
    telefono varchar(15) not null,
    CONSTRAINT PK_CLIENTE PRIMARY KEY(cedulaCliente)
    
);

create table PRODUCTO
(
    codigoProducto varchar(20) not null,
    descripcion varchar(50) not null,
    categoria varchar(20) not null,
    precio int not null,
    CONSTRAINT PK_PRODUCTO PRIMARY KEY(codigoProducto)
);

create table FACTURA 
(
    numFactura int not null,
    fecha date not null,
    cedulaCliente int not null,
    
    CONSTRAINT PK_FACTURA PRIMARY KEY(numFactura),
    CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY(cedulaCliente) REFERENCES CLIENTE(cedulaCliente)
);

create table DETALLE 
(
    valorUnitario int not null,
    cantidad int not null,
    numFactura int not null,
    codigoProducto varchar(20) not null,
    
    CONSTRAINT FK_DETALLE_FACTURA FOREIGN KEY(numFactura)REFERENCES FACTURA(numFactura),
    CONSTRAINT FK_DETALLE_PRODUCTON FOREIGN KEY (codigoProducto) REFERENCES PRODUCTO(codigoProducto)
);

INSERT INTO CLIENTE VALUES (80005000,'Jose Perez Prito', 'CRA 7 NO.50-50', 'Santafe Bogota, DC','35555555');

INSERT INTO FACTURA VALUES (5656801, TO_DATE('2014/10/23','YYYY/MM/DD'), 80005000);

INSERT INTO PRODUCTO VALUES ('51238', 'Dim PC133 256 MB', 'Memorias', 115000);
INSERT INTO PRODUCTO VALUES ('68998', 'Samsung Viamaster 550', 'Monitores', 380000);
INSERT INTO PRODUCTO VALUES ('589898', 'MSI KM266 ATA 133', 'Motherboards', 220000);
INSERT INTO PRODUCTO VALUES ('198988', 'CDROM LG 52X', 'Unidades', 56000);
INSERT INTO PRODUCTO VALUES ('198989', 'Quemador LG 52x32x52', 'Unidades', 195000);
INSERT INTO PRODUCTO VALUES ('689986', 'Teclado Genius PS2', 'Perifericos', 11000);
INSERT INTO PRODUCTO VALUES ('689865', 'Mouse Genius Netscroll+', 'Perifericos', 13000);

INSERT INTO DETALLE VALUES (115000, 2, 5656801, '51238');
INSERT INTO DETALLE VALUES (380000, 1, 5656801, '68998');
INSERT INTO DETALLE VALUES (220000, 1, 5656801, '589898');
INSERT INTO DETALLE VALUES (56000, 1, 5656801, '198988');
INSERT INTO DETALLE VALUES (195000, 1, 5656801, '198989');
INSERT INTO DETALLE VALUES (11000, 1, 5656801, '689986');
INSERT INTO DETALLE VALUES (13000, 2, 5656801, '689865');

/*CRUD Cliente*/

CREATE OR REPLACE PROCEDURE spClienteInsertar
(
    pCedula IN INT,
    pNombre IN VARCHAR,
    pDireccion IN VARCHAR,
    pCiudad IN VARCHAR,
    pTelefono IN VARCHAR
) AS
BEGIN
    INSERT INTO CLIENTE (cedulaCliente, nombre, direccion, cuidad, telefono)
    VALUES (pCedula, pNombre, pDireccion, pCiudad, pTelefono);
END;

BEGIN
    spClienteInsertar(1010, 'Carlos Morales', 'Calle Central', 'San Jose', '8888-1234');
END;

CREATE OR REPLACE PROCEDURE spClienteListar (
    pListarClientes OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN pListarClientes FOR
        SELECT cedulaCliente, nombre, direccion, cuidad, telefono FROM CLIENTE;
END;
 
SET SERVEROUTPUT ON;

DECLARE
    vCursor SYS_REFCURSOR;
    vCedula CLIENTE.cedulaCliente%TYPE;
    vNombre CLIENTE.nombre%TYPE;
    vDireccion CLIENTE.direccion%TYPE;
    vCiudad CLIENTE.cuidad%TYPE;
    vTelefono CLIENTE.telefono%TYPE;
BEGIN
    spClienteListar(vCursor);

    LOOP
        FETCH vCursor INTO vCedula, vNombre, vDireccion, vCiudad, vTelefono;
        EXIT WHEN vCursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Cédula: ' || vCedula || ' | Nombre: ' || vNombre || ' | Dirección: ' || vDireccion || ' | Ciudad: ' || vCiudad || ' | Teléfono: ' || vTelefono);
    END LOOP;

    CLOSE vCursor;
END;

CREATE OR REPLACE PROCEDURE spClienteActualizar
(
    pCedula IN INT,
    pNombre IN VARCHAR,
    pDireccion IN VARCHAR,
    pCiudad IN VARCHAR,
    pTelefono IN VARCHAR
) AS
BEGIN
    UPDATE CLIENTE
    SET nombre = pNombre,
        direccion = pDireccion,
        cuidad = pCiudad,
        telefono = pTelefono
    WHERE cedulaCliente = pCedula;
END;

BEGIN
    spClienteActualizar(1010, 'Carlos M.', 'Avenida 5', 'Herediaaaaa', '8999-4567');
END;

CREATE OR REPLACE PROCEDURE spClienteEliminar
(
    pCedula IN INT
) AS
BEGIN
    DELETE FROM CLIENTE WHERE cedulaCliente = pCedula;
END;
BEGIN
    spClienteEliminar(1010);
END;
/*logica sola*/
select c.cedulaCliente, c.nombre,c.direccion,c.cuidad,c.telefono,f.numFactura,f.fecha,d.valorUnitario,d.cantidad,p.codigoProducto,p.descripcion,p.categoria,p.precio
    from CLIENTE c inner join FACTURA f on c.cedulacliente=f.cedulacliente
    inner join DETALLE d on f.numfactura=d.numfactura
    inner join PRODUCTO p on d.codigoProducto= p.codigoproducto
    where f.fecha= TO_DATE('2014/10/23','YYYY/MM/DD');

create or Replace view vwFacturaCompleta
AS
select c.cedulaCliente, c.nombre,c.direccion,c.cuidad,c.telefono,f.numFactura,f.fecha,d.valorUnitario,d.cantidad,p.codigoProducto,p.descripcion,p.categoria,p.precio
    from CLIENTE c inner join FACTURA f on c.cedulacliente=f.cedulacliente
    inner join DETALLE d on f.numfactura=d.numfactura
    inner join PRODUCTO p on d.codigoProducto= p.codigoproducto
    ;

select * from vwFacturaCompleta
WHERE fecha = TO_DATE('2014/10/23','YYYY/MM/DD'); 



create or Replace FUNCTION fnDetalleTotal
(
    dValorUnitario IN int,
    dCantidad IN int 
)
RETURN int
is
 total int;
BEGIN
   total:= dvalorunitario*dcantidad;
   RETURN total;

    
END;

select fndetalletotal(valorUnitario,cantidad) from Detalle;















