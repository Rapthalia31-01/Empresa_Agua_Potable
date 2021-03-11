
-------------------Consulta para reporte------------------------------

select 

Plantilla.mes as Mes,
cliente.cliente_codigo as Codigo_cliente,
cliente.cliente_nombre  || cliente.cliente_apellido as Datos_de_beneficiario,
cliente.cliente_cedula_identidad as Cedula,
cliente.cliente_direccion as Dirección,
comunidad.comunidad as Sector_perteneciente,
Medidor.codigo_medidor as Codigo_Medidor,
Medidor_inspector_Agua.fecha_registro_lectura,
Plantilla.fch_limite_pago as Fecha_limite_pago,
Plantilla.valor_a_pagar as Pago

from Cliente Inner join Medidor on medidor_codigo_cliente= Cliente.cliente_codigo
inner join  Plantilla ON plantilla_codigo_medidor= Medidor.codigo_medidor
inner join comunidad on comunidad_codigo_cliente= cliente.cliente_codigo
inner join Medidor_inspector_Agua on med_inspector_codigo_medidor =  Medidor.codigo_medidor

where cliente.cliente_codigo = '21227';