
/*Punto1*/
/*Genere los scripts de creación de base de datos, tablas y llaves foráneas.(35pts)*/
/*Tabla DEPARTAMENTO*/
/*Hora 8:44 11/08/2025 Joseph Segura Diaz*/
CREATE TABLE DEPARTAMENTO
(
    codDepto VARCHAR(15)NOT NULL,
    nombreDpto VARCHAR(60) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    director VARCHAR(60) NOT NULL,
    
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (codDepto)
);
/*Tabla EMPLEADO*/
CREATE TABLE EMPLEADO
(
    nDIEmp VARCHAR(15) NOT NULL,
    nomEmp VARCHAR(60) NOT NULL,
    sexEmp CHAR(1) NOT NULL,
    fecNac DATE NOT NULL,
    fecIncorporacion DATE NOT NULL,
    salEmp DECIMAL(10,2) NOT NULL,
    comisionE DECIMAL(10,2),
    cargoE VARCHAR(50) NOT NULL,
    jefeID VARCHAR(15)NULL ,
    codDepto VARCHAR(15) NULL,
    
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (nDIEmp),
    CONSTRAINT FK_EMPLEADO_DEPTO FOREIGN KEY (codDepto) REFERENCES DEPARTAMENTO(codDepto),
    CONSTRAINT CKC_sexEmp CHECK (sexEmp IN ('M', 'F'))
);
/*-----------------------------------------------------------punto 2--------------------------------------------------------------*/
/*Inserción de datos en la tabla Departamento:(10pts)*/
/*Hora 8:44 11/08/2025 Joseph Segura Diaz*/

INSERT INTO DEPARTAMENTO VALUES ('1000', 'GERENCIA', 'CALI', '31.840.269');
INSERT INTO DEPARTAMENTO VALUES ('1500', 'PRODUCCIÓN', 'CALI', '16.211.383');
INSERT INTO DEPARTAMENTO VALUES ('2000', 'VENTAS', 'CALI', '31.178.144');
INSERT INTO DEPARTAMENTO VALUES ('3000', 'INVESTIGACIÓN', 'CALI', '16.759.060');
INSERT INTO DEPARTAMENTO VALUES ('3500', 'MERCADEO', 'CALI', '22.222.222');
INSERT INTO DEPARTAMENTO VALUES ('2100', 'VENTAS', 'POPAYAN', '31.751.219');
INSERT INTO DEPARTAMENTO VALUES ('2200', 'VENTAS', 'BUGA', '768.782');
INSERT INTO DEPARTAMENTO VALUES ('2300', 'VENTAS', 'CARTAGO', '737.689');
INSERT INTO DEPARTAMENTO VALUES ('4000', 'MANTENIMIENTO', 'CALI', '333.333.333');
INSERT INTO DEPARTAMENTO VALUES ('4100', 'MANTENIMIENTO', 'POPAYAN', '888.888');
INSERT INTO DEPARTAMENTO VALUES ('4200', 'MANTENIMIENTO', 'BUGA', '11.111.111');
INSERT INTO DEPARTAMENTO VALUES ('4300', 'MANTENIMIENTO', 'CARTAGO', '444.444');

