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
values ('Py Fry','Fry3316',curdate(),now());

Insert into R_ingresos(Usuarios,Fecha_Hora)
values ('Fry3316',now());

drop view vista;
create view vista as 
select d.Usuarios, date(d.Ultima_conexion), d.Fecha_registro, substring_index(d.Nombre_Apellido, ' ', 1)as Nombre, r.Numeracion, r.Fecha_Hora 
from datos as d, (select Usuarios, max(Fecha_Hora) as Fh from r_ingresos group by Usuarios) as ri, R_ingresos as r
 where d.Usuarios=ri.Usuarios  and r.Fecha_Hora=ri.Fh;

create view vista as 
select d.Usuarios, date(d.Ultima_conexion) as Ultima_conexion, d.Fecha_registro, SUBSTRING_INDEX(d.Nombre_Apellido, ' ', 1) as Primer_Nombre, r.Numeracion, r.Fecha_Hora 
from datos as d
inner join (select Usuarios, max(Fecha_Hora) as Ultima_conexion from R_ingresos group by Usuarios) as ri on d.Usuarios = r_max.Usuarios
inner join R_ingresos as r on r.Usuarios = ri.Usuarios and r.Fecha_Hora = ri.Ultima_conexion;
select * from vista;

delimiter //
create procedure registrar_i(in usuario varchar(25))
begin 
Insert into R_ingresos(Usuarios,Fecha_Hora)
values (usuario,now());


end //
delimiter ;

call registrar_i ('Fry3313');
select * from R_ingresos;
select Nombre from vista;