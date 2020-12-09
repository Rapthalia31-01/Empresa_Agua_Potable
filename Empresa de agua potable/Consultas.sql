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
