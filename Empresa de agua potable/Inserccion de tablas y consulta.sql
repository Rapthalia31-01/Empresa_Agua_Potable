create table Cliente(
	cliente_codigo varchar(10) primary key not null,
	cliente_nombre varchar(10) not null,
	cliente_apellido varchar(10) not null,
	cliente_cedula_identidad varchar(11) not null,
	cliente_fecha_nacimiento date,
	cliente_telefono integer,
	cliente_genero varchar(10),
	cliente_direccion varchar not null,
	cliente_email varchar(25) not null,
	cliente_usuario varchar(15) not null,
	cliente_contraseña varchar(20) not null
);

Insert into Cliente values ('21225','Carlos','Zamora','135139818-3','3/11/2001','0986845684','Masculino','Calle San Andres AV 15','carloszamORA@gmail.com','carlos2020','12345');
Insert into Cliente values ('21226','Karla','Fernandez','135137718-6','6/08/1985','0959658745','Femenino','Calle 15 AV 24','karlafernandez@gmail.com','karla1010','dagn12');
Insert into Cliente values ('21227','Jose','Palacio','134895678-9','8/12/1997','0994586420','Masculino','Calle Victor Velez AV 18','josepalacio@gmail.com','beyond15','15189');
Insert into Cliente values ('21228','John','Lopez','134987562-7','25/12/1975','0978954106','Masculino','Calle 20 AV 17','johnlopez@gmail.com','john09','abcd');
Insert into Cliente values ('21229','Keisy','Huerta','145219875-8','22/05/1999','091032698','Femenino','Calle 18 AV 23','keisy2020@gmail.com','keisyhv23','xyz');
Insert into Cliente values ('21230','Maria','Amaya','145892789-1','06/07/1998','0999789566','Femenino','Calle homer AV 28','mariaamaya10@gmail.com','mariaamaya1011','1289fgtg');
Insert into Cliente values ('21231','Miguel','Cedeño','124589413-0','19/03/1986','0910398758','Masculino','Calle San jose AV 17','miguelcedeño@gmail.com','miguelcedeño10','1123abzd');
Insert into Cliente values ('21232','Jared','Macias','137895697-5','1/01/1994','0956987585','Masculino','Calle 20 AV 18','jaredmacias24@gmail.com','jared24','12345');
Insert into Cliente values ('21233','Ricardo','Perez','131238957-9','1/06/1996','0999788888','Masculino','Calle 22 AV 16','ricardoperez01@gmail.com','ricardo01','14cgtr');
Insert into Cliente values ('21234','Evelyn','Mera','178954789-5','3/07/1986','0989789658','Femenino','Calle13 AV 16','evelynmera@gmail.com','evemacias10','eve1239');


create table comunidad(
	id_comunidad varchar(10) primary key not null,
	comunidad varchar(15) not null,
	fecha_lectura date,
	
	comunidad_codigo_cliente varchar (10),
	CONSTRAINT cliente_codigo_fk FOREIGN KEY (comunidad_codigo_cliente) REFERENCES Cliente (cliente_codigo)
  
);

Insert into comunidad values ('455','El Aromo','03/11/2020','21227');
Insert into comunidad values ('457','Ceibo Renacer','04/03/2020','21228');
Insert into comunidad values ('480','Los Esteros','19/06/2020','21230');
Insert into comunidad values ('350','Tarqui','22/01/2020','21234');
Insert into comunidad values ('456','El Aromo','3/11/2020','21227');
Insert into comunidad values ('458','El Aromo','3/11/2020','21227');
Insert into comunidad values ('470','Tarqui','22/01/2020','21234');
Insert into comunidad values ('256','Ceibo Renacer','04/03/2020','21228');
Insert into comunidad values ('459','El Aromo','3/11/2020','21227');
Insert into comunidad values ('440','Los Esteros','19/06/2020','21230');


create table Medidor(
	codigo_medidor varchar(10) primary key not null,
	lectura_de_medidor varchar (10) not null,
	estado varchar(35),
	
	
	medidor_codigo_cliente varchar(10),
CONSTRAINT cliente_fk FOREIGN KEY (medidor_codigo_cliente) REFERENCES cliente (cliente_codigo)
);

--medidor de carlos----------   
Insert into Medidor values ('0706','0003456m3','Mal estado de acometida de agua','21225');
Insert into Medidor values ('0078','0000098m3','Buen estado','21225');
Insert into Medidor values ('0760','0012458m3','Pesima condición','21225');

--medidor de keisy -----------
Insert into Medidor values ('0045','0002396m3','Buen estado','21229');
Insert into Medidor values ('0457','0002350m3','Buen estado','21229');

