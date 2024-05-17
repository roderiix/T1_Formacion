use t1_formacion;
drop table if exists cuentas;
create table cuentas (
    Usuarios varchar(25) primary key not null unique,
    Contraseña varchar(25)  not null
);

drop table if exists datos;

create table datos (
    Nombre_Apellido varchar(50) not null,
    Usuarios varchar(25) primary key not null unique,
    Fecha_registro date,
    Ultima_conexion datetime

);

drop table if exists R_ingresos;

create table R_ingresos (
    Numeracion int auto_increment primary key,
    Usuarios varchar(25)  not null,
    Fecha_Hora datetime
);

drop view vista;
create view vista as 
select d.Usuarios, date(d.Ultima_conexion) as Ult, d.Fecha_registro, substring_index(d.Nombre_Apellido, ' ', 1)as Nombre, r.Numeracion, r.Fecha_Hora 
from datos as d, (select Usuarios, max(Fecha_Hora) as Fh from r_ingresos group by Usuarios) as ri, R_ingresos as r
where d.Usuarios=ri.Usuarios  and r.Fecha_Hora=ri.Fh;

drop procedure registrar_d;
delimiter //
create procedure registrar_d(in usuario varchar(25), in Nombre_Apellido varchar(50), in Contraseña varchar(25) )
begin

    Insert into R_ingresos(Usuarios,Fecha_Hora)
    values (usuario,now());

    Insert into datos(Nombre_Apellido,Usuarios,Fecha_registro,Ultima_conexion)
    values (Nombre_Apellido,usuario,now(),now());

    Insert into cuentas(Usuarios,Contraseña)
    values (usuario,Contraseña);

end //
delimiter ;
drop procedure reg;
delimiter //
create procedure reg(in usuario varchar(25))
begin

    Insert into r_ingresos(Usuarios,Fecha_Hora)
    values (usuario,now());

end //
delimiter ;

drop table rup;
create table rup(
	Numeracion int auto_increment primary key,
    Usuarios varchar(25),
    Fecha_Hora datetime
);

drop trigger registrar_i;
DELIMITER //

CREATE TRIGGER registrar_i 
AFTER INSERT ON rup
FOR EACH ROW
BEGIN
    INSERT INTO r_registros (Usuarios, Fecha_Hora)
    VALUES (NEW.Usuarios, NOW());
END //

DELIMITER ;

drop procedure death;
delimiter //
create procedure death(in usuario varchar(25))
begin
	delete from vista where Usuarios = usuario;
    delete from cuentas where Usuarios = usuario;
    delete from r_registros where Usuarios = usuario;

end //
delimiter ;

select * from cuentas ;
select * from r_ingresos;
select * from datos;
select * from vista;
