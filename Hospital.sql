--Creaci�n de la base de datos Hospital
--


CREATE TABLE Dept
(
	Dept_No			INT				NOT NULL,
	DNombre			VARCHAR(50)		NULL,
	Loc				VARCHAR(50)		NULL,
	CONSTRAINT PK_Dept PRIMARY KEY(Dept_No)
);
CREATE TABLE Emp
(
	Emp_No			INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Oficio			VARCHAR(50)		NULL,
	Dir				INT				NULL,
	Fecha_Alt		DATE	NULL,
	Salario			NUMERIC(9,2)	NULL,
	Comision		NUMERIC(9,2)	NULL,
	Dept_No			INT				NULL,
	CONSTRAINT PK_Emp PRIMARY KEY(Emp_No),
	CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)
);
CREATE TABLE Hospital
(
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Telefono		VARCHAR(50)		NULL,
	Num_Cama		INT				NULL,
	CONSTRAINT PK_Hospital PRIMARY KEY(Hospital_Cod)
);
CREATE TABLE Doctor
(
	Doctor_No		INT				NOT NULL,
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Especialidad	VARCHAR(50)		NULL,
	CONSTRAINT PK_Doctor PRIMARY KEY(Doctor_No),
	CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);
CREATE TABLE Sala
(
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Num_Cama		INT				NULL,
	CONSTRAINT PK_Sala PRIMARY KEY(Sala_Cod,Hospital_Cod),
	CONSTRAINT FK_Sala_Hospital FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);
CREATE TABLE Plantilla
(
	Empleado_No		INT				NOT NULL,
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Funcion			VARCHAR(50)		NULL,
	T				VARCHAR(15)		NULL,
	Salario			NUMERIC(9,2)	NULL,
	CONSTRAINT PK_Plantilla PRIMARY KEY(Empleado_No),
	CONSTRAINT FK_Plantilla_Sala01 FOREIGN KEY (Sala_Cod,Hospital_Cod) REFERENCES Sala(Sala_Cod,Hospital_Cod)
);
CREATE TABLE Enfermo
(
	Inscripcion		INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Fecha_Nac		VARCHAR(50)		NULL,
	S				VARCHAR(2)		NULL,
	NSS				INT				NULL
);	



--***Insertar datos en las tablas de la Base de Datos de ejemplo llamada HOSPITAL***
--Trataremos de mostrar las tres formas de insertar datos fijos o que no provienen de ninguna otra tabla
--
--Insertar datos en la table Dept
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACI�N','MADRID');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCI�N','SALAMANCA');

--Insertar datos en la tabla Emp
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7369,'SANCHEZ','EMPLEADO',7902,'17/12/1980',10400,0,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7499,'ARROYO','VENDEDOR',7698,'22/02/1981',208000,39000,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7521,'SALA','VENDEDOR',689,'22/02/1981',162500,65000,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7566,'JIMENEZ','DIRECTOR',7839,'02/04/1981',386750,0,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7654,'MARTIN','VENDEDOR',7698,'28/09/1981',182000,182000,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7698,'NEGRO','DIRECTOR',7839,'01/05/1981',370500,0,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7782,'CEREZO','DIRECTOR',7839,'09/06/1981',318500,0,10);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7788,'NINO','ANALISTA',7566,'30/03/1987',390000,0,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7839,'REY','PRESIDENTE',0,'17/11/1981',650000,0,10);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7844,'TOVAR','VENDEDOR',7698,'08/09/1981',195000,0,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7876,'ALONSO','EMPLEADO',7788,'03/05/1987',143000,0,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7900,'JIMENO','EMPLEADO',7698,'03/12/1981',123500,0,30);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7902,'FERNANDEZ','ANALISTA',7566,'03/12/1981',390000,0,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7934,'MU�OZ','EMPLEADO',7782,'23/06/1982',169000,0,10);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7119,'SERRA','DIRECTOR',7839,'19/11/1983',225000,39000,20);
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7322,'GARCIA','EMPLEADO',7119,'12/10/1982',129000,0,20);