--medidor de jared------------
Insert into Medidor values ('0234','0000024m3','Mal estado','21232');

--medidor de ricardo----------
Insert into Medidor values ('0034','00230045m3','Mal estado de acometida de agua','21233');

--medidor de evelyn----------
Insert into Medidor values ('0097','0123400m3','Bue estado','21234');
Insert into Medidor values ('0567','0000345m3','Mal estado','21234');

--medidor de karla-----------
Insert into Medidor values ('0074','0134567m3','Mal estado de acometida de agua','21226');
Insert into Medidor values ('0468','0002345m3','Buen estado','21226');
Insert into Medidor values ('0039','0000034m3','Mal estado de acometida de agua','21226');

--- medidor de jose----------
Insert into Medidor values ('0038','0007865m3','Buen estado','21227');

---medidor de maria
Insert into Medidor values ('0237','0345680m3','Mal estado de acometida de agua','21230');


create table Plantilla(
	codigo_plantilla varchar (6) primary key not null,
	cliente_direccion varchar,
	mes varchar(10) not null,
	valor_a_pagar float not null,
	milimetros varchar (9) not null,
	tipo_pago varchar ,
	fch_limite_pago date not null,
	fch_corte date,
	estado varchar,
	
	plantilla_codigo_medidor varchar(10),
	plantilla_codigo_cliente varchar(10),
	
CONSTRAINT medidor_fk FOREIGN KEY (plantilla_codigo_medidor) REFERENCES Medidor (codigo_medidor)
  
);

---plantilla de Karla-------
Insert into Plantilla values('001234','calle San Andres AV 15','Enero',80,'0002345m3','Transferencia electrónica','6/08/2020','15/08/2020','Por favor pague la factura','0468');

---plantilla de jared-------
Insert into Plantilla values('000125','Calle 20 AV 18','Enero',200,'0000024m3','Efectivo','23/09/2020','27/09/2020','no pagado','0234'); 

--Plantilla de carlos-------   
Insert into Plantilla values('003589','Calle San Andres AV 15','Febrero',210,'0000098m3','Transferencia de debito','23/04/2020','23/05/2020','no pagado','0078'); 
Insert into Plantilla values('000347','Calle San Andres AV 15','Diciembre',50,'0003456m3','Transferencia electrónica','22/06/2020','01/07/2020','Por favor pague la factura','0706'); 

--Plantilla de evelyn--------   
Insert into Plantilla values('097578','Calle13 AV 16','Enero',64,'0000345m3','Efectivo','23/04/2020','23/04/2020','Por favor pague la factura','0567'); 


--Plantilla de ricardo------- 
Insert into Plantilla values('000245','Calle 22 AV 16','Abril',35,'0023004m3','Transferencia de debito','02/07/2020','03/08/2020','Por favor pague la factura','0034'); 

--Plantilla de jose---------
Insert into Plantilla values('000346','Calle 17 AV Jorge Mero','Enero',105,'0007865m3','Efectivo','12/10/2020','13/11/2020','no pagado','0038'); 


--plantilla de maria--------
Insert into Plantilla values('012300','Calle 15 AV 20','Enero',205,'0345680m3','Efectivo','03/04/2020','01/05/2020','no pagado','0237');





create table Rgt_multa(
	codigo_multa varchar(6) primary key not null,
	meses_sin_actividad varchar(20),
	fecha_de_pago date,
	
	multa_codigo_pantilla varchar(10),
	CONSTRAINT rgt_multa_fk FOREIGN KEY (multa_codigo_pantilla) REFERENCES Plantilla (codigo_plantilla)
);


Insert into Rgt_multa values ('0022','1 mes','03/10/2020','000125');
Insert into Rgt_multa values ('0303','2 meses','15/05/2020','003589');
Insert into Rgt_multa values('0076','15 dias','31/10/2020','000346');
Insert into Rgt_multa values('5680','2 dias','30/05/2020','012300');

Create table Inspector (
	codigo_inspector varchar(6) primary key not null,
	nombre_inspector varchar(15),
	fecha_lectura date not null, 
	lectura_anterior date not null,
	consumo_lectura varchar(9),
	
	inspector_codigo_medidor varchar(6),
	CONSTRAINT inspector_codigo_fk FOREIGN KEY (inspector_codigo_medidor) REFERENCES Medidor (codigo_medidor)

);


Insert into Inspector values ('097478','Manuel Tomala','3/11/2020','4/10/2020','0000098m3','0078');


Insert into Inspector values ('004567','Victor Perez','19/06/2020','22/07/2020','0000024m3','0234');


