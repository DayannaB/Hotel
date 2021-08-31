--Trigger que impida asignar un servicio a un empleado que este contratado solo por horas
create or replace function asignarservicio() returns trigger
as $asignarservicio$
    declare
		tipo varchar(50);
begin
		select tipoempleado into tipo from empleado WHERE idempleado = new.idempleado;
        if(tipo = 'Por Horas') then
            raise exception 'Este empleado esta contratado solo por horas y no se le puede asignar a un servicio';
        end if;
        return new;
end;
$asignarservicio$
language plpgsql;

create trigger asignarservicioTrigger before insert
on servicios for each row
execute procedure asignarservicio();