--Insertar datos en la tabla Hospital
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) 
VALUES(19,'Provincial','O Donell 50','964-4256',502);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) 
VALUES(18,'General','Atocha s/n','595-3111',987);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) 
VALUES(22,'La Paz','Castellana 1000','923-5411',412);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) 
VALUES(45,'San Carlos','Ciudad Universitaria','597-1500',845);

--Insertar datos en la tabla Doctor
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(22,386,'Cabeza D.','Psiquiatr�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(22,398,'Best D.','Urolog�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(19,435,'L�pez A.','Cardiolog�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(22,453,'Galo D.','Pediatr�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(45,522,'Adams C.','Neurolog�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(18,585,'Miller G.','Ginecolog�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(45,607,'Chuki P.','Pediatr�a');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) 
VALUES(18,982,'Cajal R.','Cardiolog�a');

--Insertar datos en la tabla Sala
INSERT INTO SALA VALUES(1,22,'Recuperaci�n',10);
INSERT INTO SALA VALUES(1,45,'Recuperaci�n',15);
INSERT INTO SALA VALUES(2,22,'Maternidad',34);
INSERT INTO SALA VALUES(2,45,'Maternidad',24);
INSERT INTO SALA VALUES(3,19,'Cuidados Intensivos',21);
INSERT INTO SALA VALUES(3,18,'Cuidados Intensivos',10);
INSERT INTO SALA VALUES(4,18,'Cardiolog�a',53);
INSERT INTO SALA VALUES(4,45,'Cardiolog�a',55);
INSERT INTO SALA VALUES(6,19,'Psiqui�tricos',67);
INSERT INTO SALA VALUES(6,22,'Psiqui�tricos',118) ;

--Insertar datos en la tabla Plantilla
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,6,1009,'Higueras D.','Enfermera','T',200500);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(45,4,1280,'Amigo R.','Interino','N',221000);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(19,6,3106,'Hern�ndez','Enfermero','T',275000);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(19,6,3754,'D�az B.','Enfermera','T',226200);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,1,6065,'Rivera G.','Enfermera','N',162600);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(18,4,6357,'Karplus W.','Interino','T',337900);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,1,7379,'Carlos R.','Enfermera','T',211900);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,6,8422,'Bocina G.','Enfermero','M',183800);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(45,1,8526,'Frank H.','Enfermera','T',252200);
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,2,9901,'N��ez C.','Interino','M',221000);

--Insertar datos en la tabla Enfermo
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(10995,'Lagu�a M.','Goya 20','16-may-56','M',280862422);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(14024,'Fern�ndez M.','Recoletos 50','21-may-60','F',284991452);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(18004,'Serrano V.','Alcal� 12','23-jun-67','F',321790059);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(38702,'Neal R.','Orense 11','18-jun-40','F',380010217);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(39217,'Cervantes M.','Per�n 38','29-feb-52','M',440294390);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(59076,'Miller B.','L�pez de Hoyos 2','16-sep-45','F',311969044);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776);
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(74835,'Ben�tez E.','Argentina','05-oct-57','M',154811767);



select emp_no,apellido,fecha_alt
    from emp
    where fecha_alt=(select min(fecha_alt)from emp);



    

WITH Fecha AS (
    SELECT MIN(fecha_alt) 
    FROM emp
)
SELECT emp_no, apellido, fecha_alt
FROM emp 
WHERE fecha_alt = (select * from Fecha);

/*Muestre el numero de empleado, el apellido y la fecha de alta del empleado mas modernos de la empresa. -*/

select emp_no,apellido,fecha_alt
    from emp
    where fecha_alt=(select max(fecha_alt)from emp);



WITH Fecha AS (
    SELECT max(fecha_alt) fchaMax
    FROM emp
)
SELECT emp_no, apellido, fecha_alt
FROM emp 
WHERE fecha_alt = (select fchaMax from Fecha);


/*Muestre el apellido y el oficio de los empleados con el mismo oficio que Jiménez. -*/

