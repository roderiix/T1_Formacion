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
    Usuarios varchar(25) not null,
    Fecha_Hora datetime
);
Insert into datos(Nombre_Apellido,Usuarios,Fecha_registro,Ultima_conexion) 
values ('joseph Fry','Fry3318',curdate(),now());

Insert into R_ingresos(Usuarios,Fecha_Hora)
values ('Fry3318',now());

drop view vista;
create view vista as 
select d.Usuarios, date(d.Ultima_conexion), d.Fecha_registro, substring_index(d.Nombre_Apellido, ' ', 1) as Nombre, r.Numeracion, r.Fecha_Hora 
from datos as d, (select Usuarios, max(Fecha_Hora) as Fh from r_ingresos group by Usuarios) as ri, R_ingresos as r
 where d.Usuarios=ri.Usuarios  and r.Fecha_Hora=ri.Fh;
select * from vista;

delimiter //
create procedure registrar_i(in usuario varchar(25))
begin 
Insert into R_ingresos(Usuarios,Fecha_Hora)
values (usuario,now());


end //
delimiter ;

call registrar_i ('Fry3318');
select * from R_ingresos;
select * from vista;