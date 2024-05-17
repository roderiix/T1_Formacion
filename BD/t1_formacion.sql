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
    Usuarios varchar(25)  not null unique,
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
call registrar_d('roderiix','rodrigo candia','asdasd');
select * from R_ingresos;
select * from vista;
select contraseña from cuentas;
select * from cuentas;
drop procedure registrar_i;
delimiter //
create procedure registrar_i(in usuario varchar(25) )
begin

    Insert into R_ingresos(Usuarios,Fecha_Hora)
    values (usuario,now());
end //
delimiter ;
call registrar_i ('roderiix');
select * from datos;