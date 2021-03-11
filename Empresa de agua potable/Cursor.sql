--------------------------------------------Cursor--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------Se desea crear un cursor que nos permita guardar la consulta de las plantillas del cliente -----
----------------------a pagar por mes  y el plazo que tiene para pagar.-----------------------------------------------
----------------------------------------------------------------------------------------------------------------------


do $$
	declare
		registro Record;
		Cur_pantilla Cursor for select * from "plantilla" order by "plantilla_codigo_cliente";
	begin
		while(FOUND)loop
		open Cur_pantilla;
		fetch Cur_pantilla into registro;
		Raise Notice 'Codigo plantilla: %, Mes: %, valor a pagar: %, Fecha limite: %, Estado: %',registro.codigo_plantilla, registro.mes, registro.valor_a_pagar, registro.fch_limite_pago,registro.estado;
		fetch Cur_pantilla into registro;
		end loop;
end $$
language 'plpgsql';

---plantilla de jared-------
Insert into Plantilla values('000125','Calle 20 AV 18','Enero',200,'0000024','m3','Efectivo','23/09/2020','27/09/2020','no pagado','0234'); 




