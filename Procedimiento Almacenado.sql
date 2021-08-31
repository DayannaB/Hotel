CREATE or replace  FUNCTION habitaciones(varchar)	RETURNS varchar
AS $BODY$
DECLARE
	nombre alias for $1;
	datos_reg RECORD;	
	datos cursor for select numerohabitacion as numero,  tipohabitacion as tipo
						from huesped as h1
						inner join estancia as e1 on h1.idhuesped = e1.idhuesped
						inner join habitacion as h2 on e1.idalojamiento = h2.idalojamiento
						where nombrehuesped = $1;		
begin
	for datos_reg in datos loop
	Raise notice 'Número de habitación: %, Tipo de habitación: %', datos_reg.numero, datos_reg.tipo;
	end loop;
end; $BODY$
language 'plpgsql';

--selects de comprobacion del procedimiento almacenado

select habitaciones('Ferdinanda Thwaites');

select habitaciones('Blane Hurne');

select nombrehuesped from huesped;