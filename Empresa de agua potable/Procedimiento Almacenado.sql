---------------------------------------Procedimiento Almacenado---------------------------------------------
--procedimiento almacenado que permite saber cuantas veces se a hecho lectura de medidor en una comunidad---

CREATE OR REPLACE FUNCTION
      lect_medidores_comunidad( varchar(15)) 
      RETURNS bigint
	  as
	  $$	  
	  select count (codigo_medidor) from comunidad, cliente, Plantilla, Medidor 
	  where 
	  comunidad_codigo_cliente = cliente_codigo and
	  cliente_codigo = medidor_codigo_cliente and
	  plantilla_codigo_medidor = codigo_medidor and
	  comunidad = $1	  	  
	  $$
      LANGUAGE sql;