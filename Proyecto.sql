create table MEDICAMENTO
(
    idMedicamento int NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    CONSTRAINT PK_MEDICAMENTO PRIMARY KEY (idMedicamento)
);
create table PROVEEDOR
(
    idProveedor int NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NULL,
    CONSTRAINT PK_PROVEEDOR PRIMARY KEY (idProveedor)
);
CREATE TABLE LOTE
(
    idLote INT NOT NULL,
    fechaIngreso DATE NOT NULL,
    fechaVencimiento DATE NOT NULL,
    cantidadTotal INT NOT NULL,
    cantidadDisponible INT NOT NULL,
    idMedicamento INT NOT NULL,
    idProveedor INT NOT NULL,
    CONSTRAINT PK_LOTE PRIMARY KEY(idLote),
    CONSTRAINT FK_LOTE_MEDICAMENTO
    FOREIGN KEY(IdMedicamento)REFERENCES MEDICAMENTO(idMedicamento),
    CONSTRAINT FK_LOTE_PROVEEDOR 
    FOREIGN KEY(IdProveedor)REFERENCES PROVEEDOR(idProveedor),
    CONSTRAINT CKC_Fechas_LOTE CHECK (fechaVencimiento >= fechaIngreso), 
    CONSTRAINT CKC_CantidadDisponible_LOTE CHECK (cantidadDisponible <= cantidadTotal) 
);
CREATE TABLE USUARIO
(
    idUsuario INT NOT NULL,
    nombreUsuario VARCHAR(30) NOT NULL,
    rol VARCHAR(10) NOT NULL,
    contrasenna VARCHAR(30) NOT NULL,
    email VARCHAR(30) NULL,
    CONSTRAINT PK_USUARIO PRIMARY KEY(idUsuario)
);