Insert into Inspector values ('000247','Selena Cedeño','22/01/2020','24/02/2020','0000034m3','0039');

create table Medidor_inspector_Agua(
	
	med_inspector_codigo_inspector varchar(6),
	med_inspector_codigo_medidor varchar(10),
	fecha_registro_lectura date,
	
CONSTRAINT inspector_fk FOREIGN KEY (med_inspector_codigo_inspector) REFERENCES Inspector (codigo_inspector),
CONSTRAINT medidor_fk FOREIGN KEY (med_inspector_codigo_medidor) REFERENCES Medidor (codigo_medidor)
);

Insert into Medidor_inspector_Agua values ('097478','0045','15/05/2020');
Insert into Medidor_inspector_Agua values ('004567','0097','01/01/2020');
Insert into Medidor_inspector_Agua values ('000247','0038','29/12/2020');
Insert into Medidor_inspector_Agua values ('097478','0237','12/03/2020');
Insert into Medidor_inspector_Agua values ('004567','0234','14/05/2020');
Insert into Medidor_inspector_Agua values ('000247','0567','23/06/2020');
Insert into Medidor_inspector_Agua values ('004567','0706','22/07/2020');
Insert into Medidor_inspector_Agua values ('004567','0706','24/07/2020');


------------------------------------Consulta---------------------------------------------------
-------MOSTRAR CANTIDAD DE CORTE QUE HA HECHO CADA INSPECTOR DE AGUA.--------------------------

select 
Medidor.lectura_de_medidor as Lectura,
Plantilla.fch_corte as fecha_de_corte,
Inspector.nombre_inspector as Inspector,
count(Plantilla.valor_a_pagar) as Cantidad_de_corte

from Medidor Inner join Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join Inspector on  Medidor.codigo_medidor = inspector_codigo_medidor

where Plantilla.estado='no pagado'

group by 
Medidor.lectura_de_medidor,
Plantilla.fch_corte,
Inspector.nombre_inspector;

--- Muestra con la persona
/*
select
 
Cliente.cliente_nombre as Cliente,
Medidor.lectura_de_medidor as Lectura,
Plantilla.fch_corte as fecha_de_corte,
Inspector.nombre_inspector as Inspector,
count(Plantilla.valor_a_pagar) as Cantidad_de_corte

from  Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join Inspector on  Medidor.codigo_medidor = inspector_codigo_medidor

where Plantilla.estado='no pagado'

group by 
Cliente.cliente_nombre,
Medidor.lectura_de_medidor,
Plantilla.fch_corte,
Inspector.nombre_inspector;


*/


-------MOSTRAR LA CANTIDAD DE CORTE POR COMUNIDAD QUE SE HA OBTENIDO EN UN MES DETERMINADO.----

select 
Medidor.codigo_medidor as Medidor,
Plantilla.fch_corte as Fecha_de_corte,
Plantilla.mes as Mes,
comunidad.comunidad as Comunidad,
Cliente.cliente_nombre AS Cliente,
count(Plantilla.estado) as cantidad_de_no_pagado

from  Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join comunidad on comunidad_codigo_cliente= cliente.cliente_codigo

where  Plantilla.estado='no pagado' or Plantilla.mes='Enero'

group by
Medidor.codigo_medidor,
comunidad.comunidad ,
Plantilla.fch_corte,
Plantilla.mes,
Cliente.cliente_nombre;



------MOSTRAR  EL VALOR A PAGAR DE LOS CLIENTES POR COMUNIDAD MAYORES A 100.------------

select 
Cliente.cliente_nombre ,
Medidor.codigo_medidor ,
comunidad.comunidad,
Plantilla.valor_a_pagar 

from  Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join comunidad on comunidad_codigo_cliente= cliente.cliente_codigo

where Plantilla.valor_a_pagar >= 100;




-----MOSTRAR EN ORDEN DESCENDENTES EL NOMBRE DE LOS CLIENTES JUNTO A LA LECTURA ACTUAL.--------

SELECT

Cliente.cliente_nombre as nombre,
Medidor.codigo_medidor as Medidor,
Medidor_inspector_Agua.fecha_registro_lectura as fecha_registrada_de_lectura
Plantilla.milimetros as lectura_actual

from  Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join Medidor_inspector_Agua on med_inspector_codigo_medidor =  
order by  nombre desc



------Consulta que nos muestre los clientes con el numero de plantillas mayores a 20

select 
Cliente.cliente_nombre ,
count(Plantilla.codigo_plantilla),
Plantilla.valor_a_pagar 

from  Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor


where Plantilla.valor_a_pagar >=40

group by
Cliente.cliente_nombre ,
Plantilla.valor_a_pagar;