select oficio
    from emp
    where apellido = 'JIMENEZ'
    
    
select apellido, oficio
    from emp
    where oficio=(select oficio
    from emp
    where apellido = 'JIMENEZ');

/*Es necesario saber el apellido, oficio, salario y número de departamento de los empleados con salario mayor que el mejor salario del departamento 30. - */


    
with salario as (
    select max(salario) maxsalario
     from emp
     where dept_no=30

)
select apellido,oficio,salario,dept_no
    from emp
    where salario > (select maxsalario from salario);


/*Muestre el apellido, la función, sala o departamento de todos los empleados que trabajen en la empresa -*/


with tablaemp as (
    
    select apellido, oficio funcion, dept_no departamento 
    from emp
),
tablaplan as(
    select apellido, funcion, sala_cod departamento 
    from plantilla
)


select apellido, funcion, departamento
    from tablaemp
union
select apellido, funcion, departamento
    from tablaplan;
    
    
/*Determine el salario de todos los empleados de la empresa, de forma que se aprecien las diferencias entre ellos. -*/

    
with tablaemp as (
    
    select apellido, salario
    from emp
),
tablaplan as(
    select apellido, salario 
    from plantilla
)    

select apellido, salario
    from tablaemp
union
select apellido, salario
    from tablaplan
order by salario asc;
    
/*Muestre apellidos y oficio de los empleados del departamento 20 cuyo trabajo sea el mismo que el de cualquier empleado de ventas. -*/   

/*empleados del departamento 20*/
/*empleado de ventas*/
/**/

with dep30 as(
    select dept_no
        from dept 
        where dnombre='VENTAS'
),
empven as (
    
    select oficio
        from emp
        where dept_no=(select dept_no from dep30)


),
dep20 as (

    select apellido, oficio
        from emp
        where dept_no= 20

)
select apellido,oficio
    from dep20
    where oficio in (select oficio from empven);


/*Muestre los empleados que tienen mejor salario que la media de los directores, no incluyendo al presidente. -*/

/*los directores, no incluyendo al presidente*/

with AVGdirectores as (
     select avg(salario)media
        from emp
        where oficio='DIRECTOR'
),
excpresi as (
    select apellido,oficio,salario
        from emp
        where oficio <> 'PRESIDENTE'
)


select apellido,oficio,salario
    from excpresi
    where salario>(select media from AVGdirectores);
    
/*Mostrar el apellido, función, salario y código de hospital de los empleados de la plantilla
que siendo enfermeros o enfermeras pertenecen al hospital SAN CARLOS. el 9 */    
with codSanCarlos as(

    select hospital_cod,nombre
        from hospital
        where nombre='San Carlos'
)   

    
select apellido,funcion,salario,hospital_cod
    from plantilla
    where funcion in('Enfermera','Enfermero') and hospital_cod =(select hospital_cod from codSanCarlos); 
    
    
/*Visualizar los datos de los hospitales que tienen personal (Doctores) de cardiología.  - el 10*/    
    
    


select hospital_cod,nombre,direccion,telefono,num_cama
    from hospital
    where hospital_cod = any(select hospital_cod
                            from doctor
                            where especialidad='Cardiolog�a')


/*Visualizar el salario anual de los empleados de la plantilla del Hospital Provincial y General. - el 11*/


with hospitalPyG as (

    select hospital_cod, nombre
        from hospital
        where nombre in ('Provincial','General')
)
select hospital_cod,apellido,(salario*12)
    from plantilla
    where hospital_cod in(select hospital_cod from hospitalPyG);


/*Mostrar el apellido de los enfermos que nacieron antes que el Señor Miller. -*/

with fechaMiller as(
    select to_date(fecha_nac, 'DD-MON-YY') fecha
        from enfermo
        where apellido like 'Miller%'
)
select apellido,to_date(fecha_nac, 'DD-MON-YY')
    from enfermo
    where to_date(fecha_nac, 'DD-MON-YY') <any (select fecha from fechaMiller)

/*tipo date el 12   */
   
    