/*------------------------------------------------------------Punto 3---------------------------------------------------------------*/
/*Inserción de datos en la tabla Empleado: (10pts)*/
/*Hora 8:44 11/08/2025 Joseph Segura Diaz*/
INSERT INTO EMPLEADO VALUES ('31.840.269', 'María Rojas', 'F', TO_DATE('1959-01-15','YYYY-MM-DD'), TO_DATE('1990-05-16','YYYY-MM-DD'), 6250000, 1500000, 'Gerente', NULL, '1000');
INSERT INTO EMPLEADO VALUES ('16.211.383', 'Luis Pérez', 'M', TO_DATE('1956-02-25','YYYY-MM-DD'), TO_DATE('2000-01-01','YYYY-MM-DD'), 5050000, 0, 'Director', '31.840.269', '1500');
INSERT INTO EMPLEADO VALUES ('31.178.144', 'Rosa Angulo', 'F', TO_DATE('1957-03-15','YYYY-MM-DD'), TO_DATE('1998-08-16','YYYY-MM-DD'), 3250000, 3500000, 'Jefe Ventas', '31.840.269', '2000');
INSERT INTO EMPLEADO VALUES ('16.759.060', 'Darío Casas', 'M', TO_DATE('1960-04-05','YYYY-MM-DD'), TO_DATE('1992-11-01','YYYY-MM-DD'), 4500000, 500000, 'Investigador', '31.840.269', '3000');
INSERT INTO EMPLEADO VALUES ('22.222.222', 'Carla López', 'F', TO_DATE('1975-05-11','YYYY-MM-DD'), TO_DATE('2005-07-16','YYYY-MM-DD'), 4500000, 500000, 'Jefe Mercadeo', '31.840.269', '3500');
INSERT INTO EMPLEADO VALUES ('22.222.333', 'Carlos Rozo', 'M', TO_DATE('1975-05-11','YYYY-MM-DD'), TO_DATE('2001-09-16','YYYY-MM-DD'), 750000, 500000, 'Vigilante', '31.840.269', '3500');
INSERT INTO EMPLEADO VALUES ('1.751.219', 'Melissa Roa', 'F', TO_DATE('1960-06-19','YYYY-MM-DD'), TO_DATE('2001-03-16','YYYY-MM-DD'), 2250000, 2500000, 'Vendedor', '31.178.144', '2100');
INSERT INTO EMPLEADO VALUES ('768.782', 'Joaquín Rosas', 'M', TO_DATE('1947-07-07','YYYY-MM-DD'), TO_DATE('1990-05-16','YYYY-MM-DD'), 2250000, 2500000, 'Vendedor', '31.178.144', '2200');
INSERT INTO EMPLEADO VALUES ('737.689', 'Mario Llano', 'M', TO_DATE('1945-08-30','YYYY-MM-DD'), TO_DATE('1990-05-16','YYYY-MM-DD'), 2250000, 2500000, 'Vendedor', '31.178.144', '2300');
INSERT INTO EMPLEADO VALUES ('333.333.333', 'Elisa Rojas', 'F', TO_DATE('1979-09-28','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 3000000, 1000000, 'Jefe Mecánicos', '31.840.269', '4000');
INSERT INTO EMPLEADO VALUES ('888.888', 'Iván Duarte', 'M', TO_DATE('1955-08-12','YYYY-MM-DD'), TO_DATE('1998-05-16','YYYY-MM-DD'), 1050000, 200000, 'Mecánico', '333.333.333', '4100');
INSERT INTO EMPLEADO VALUES ('11.111.111', 'Irene Díaz', 'F', TO_DATE('1979-09-28','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 1050000, 200000, 'Mecánico', '333.333.333', '4200');
INSERT INTO EMPLEADO VALUES ('444.444', 'Abel Gómez', 'M', TO_DATE('1939-12-24','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 1050000, 200000, 'Mecánico', '333.333.333', '4300');
INSERT INTO EMPLEADO VALUES ('1.130.222', 'José Giraldo', 'M', TO_DATE('1985-01-20','YYYY-MM-DD'), TO_DATE('2000-11-01','YYYY-MM-DD'), 1200000, 400000, 'Asesor', '22.222.222', '3500');
INSERT INTO EMPLEADO VALUES ('19.709.802', 'William Daza', 'M', TO_DATE('1982-10-09','YYYY-MM-DD'), TO_DATE('1999-12-16','YYYY-MM-DD'), 2250000, 1000000, 'Investigador', '16.759.060', '3000');
INSERT INTO EMPLEADO VALUES ('31.174.099', 'Diana Solarte', 'F', TO_DATE('1957-11-19','YYYY-MM-DD'), TO_DATE('1990-05-16','YYYY-MM-DD'), 1250000, 500000, 'Secretaria', '31.840.269', '1000');
INSERT INTO EMPLEADO VALUES ('1.130.777', 'Marcos Cortez', 'M', TO_DATE('1986-06-23','YYYY-MM-DD'), TO_DATE('2000-04-16','YYYY-MM-DD'), 2550000, 500000, 'Mecánico', '333.333.333', '4000');
INSERT INTO EMPLEADO VALUES ('1.130.782', 'Antonio Gil', 'M', TO_DATE('1980-01-23','YYYY-MM-DD'), TO_DATE('2010-04-16','YYYY-MM-DD'), 850000, 1500000, 'Técnico', '16.211.383', '1500');
INSERT INTO EMPLEADO VALUES ('333.333.334', 'Marisol Pulido', 'F', TO_DATE('1979-10-01','YYYY-MM-DD'), TO_DATE('1990-05-16','YYYY-MM-DD'), 3250000, 1000000, 'Investigador', '16.759.060', '3000');
INSERT INTO EMPLEADO VALUES ('333.333.335', 'Ana Moreno', 'F', TO_DATE('1992-01-05','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 1200000, 400000, 'Secretaria', '16.759.060', '3000');
INSERT INTO EMPLEADO VALUES ('1.130.333', 'Pedro Blanco', 'M', TO_DATE('1987-10-28','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 800000, 3000000, 'Vendedor', '31.178.144', '2000');
INSERT INTO EMPLEADO VALUES ('1.130.444', 'Jesús Alfonso', 'M', TO_DATE('1988-03-14','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 800000, 3500000, 'Vendedor', '31.178.144', '2000');
INSERT INTO EMPLEADO VALUES ('333.333.336', 'Carolina Ríos', 'F', TO_DATE('1992-02-15','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 1250000, 500000, 'Secretaria', '16.211.383', '1500');
INSERT INTO EMPLEADO VALUES ('333.333.337', 'Edith Muñoz', 'F', TO_DATE('1992-03-31','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 800000, 3600000, 'Vendedor', '31.178.144', '2100');
INSERT INTO EMPLEADO VALUES ('1.130.555', 'Julián Mora', 'M', TO_DATE('1989-07-03','YYYY-MM-DD'), TO_DATE('2000-10-01','YYYY-MM-DD'), 800000, 3100000, 'Vendedor', '31.178.144', '2200');
INSERT INTO EMPLEADO VALUES ('1.130.666', 'Manuel Millán', 'M', TO_DATE('1990-12-08','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 800000, 3700000, 'Vendedor', '31.178.144', '2300');

/*---------------------------------------------------------------------------Punto 4-----------------------------------------------------------------------------------*/
/*Genere los respectivos scripts que permitan ingresar, modificar y eliminar los datos a ambas tablas. (30pts – 5pts cada procedimiento.)*/
/*Hora 8:44 11/08/2025 Joseph Segura Diaz*/
/*procedimientos de departamento*/
/*Prodecimiento Insertar*/
CREATE OR REPLACE PROCEDURE spDepartamentoInsertar
(
    pCodDepto IN VARCHAR,
    pNombreDpto IN VARCHAR,
    pCiudad IN VARCHAR,
    pDirector IN VARCHAR
) AS
BEGIN
    INSERT INTO DEPARTAMENTO (codDepto, nombreDpto, ciudad, director)
    VALUES (pCodDepto, pNombreDpto, pCiudad, pDirector);
END;
/*Consumible*/
BEGIN
    spdepartamentoinsertar('aa', 'aa', 'aa', 'aaa');
END;


/*Prodecimiento Actualizar*/
CREATE OR REPLACE PROCEDURE spDepartamentoActualizar
(
    pCodDepto IN VARCHAR,
    pNombreDpto IN VARCHAR,
    pCiudad IN VARCHAR,
    pDirector IN VARCHAR
) AS
BEGIN
    UPDATE DEPARTAMENTO
    SET nombreDpto = pNombreDpto,
        ciudad = pCiudad,
        director = pDirector
    WHERE codDepto = pCodDepto;
END;
/*Consumible*/
BEGIN
    spdepartamentoactualizar('aa', 'bb', 'bb', 'bb');
END;

/*Prodecimiento Eliminar*/

CREATE OR REPLACE PROCEDURE spDepartamentoEliminar
(
    pCodDepto IN VARCHAR
) AS
BEGIN
    DELETE FROM DEPARTAMENTO WHERE codDepto = pCodDepto;
END;
/*Consumible*/
BEGIN
    spdepartamentoeliminar('aa');
END;

/*procedimientos de empleado*/
/*Prodecimiento Insertar*/
CREATE OR REPLACE PROCEDURE spEmpleadoInsertar
(
    pNDIEmp IN VARCHAR,
    pNomEmp IN VARCHAR,
    pSexEmp IN CHAR,
    pFecNac IN DATE,
    pFecIncorporacion IN DATE,
    pSalEmp IN DECIMAL,
    pComisionE IN DECIMAL,
    pCargoE IN VARCHAR,
    pJefeID IN VARCHAR,
    pCodDepto IN VARCHAR
) AS
BEGIN
    INSERT INTO EMPLEADO (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comisionE, cargoE, jefeID, codDepto)
    VALUES (pNDIEmp, pNomEmp, pSexEmp, pFecNac, pFecIncorporacion, pSalEmp, pComisionE, pCargoE, pJefeID, pCodDepto);
END;
/*Consumible*/
BEGIN
    spempleadoinsertar('aa', 'aa', 'M', TO_DATE('1990-12-08','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 800000, 3700000, 'aa', 'aa', '2300');
END;

/*Prodecimiento Actualizar*/
CREATE OR REPLACE PROCEDURE spEmpleadoActualizar
(
    pNDIEmp IN VARCHAR,
    pNomEmp IN VARCHAR,
    pSexEmp IN CHAR,
    pFecNac IN DATE,
    pFecIncorporacion IN DATE,
    pSalEmp IN DECIMAL,
    pComisionE IN DECIMAL,
    pCargoE IN VARCHAR,
    pJefeID IN VARCHAR,
    pCodDepto IN VARCHAR
) AS
BEGIN
    UPDATE EMPLEADO
    SET nomEmp = pNomEmp,
        sexEmp = pSexEmp,
        fecNac = pFecNac,
        fecIncorporacion = pFecIncorporacion,
        salEmp = pSalEmp,
        comisionE = pComisionE,
        cargoE = pCargoE,
        jefeID = pJefeID,
        codDepto = pCodDepto
    WHERE nDIEmp = pNDIEmp;
END;
/*Consumible*/
BEGIN
    spempleadoactualizar('aa', 'bb', 'M', TO_DATE('3000-12-08','YYYY-MM-DD'), TO_DATE('2004-06-01','YYYY-MM-DD'), 800000, 3700000, 'bb', 'bb', '2300');
END;

/*Prodecimiento Eliminar*/
CREATE OR REPLACE PROCEDURE spEmpleadoEliminar
(
    pNDIEmp IN VARCHAR
) AS
BEGIN
    DELETE FROM EMPLEADO WHERE nDIEmp = pNDIEmp;
END;
/*Consumible*/
BEGIN
    spempleadoeliminar('aa');
END;
/*---------------------------------------------------------------------------Punto 5-----------------------------------------------------------------*/
/*Realice las siguientes consultas a los datos indicados anteriormente: (15pts)*/
/*Hora 8:44 11/08/2025 Joseph Segura Diaz*/

/*   Genere una consulta que muestre todos los empleados y todos los departamentos, tomar en cuenta que si un departamento 
no tiene personas asignadas igual debe mostrar, importante indicar
que para lograr este script ocupa uno de los tipos de JOINS. (5pts)*/

select d.codDepto,d.nombreDpto,d.ciudad,d.director,e.nDIEmp,e.nomEmp,e.sexEmp,e.fecNac,e.fecIncorporacion,e.salEmp,e.comisionE,e.cargoe 
    FROM DEPARTAMENTO d Left join EMPLEADO e on d.codDepto= e.codDepto;


/*Genere un script que muestre los empleados que tengan el puesto de vendedor o 
mecánico y que además sean hombres, debe mostrar el nombre completo, salario, 
departamento y comisión. (5pts)*/
select e.cargoE,e.sexEmp,e.nomEmp,e.salEmp,d.nombreDpto,e.comisionE
    FROM EMPLEADO e inner join DEPARTAMENTO d on d.codDepto= e.codDepto
    WHERE (e.cargoE = 'Vendedor' OR e.cargoE = 'Mecánico')
    AND e.sexEmp = 'M';
    
/*Muestre solo los empleados que trabajan en la ciudad de Cali. (5pts)*/
select e.nomEmp,d.ciudad
    FROM EMPLEADO e inner join DEPARTAMENTO d on d.codDepto= e.codDepto
    WHERE d.ciudad='CALI';
    


