--Cursor que enliste todos los huespedes y cuantas estancias tienen registradas.
do $$
declare
        tabla record;
        listado cursor for select nombrehuesped, count( e1.idalojamiento ) as cantidad
									from huesped as h1
									inner join estancia as e1 on h1.idhuesped = e1.idhuesped
									inner join habitacion as h2 on e1.idalojamiento = h2.idalojamiento
									group by nombrehuesped
									order by cantidad desc;							
begin
for tabla in listado loop
Raise notice 'Nombre del huesped: % | Numero de estancias registradas:  %', tabla.nombrehuesped, 
tabla.cantidad;
end loop;
end $$
language 'plpgsql';