CREATE TABLE MOVIMIENTO
(
    idMovimiento INT NOT NULL,
    tipoMovimiento VARCHAR(10) NOT NULL,
    fechaMovimiento DATE NOT NULL,
    cantidad INT NOT NULL,
    observacion VARCHAR(50) NULL,
    idLote INT NOT NULL,
    idUsuario INT NOT NULL,
    CONSTRAINT PK_MOVIMIENTO PRIMARY KEY(idMovimiento),
    CONSTRAINT FK_MOVIMIENTO_LOTE
    FOREIGN KEY (idLote)REFERENCES LOTE(idLote),
    CONSTRAINT fk_MOVIMIENTO_USUARIO
    FOREIGN KEY (idUsuario)REFERENCES USUARIO(idUsuario),
    CONSTRAINT CKC_tipoMovimiento_MOVIMIENTO
    CHECK (tipoMovimiento IN ('Entrada', 'Salida'))
);
SET SERVEROUTPUT ON;
/*10 de medicamento*/
INSERT INTO MEDICAMENTO VALUES (1, 'Paracetamol', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (2, 'Ibuprofeno', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (3, 'Amoxicilina', 'Cápsula');
INSERT INTO MEDICAMENTO VALUES (4, 'Diclofenaco', 'Gel');
INSERT INTO MEDICAMENTO VALUES (5, 'Loratadina', 'Jarabe');
INSERT INTO MEDICAMENTO VALUES (6, 'Omeprazol', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (7, 'Metformina', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (8, 'Atorvastatina', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (9, 'Cetirizina', 'Tableta');
INSERT INTO MEDICAMENTO VALUES (10, 'Aspirina', 'Tableta');

/*10 proveedores*/
INSERT INTO PROVEEDOR VALUES (1, 'Farmacéutica Alfa', 'Calle 123, San José, Costa Rica', 'contacto.alfa@gmail.com');
INSERT INTO PROVEEDOR VALUES (2, 'Distribuidora Beta', 'Av 45, Heredia, Costa Rica', 'ventas.beta@gmail.com');
INSERT INTO PROVEEDOR VALUES (3, 'Salud Gamma', 'Carrera 10, Alajuela, Costa Rica', 'info.gamma@gmail.com');
INSERT INTO PROVEEDOR VALUES (4, 'Proveedora Delta', 'Calle 20, Cartago, Costa Rica', 'ventas.delta@gmail.com');
INSERT INTO PROVEEDOR VALUES (5, 'Medicamentos Epsilon', 'Av 5, Puntarenas, Costa Rica', 'contacto.epsilon@gmail.com');
INSERT INTO PROVEEDOR VALUES (6, 'Insumos Zeta', 'Calle 50, Limón, Costa Rica', 'ventas.zeta@gmail.com');
INSERT INTO PROVEEDOR VALUES (7, 'Proveedor Eta', 'Carrera 2, Guanacaste, Costa Rica', 'info.eta@gmail.com');
INSERT INTO PROVEEDOR VALUES (8, 'Distribuciones Theta', 'Av 33, Pérez Zeledón, Costa Rica', 'contacto.theta@gmail.com');
INSERT INTO PROVEEDOR VALUES (9, 'Farmacéutica Iota', 'Calle 44, San Carlos, Costa Rica', 'ventas.iota@gmail.com');
INSERT INTO PROVEEDOR VALUES (10, 'Comercial Kappa', 'Av 7, Liberia, Costa Rica', 'info.kappa@gmail.com');

/*10 de lote*/
INSERT INTO LOTE VALUES (1, TO_DATE('2025/01/01','YYYY/MM/DD'), TO_DATE('2026/01/01','YYYY/MM/DD'), 1000, 1000, 1, 1);
INSERT INTO LOTE VALUES (2, TO_DATE('2025/02/10','YYYY/MM/DD'), TO_DATE('2026/02/10','YYYY/MM/DD'), 800, 800, 2, 2);
INSERT INTO LOTE VALUES (3, TO_DATE('2025/03/15','YYYY/MM/DD'), TO_DATE('2026/03/15','YYYY/MM/DD'), 500, 500, 3, 3);
INSERT INTO LOTE VALUES (4, TO_DATE('2025/04/20','YYYY/MM/DD'), TO_DATE('2026/04/20','YYYY/MM/DD'), 1200, 1200, 4, 4);
INSERT INTO LOTE VALUES (5, TO_DATE('2025/05/05','YYYY/MM/DD'), TO_DATE('2026/05/05','YYYY/MM/DD'), 600, 600, 5, 5);
INSERT INTO LOTE VALUES (6, TO_DATE('2025/06/10','YYYY/MM/DD'), TO_DATE('2026/06/10','YYYY/MM/DD'), 700, 700, 6, 6);
INSERT INTO LOTE VALUES (7, TO_DATE('2025/07/15','YYYY/MM/DD'), TO_DATE('2026/07/15','YYYY/MM/DD'), 900, 900, 7, 7);
INSERT INTO LOTE VALUES (8, TO_DATE('2025/08/20','YYYY/MM/DD'), TO_DATE('2026/08/20','YYYY/MM/DD'), 400, 400, 8, 8);
INSERT INTO LOTE VALUES (9, TO_DATE('2025/09/25','YYYY/MM/DD'), TO_DATE('2026/09/25','YYYY/MM/DD'), 1000, 1000, 9, 9);
INSERT INTO LOTE VALUES (10, TO_DATE('2025/10/30','YYYY/MM/DD'), TO_DATE('2026/10/30','YYYY/MM/DD'), 1100, 1100, 10, 10)

/* 10 de usuario*/

INSERT INTO USUARIO VALUES (1, 'admin', 'Admin', 'pass1234', 'admin@mail.com');
INSERT INTO USUARIO VALUES (2, 'jgarcia', 'User', 'pass2345', 'jgarcia@mail.com');
INSERT INTO USUARIO VALUES (3, 'mmartinez', 'User', 'pass3456', 'mmartinez@mail.com');
INSERT INTO USUARIO VALUES (4, 'lrodriguez', 'User', 'pass4567', 'lrodriguez@mail.com');
INSERT INTO USUARIO VALUES (5, 'cfernandez', 'User', 'pass5678', 'cfernandez@mail.com');
INSERT INTO USUARIO VALUES (6, 'dsanchez', 'User', 'pass6789', 'dsanchez@mail.com');
INSERT INTO USUARIO VALUES (7, 'pcastillo', 'User', 'pass7890', 'pcastillo@mail.com');
INSERT INTO USUARIO VALUES (8, 'jmora', 'User', 'pass8901', 'jmora@mail.com');
INSERT INTO USUARIO VALUES (9, 'sgomez', 'User', 'pass9012', 'sgomez@mail.com');
INSERT INTO USUARIO VALUES (10, 'jlopez', 'User', 'pass0123', 'jlopez@mail.com');

/*10 de movimiento*/
INSERT INTO MOVIMIENTO VALUES (1, 'Entrada', TO_DATE('2025/01/02','YYYY/MM/DD'), 1000, 'Ingreso inicial', 1, 1);
INSERT INTO MOVIMIENTO VALUES (2, 'Salida', TO_DATE('2025/01/10','YYYY/MM/DD'), 200, 'Venta', 1, 2);
INSERT INTO MOVIMIENTO VALUES (3, 'Entrada', TO_DATE('2025/02/11','YYYY/MM/DD'), 800, 'Ingreso inicial', 2, 1);
INSERT INTO MOVIMIENTO VALUES (4, 'Salida', TO_DATE('2025/02/20','YYYY/MM/DD'), 150, 'Venta', 2, 3);
INSERT INTO MOVIMIENTO VALUES (5, 'Entrada', TO_DATE('2025/03/16','YYYY/MM/DD'), 500, 'Ingreso inicial', 3, 1);
INSERT INTO MOVIMIENTO VALUES (6, 'Salida', TO_DATE('2025/03/25','YYYY/MM/DD'), 100, 'Venta', 3, 4);
INSERT INTO MOVIMIENTO VALUES (7, 'Entrada', TO_DATE('2025/04/21','YYYY/MM/DD'), 1200, 'Ingreso inicial', 4, 1);
INSERT INTO MOVIMIENTO VALUES (8, 'Salida', TO_DATE('2025/05/01','YYYY/MM/DD'), 300, 'Venta', 4, 5);
INSERT INTO MOVIMIENTO VALUES (9, 'Entrada', TO_DATE('2025/05/06','YYYY/MM/DD'), 600, 'Ingreso inicial', 5, 1);
INSERT INTO MOVIMIENTO VALUES (10, 'Salida', TO_DATE('2025/05/15','YYYY/MM/DD'), 200, 'Venta', 5, 6);
SET SERVEROUTPUT ON;
/*CRUD Medicamento ,SELECT,UPDATE,DELETE*/
INSERT INTO MEDICAMENTO VALUES (1, 'Paracetamol', 'Tableta');

SELECT nombre, tipo FROM MEDICAMENTO WHERE idMedicamento=1;

UPDATE MEDICAMENTO SET  nombre='Paracetamol',tipo='Inyeccion' WHERE idMedicamento=1;

DELETE FROM MEDICAMENTO WHERE idMedicamento=1;
/*------------------------------------------------------CRUD Medicamento-----------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spMedicamentoInsertar
(
    pId IN INT,
    pNombre IN VARCHAR,
    pTipo IN VARCHAR
)AS
BEGIN
    INSERT INTO MEDICAMENTO VALUES (pId, pNombre, pTipo);
END;

BEGIN
    spMedicamentoInsertar(12,'AAAa','BBB');
END;
/*---------------------------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spMedicamentoConsultar (
    pId     IN  INT,
    pNombre OUT VARCHAR,
    pTipo   OUT VARCHAR
)
AS
BEGIN
    SELECT nombre, tipo INTO pNombre, pTipo FROM MEDICAMENTO WHERE idMedicamento = pId;

END;

SET SERVEROUTPUT ON;

DECLARE
    vId int:= 11;
    vNombre MEDICAMENTO.nombre%TYPE;
    vTipo   MEDICAMENTO.tipo%TYPE;
BEGIN

    spMedicamentoConsultar(vId, vNombre, vTipo);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || vNombre || ' - Tipo: ' || vTipo);
END;
/*-----*/
CREATE OR REPLACE PROCEDURE spMedicamentoListar (
    pListarMedicamento OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN pListarMedicamento FOR
        SELECT idMedicamento, nombre, tipo FROM MEDICAMENTO;
END;
SET SERVEROUTPUT ON;

DECLARE
    vListarMedicamento SYS_REFCURSOR;
    vId      MEDICAMENTO.idMedicamento%TYPE;
    vNombre  MEDICAMENTO.nombre%TYPE;
    vTipo    MEDICAMENTO.tipo%TYPE;
BEGIN
    spMedicamentoListar(vListarMedicamento);

    LOOP
        FETCH vListarMedicamento INTO vId, vNombre, vTipo;
        EXIT WHEN vListarMedicamento%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || vId || ' | Nombre: ' || vNombre || ' | Tipo: ' || vTipo);
    END LOOP;

    CLOSE vListarMedicamento;
END;
/*------------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spMedicamentoActualizar(

    pId     IN INT,
    pNombre IN VARCHAR,
    pTipo   IN VARCHAR


)
AS
BEGIN
    UPDATE MEDICAMENTO
    SET nombre = pNombre,
        tipo   = pTipo
    WHERE idMedicamento = pId;
END;

BEGIN
    spMedicamentoActualizar(12, 'ACT', 'ACT');
END;
/*--------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spMedicamentoEliminar (
    pId IN INT
)
AS
BEGIN
    DELETE FROM MEDICAMENTO
    WHERE idMedicamento = pId;
END;

BEGIN
    spMedicamentoEliminar(12);
END;
/*------------------------------------------------------CRUD LOTE-------------------------------------------------------------*/


CREATE OR REPLACE PROCEDURE spLoteInsertar (
    pIdLote IN INT,
    pFechaIngreso IN DATE,
    pFechaVencimiento IN DATE,
    pCantidadTotal IN INT,
    pCantidadDisponible IN INT,
    pIdMedicamento IN INT,
    pIdProveedor IN INT
)
AS
BEGIN
    INSERT INTO LOTE 
    VALUES (pIdLote, pFechaIngreso, pFechaVencimiento, pCantidadTotal, pCantidadDisponible, pIdMedicamento, pIdProveedor);
END;


BEGIN
    spLoteInsertar(11, TO_DATE('2025/08/15','YYYY/MM/DD'), TO_DATE('2026/08/15','YYYY/MM/DD'), 500000, 500000, 1, 1);
END;

/*------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spLoteConsultar (
    pIdLote IN INT,
    pFechaIngreso OUT DATE,
    pFechaVencimiento OUT DATE,
    pCantidadTotal OUT INT,
    pCantidadDisponible OUT INT,
    pIdMedicamento OUT INT,
    pIdProveedor OUT INT
)
AS
BEGIN
    SELECT fechaIngreso, fechaVencimiento, cantidadTotal, cantidadDisponible, idMedicamento, idProveedor
    INTO pFechaIngreso, pFechaVencimiento, pCantidadTotal, pCantidadDisponible, pIdMedicamento, pIdProveedor
    FROM LOTE
    WHERE idLote = pIdLote;
END;


DECLARE
    vFechaIngreso DATE;
    vFechaVencimiento DATE;
    vCantidadTotal INT;
    vCantidadDisponible INT;
    vIdMedicamento INT;
    vIdProveedor INT;
BEGIN
    spLoteConsultar(1, vFechaIngreso, vFechaVencimiento, vCantidadTotal, vCantidadDisponible, vIdMedicamento, vIdProveedor);
    DBMS_OUTPUT.PUT_LINE('Ingreso: ' || vFechaIngreso || ' | Vencimiento: ' || vFechaVencimiento || ' | Total: ' || vCantidadTotal || ' | Id Medicamento: ' || vIdMedicamento|| ' | Proveedor: ' || vIdProveedor);
END;

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spLoteActualizar (
    pIdLote IN INT,
    pFechaIngreso IN DATE,
    pFechaVencimiento IN DATE,
    pCantidadTotal IN INT,
    pCantidadDisponible IN INT,
    pIdMedicamento IN INT,
    pIdProveedor IN INT
)
AS
BEGIN
    UPDATE LOTE
    SET fechaIngreso = pFechaIngreso,
        fechaVencimiento = pFechaVencimiento,
        cantidadTotal = pCantidadTotal,
        cantidadDisponible = pCantidadDisponible,
        idMedicamento = pIdMedicamento,
        idProveedor = pIdProveedor
    WHERE idLote = pIdLote;
END;

BEGIN
    spLoteActualizar(11, TO_DATE('2025/08/16','YYYY/MM/DD'), TO_DATE('2026/08/16','YYYY/MM/DD'), 600, 600, 1, 1);
END;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spLoteEliminar (
    pIdLote IN INT
)
AS
BEGIN
    DELETE FROM LOTE
    WHERE idLote = pIdLote;
END;


BEGIN
    spLoteEliminar(11);
END;

/*---------------------------------------------------CRUD PROVEEDOR----------------------------------------------------------------------*/


CREATE OR REPLACE PROCEDURE spProveedorInsertar
(
    pId IN INT,
    pNombre IN VARCHAR,
    pDireccion IN VARCHAR,
    pEmail IN VARCHAR
)
AS
BEGIN
    INSERT INTO PROVEEDOR VALUES (pId, pNombre, pDireccion, pEmail);
END;

BEGIN
    spProveedorInsertar(11, 'aa', 'aaa', 'aaa');
END;

/*----------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spProveedorConsultar
(
    pId IN INT,
    pNombre OUT VARCHAR,
    pDireccion OUT VARCHAR,
    pEmail OUT VARCHAR
)
AS
BEGIN
    SELECT nombre, direccion, email
    INTO pNombre, pDireccion, pEmail
    FROM PROVEEDOR
    WHERE idProveedor = pId;
END;

DECLARE
    vNombre VARCHAR(30);
    vDireccion VARCHAR(50);
    vEmail VARCHAR(30);
BEGIN
    spProveedorConsultar(11, vNombre, vDireccion, vEmail);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || vNombre || ' | Dirección: ' || vDireccion || ' | Email: ' || vEmail);
END;

/*-------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spProveedorActualizar
(
    pId IN INT,
    pNombre IN VARCHAR,
    pDireccion IN VARCHAR,
    pEmail IN VARCHAR
)
AS
BEGIN
    UPDATE PROVEEDOR
    SET nombre = pNombre,
        direccion = pDireccion,
        email = pEmail
    WHERE idProveedor = pId;
END;

BEGIN
    spProveedorActualizar(11, 'bb', 'bb', 'bb');
END;


/*----------------------------------------------------------------------------------------------------------------------------*/


CREATE OR REPLACE PROCEDURE spProveedorEliminar
(
    pId IN INT
)
AS
BEGIN
    DELETE FROM PROVEEDOR
    WHERE idProveedor = pId;
END;

BEGIN
    spProveedorEliminar(11);
END;


/*----------------------------------------------------------------CRUD USUARIO------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spUsuarioInsertar
(
    pId IN INT,
    pNombreUsuario IN VARCHAR,
    pRol IN VARCHAR,
    pContrasenna IN VARCHAR,
    pEmail IN VARCHAR
)
AS
BEGIN
    INSERT INTO USUARIO VALUES (pId, pNombreUsuario, pRol, pContrasenna, pEmail);
END;


BEGIN
    spUsuarioInsertar(11, 'aa', 'aa', 'aa', 'a');
END;
/*------------------------------------------------------------------------------------------------------------*/


CREATE OR REPLACE PROCEDURE spUsuarioConsultar
(
    pId IN INT,
    pNombreUsuario OUT VARCHAR,
    pRol OUT VARCHAR,
    pContrasenna OUT VARCHAR,
    pEmail OUT VARCHAR
)
AS
BEGIN
    SELECT nombreUsuario, rol, contrasenna, email
    INTO pNombreUsuario, pRol, pContrasenna, pEmail
    FROM USUARIO
    WHERE idUsuario = pId;
END;

DECLARE
    vNombreUsuario VARCHAR(30);
    vRol VARCHAR(10);
    vContrasenna VARCHAR(30);
    vEmail VARCHAR(30);
BEGIN
    spUsuarioConsultar(11, vNombreUsuario, vRol, vContrasenna, vEmail);
    DBMS_OUTPUT.PUT_LINE('Usuario: ' || vNombreUsuario || ' | Rol: ' || vRol || ' | Email: ' || vEmail);
END;

/*---------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spUsuarioActualizar
(
    pId IN INT,
    pNombreUsuario IN VARCHAR,
    pRol IN VARCHAR,
    pContrasenna IN VARCHAR,
    pEmail IN VARCHAR
)
AS
BEGIN
    UPDATE USUARIO
    SET nombreUsuario = pNombreUsuario,
        rol = pRol,
        contrasenna = pContrasenna,
        email = pEmail
    WHERE idUsuario = pId;
END;


BEGIN
    spUsuarioActualizar(11, 'bbb', 'bbb', 'bbb', 'bbb');
END;

/*----------------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spUsuarioEliminar
(
    pId IN INT
)
AS
BEGIN
    DELETE FROM USUARIO
    WHERE idUsuario = pId;
END;

BEGIN
    spUsuarioEliminar(11);
END;


/*--------------------------------------------------------CRUD MOVIMIENTO------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spMovimientoInsertar (
    pIdMovimiento IN INT,
    pTipoMovimiento IN VARCHAR,
    pFechaMovimiento IN DATE,
    pCantidad IN INT,
    pObservacion IN VARCHAR,
    pIdLote IN INT,
    pIdUsuario IN INT
)
AS
    vCantidadDisponible INT;
BEGIN
    /*Buscar la cantidad disponible de el lote al que se le hace el movimineto*/
    SELECT cantidadDisponible INTO vCantidadDisponible FROM LOTE WHERE idLote = pIdLote;

    INSERT INTO MOVIMIENTO 
    VALUES (pIdMovimiento, pTipoMovimiento, pFechaMovimiento, pCantidad, pObservacion, pIdLote, pIdUsuario);

    /*Actualizar cantidad disponible en el lote*/
    IF pTipoMovimiento = 'Entrada' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible + pCantidad
        WHERE idLote = pIdLote;
    ELSIF pTipoMovimiento = 'Salida' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible - pCantidad
        WHERE idLote = pIdLote;
    END IF;
END;

BEGIN
    spMovimientoInsertar(3, 'Salida', TO_DATE('2025/08/14','YYYY/MM/DD'), 500, 'Venta', 10, 2);
END;
BEGIN
    spMovimientoInsertar(2, 'Entrada', TO_DATE('2025/08/14','YYYY/MM/DD'), 500, 'Devolucion', 4, 2);
END;
/*-----------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE spMovimientoConsultar (
    pIdMovimiento IN INT,
    pTipoMovimiento OUT VARCHAR,
    pFechaMovimiento OUT DATE,
    pCantidad OUT INT,
    pObservacion OUT VARCHAR,
    pIdLote OUT INT,
    pIdUsuario OUT INT
)
AS
BEGIN
    SELECT tipoMovimiento, fechaMovimiento, cantidad, observacion, idLote, idUsuario
    INTO pTipoMovimiento, pFechaMovimiento, pCantidad, pObservacion, pIdLote, pIdUsuario
    FROM MOVIMIENTO
    WHERE idMovimiento = pIdMovimiento;
END;



DECLARE
    vTipo VARCHAR(10);
    vFecha DATE;
    vCantidad INT;
    vObs VARCHAR(50);
    vLote INT;
    vUsuario INT;
BEGIN
    spMovimientoConsultar(3, vTipo, vFecha, vCantidad, vObs, vLote, vUsuario);
    DBMS_OUTPUT.PUT_LINE('Tipo: ' || vTipo || ' | Fecha: ' || vFecha || ' | Cantidad: ' || vCantidad || ' | Observación: ' || vObs || ' | Lote: ' || vLote || ' | Usuario: ' || vUsuario);
END;

/*----------------------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spMovimientoActualizar (
    pIdMovimiento IN INT,
    pCantidad IN INT,
    pObservacion IN VARCHAR2
    
    /*Con Varchar normal no lo corria*/
)
AS
    vIdLote INT;
    vTipo VARCHAR2(10);
    vCantidadAnterior INT;
BEGIN
    /*Sacar los datos del movimiento que se va a actualizar*/
    SELECT idLote, tipoMovimiento, cantidad INTO vIdLote, vTipo, vCantidadAnterior
    FROM MOVIMIENTO
    WHERE idMovimiento = pIdMovimiento;

    /*Actualizar cantidad disponible en lote*/
    IF vTipo = 'Entrada' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible - vCantidadAnterior + pCantidad
        WHERE idLote = vIdLote;
    ELSIF vTipo = 'Salida' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible + vCantidadAnterior - pCantidad
        WHERE idLote = vIdLote;
    END IF;

    UPDATE MOVIMIENTO
    SET cantidad = pCantidad,
        observacion = pObservacion
    WHERE idMovimiento = pIdMovimiento;
END;

BEGIN
    spMovimientoActualizar(3, 400, 'Venta ajustada');
END;

/*------------------------------------------------------------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE spMovimientoEliminar (
    pIdMovimiento IN INT
)
AS
    vIdLote INT;
    vTipo VARCHAR2(10);
    vCantidad INT;
BEGIN
    /*Sacar los datos del movimiento que se va a borrarr*/
    SELECT idLote, tipoMovimiento, cantidad INTO vIdLote, vTipo, vCantidad
    FROM MOVIMIENTO
    WHERE idMovimiento = pIdMovimiento;

    /*Devolver el lote a como estaba antes*/
    IF vTipo = 'Entrada' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible - vCantidad
        WHERE idLote = vIdLote;
    ELSIF vTipo = 'Salida' THEN
        UPDATE LOTE
        SET cantidadDisponible = cantidadDisponible + vCantidad
        WHERE idLote = vIdLote;
    END IF;

    DELETE FROM MOVIMIENTO
    WHERE idMovimiento = pIdMovimiento;
END;


BEGIN
    spMovimientoEliminar(3);
END;



/*--------------------------------------------------------------Cursores--------------------------------------------------------*/


CREATE OR REPLACE PROCEDURE spEliminarLotesVencidos
AS
    CURSOR cLotesVencidos IS
        SELECT idLote
        FROM LOTE
        WHERE fechaVencimiento < SYSDATE;

    vIdLote int;
BEGIN
    OPEN cLotesVencidos;
    LOOP
        FETCH cLotesVencidos INTO vIdLote;
        EXIT WHEN cLotesVencidos%NOTFOUND;

        DELETE FROM LOTE WHERE idLote = vIdLote;
    END LOOP;
    CLOSE cLotesVencidos;
    
    
END;

INSERT INTO LOTE VALUES (79, TO_DATE('2024-01-01','YYYY-MM-DD'), TO_DATE('2024-06-01','YYYY-MM-DD'), 100, 100, 1, 1);
INSERT INTO LOTE VALUES (100, TO_DATE('2024-01-01','YYYY-MM-DD'), TO_DATE('2024-05-01','YYYY-MM-DD'), 100, 100, 1, 1);
INSERT INTO LOTE VALUES (101, TO_DATE('2024-01-01','YYYY-MM-DD'), TO_DATE('2024-04-01','YYYY-MM-DD'), 100, 100, 1, 1);

BEGIN
    spEliminarLotesVencidos;

END;
/*--------------------------------------------------------------------------------------------Funciones------------------------------------------------------*/


*----------------------------------------------------FUNCION 1----------------------------------------------------*/
/* Buscar medicamento por nombre o tipo */
CREATE OR REPLACE FUNCTION fnBuscarMedicamento(
    pNombre IN VARCHAR,
    pTipo   IN VARCHAR
) RETURN SYS_REFCURSOR
AS
    vCursor SYS_REFCURSOR;
BEGIN
    OPEN vCursor FOR
        SELECT idMedicamento, nombre, tipo
        FROM MEDICAMENTO
        WHERE (pNombre IS NULL OR UPPER(nombre) LIKE UPPER('%' || pNombre || '%'))
          AND (pTipo IS NULL OR UPPER(tipo) LIKE UPPER('%' || pTipo || '%'));
    RETURN vCursor;
END;


/* Ejemplo de uso */
DECLARE
    vCur SYS_REFCURSOR;
    vId MEDICAMENTO.idMedicamento%TYPE;
    vNombre MEDICAMENTO.nombre%TYPE;
    vTipo MEDICAMENTO.tipo%TYPE;
BEGIN
    vCur := fnBuscarMedicamento('Paracetamol', NULL);
    LOOP
        FETCH vCur INTO vId, vNombre, vTipo;
        EXIT WHEN vCur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || vId || ' | Nombre: ' || vNombre || ' | Tipo: ' || vTipo);
    END LOOP;
    CLOSE vCur;
END;


/*----------------------------------------------------FUNCION 2----------------------------------------------------*/
/* Consultar todos los movimientos de un medicamento */
CREATE OR REPLACE FUNCTION fnMovimientosPorMedicamento(
    pIdMedicamento IN INT
) RETURN SYS_REFCURSOR
AS
    vCursor SYS_REFCURSOR;
BEGIN
    OPEN vCursor FOR
        SELECT m.idMovimiento, m.tipoMovimiento, m.fechaMovimiento, m.cantidad, m.observacion
        FROM MOVIMIENTO m
        JOIN LOTE l ON m.idLote = l.idLote
        WHERE l.idMedicamento = pIdMedicamento;
    RETURN vCursor;
END;


/* Ejemplo de uso */
DECLARE
    vCur SYS_REFCURSOR;
    vIdMov MOVIMIENTO.idMovimiento%TYPE;
    vTipo MOVIMIENTO.tipoMovimiento%TYPE;
    vFecha MOVIMIENTO.fechaMovimiento%TYPE;
    vCantidad MOVIMIENTO.cantidad%TYPE;
    vObs MOVIMIENTO.observacion%TYPE;
BEGIN
    vCur := fnMovimientosPorMedicamento(4);
    LOOP
        FETCH vCur INTO vIdMov, vTipo, vFecha, vCantidad, vObs;
        EXIT WHEN vCur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Mov: ' || vIdMov || ' | Tipo: ' || vTipo || ' | Fecha: ' || vFecha || ' | Cantidad: ' || vCantidad || ' | Obs: ' || vObs);
    END LOOP;
    CLOSE vCur;
END;
/*-----------------------------------------------------------------------------Vistas------------------------------------------------------------------------*/

CREATE OR REPLACE VIEW vwLotesPorVencer AS
SELECT l.idLote, m.nombre AS medicamento, l.fechaVencimiento, l.cantidadDisponible
FROM LOTE l
JOIN MEDICAMENTO m ON l.idMedicamento = m.idMedicamento
WHERE l.fechaVencimiento <= (SYSDATE + 30);

INSERT INTO LOTE VALUES (99, TO_DATE('2025-08-17','YYYY-MM-DD'), TO_DATE('2025-08-21','YYYY-MM-DD'), 100, 100, 1, 1);

/*----------------------------------------------------VISTA 2----------------------------------------------------*/
/* Cantidad disponible de cada medicamento */
CREATE OR REPLACE VIEW vwInventarioMedicamentos AS
SELECT m.idMedicamento, m.nombre, SUM(l.cantidadDisponible) AS cantidadDisponible
FROM MEDICAMENTO m
LEFT JOIN LOTE l ON m.idMedicamento = l.idMedicamento
GROUP BY m.idMedicamento, m.nombre;

/*----------------------------------------------------VISTA 3----------------------------------------------------*/
/* Movimientos con nombre de usuario y fecha */
CREATE OR REPLACE VIEW vwMovimientosUsuarios AS
SELECT u.nombreUsuario, m.tipoMovimiento, m.fechaMovimiento, m.cantidad, m.observacion
FROM MOVIMIENTO m
JOIN USUARIO u ON m.idUsuario = u.idUsuario;
