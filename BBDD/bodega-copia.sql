create database proyectoVenta1
go
set language  'spanish'

use proyectoVenta1
go


create table roles(
idrol char(8) primary key,
nombrerol varchar(20) not null,
estado bit default 1);
go
create table sexo(
idsexo int primary key identity,
nombresex varchar(20)
)
go
create table usuario(
idusuario char(8) primary key,
nusauario varchar(20) not null,
contra varchar(25) not null,
estado bit default 1,
nombrepr varchar(30) not null,
nombresec varchar(30),
apellidop varchar(30),
apellidom varchar(30),
correo varchar(40) not null,
fechnac date not null,
sexo int references sexo,
fechaing date default getdate(),
idrol char(8) references roles,
)
go


create table departamento(
iddepartamento char(2) primary key,
nombredep varchar(30)
)
go
create table provincia(
idprovincia char(4) primary key,
nombrepro varchar(30),
iddepartamento char(2) references departamento
)
go

create table distrito(
iddistrito char(6) primary key,
nombredis varchar(45),
idprovincia char(4) references provincia,
iddepartamento char(2) references departamento,

)
go

create table domicilio(
iddomicilio char(8) primary key,
idusuario char(8) references usuario,
calle_ave_jir varchar(30),
iddepartamento char(2) references departamento,
idprovincia char(4) references provincia,
iddistrito char(6) references distrito,
indicaciones varchar(120),
numeroint varchar(30),
codpostal varchar(30),

)
go

create table catproducto(
idcatprod char(8) primary key,
nombrecat varchar(50)
)
go

create table productos(
idprod char(8) primary key,
nombreprod varchar(40) not null,
descripcion varchar(70) default 'No hay descripción disponible',
costouni money not null,
stock int default 0,
fechaing date default getdate(),
fechacad date not null,
rutaimg varchar(100) default 'no hay imagen disponible',
estado bit default 1,
idcatprod char(8) references catproducto
)
go
create table carrito(
idcarrito char(8) primary key,
idproducto char(8) references productos,
idusuario char(8) references usuario,
cantidad int default 1
)
go
create table tipopago(
idtipago char(8) primary key,
nombrepago varchar(30)
)

create table orden(
idorden char(8) primary key,
idtipago char(8) references tipopago,
total money,
iddomicilio char(8) references domicilio

)
go

create table detalleorden(
iddetalle char(8) primary key,
idorden char(8) references orden,
idproducto char(8) references productos,
cantidad int default 0,
precio money
)
go


--inserts
--Distritos, departamento, provincia (a través de csv)
select *  from departamento --ok
select *  from provincia --ok
select *  from distrito --ok
go

--procedimientos
--ROLES
--creacion de roles
create or alter procedure sp_crear_rol
(@nombrerol varchar(30),
@estado bit
)
as 
begin
	declare @codigo char(8);
	declare @ultimocod int;
	select @ultimocod=RIGHT(max(idrol),5)+1 from roles
	if @ultimocod is null
		begin
			set @ultimocod=1
		end
set @codigo=CONCAT('ro',RIGHT(concat('00000000',@ultimocod),6));
insert into roles(idrol,nombrerol,estado) values(@codigo,@nombrerol,@estado)
end
go

execute sp_crear_rol 'Administrador',1

select*from roles
go

--eliminar rol
create or alter procedure sp_eliminar_rol
(@idrol char(8))
as
begin
update roles set estado=0 where idrol=@idrol
end
go
--USUARIO
--crear usuario
create or alter procedure sp_nuevo_usuario
(@nusuario varchar(20),@contra varchar(25),@nombrepr varchar(30),@nombresec varchar(30),
@apellidp varchar(30),@apellidom varchar(30),@correo varchar(40),@fechanac date,@sexo int,@idrol char(8))
as
begin
	declare @codigo char(8);
	declare @ultimocod int;
	select @ultimocod=RIGHT(max(idrol),5)+1 from usuario
	if @ultimocod is null
		begin
			set @ultimocod=1
		end
set @codigo=CONCAT('us',RIGHT(concat('00000000',@ultimocod),6));
insert into usuario(idusuario,nusauario,contra,nombrepr,nombresec,apellidop,apellidom,correo,fechnac,sexo,fechaing,idrol) 
values(@codigo,@nusuario,@contra,@nombrepr,@nombresec,@apellidp,@apellidom,@correo,@fechanac,@sexo,GETDATE(),@idrol)
end
go
--eliminar usuario
create or alter procedure sp_eliminar_usuario(@idusuario char(8))
as begin
update usuario set estado=0 where idusuario=@idusuario
end
go
--leer usuarios
create or alter procedure sp_leer_usuarios
as
select *from usuario
go

execute sp_leer_usuarios
go
--actualizar usuario
create or alter procedure sp_actualizar_usuario
(@idusuario char(8),@nusuario varchar(20),@contra varchar(25),@nombrepr varchar(30),@nombresec varchar(30),
@apellidp varchar(30),@apellidom varchar(30),@correo varchar(40),@fechanac date,@sexo int,@idrol char(8))
as
begin
update usuario set nusauario=@nusuario,contra=@contra,nombrepr=@nombrepr,nombresec=@nombresec,
apellidop=@apellidp,apellidom=@apellidom,correo=@correo,fechnac=@fechanac,sexo=@sexo,fechaing=fechaing
where idusuario=@idusuario
end
go

--DOMICILIO
--crear domicilio
create or alter procedure sp_crear_domicilio
(@idusuario char(8),@calle varchar(30),@iddepartamento char(2),@idprovincia char(4),@iddistrito char(6),@indicaciones varchar(120),@numeroint varchar(30),@codpostal varchar(30))
as
begin
	declare @codigo char(8);
	declare @ultimocod int;
	select @ultimocod=RIGHT(max(iddomicilio),5)+1 from domicilio
	if @ultimocod is null
		begin
			set @ultimocod=1
		end
set @codigo=CONCAT('do',RIGHT(concat('00000000',@ultimocod),6));
insert into domicilio(iddomicilio,idusuario,calle_ave_jir,iddepartamento,idprovincia,iddistrito,indicaciones,numeroint,codpostal) 
values(@codigo,@idusuario,@calle,@iddepartamento,@idprovincia,@iddistrito,@indicaciones,@numeroint,@codpostal)
end
go
--leer domicilio
create or alter procedure sp_leer_domicilio
as select *from domicilio
go

--actualizar domicilio
create or alter procedure sp_actualizar_domicilio
(@iddomicilio char(8),@idusuario char(8),@calle varchar(30),@iddepartamento char(2),@idprovincia char(4),@iddistrito char(6),@indicaciones varchar(120),@numeroint varchar(30),@codpostal varchar(30))
as 
begin
update domicilio set idusuario=@idusuario,calle_ave_jir=@calle,iddepartamento=@iddepartamento,
idprovincia=@idprovincia,iddistrito=@iddistrito,indicaciones=@indicaciones,numeroint=@numeroint,
codpostal=@codpostal where iddomicilio=@iddomicilio
end
go

create or alter procedure sp_eliminar_domicilio
(@iddomicilio char(8))
as delete from domicilio where iddomicilio=@iddomicilio
go

--PRODUCTOS--
--categoria de productos
--ingresar categorias
create or alter procedure sp_crear_catpro
(@nombrecat varchar(50))
as
begin
	declare @codigo char(8);
	declare @ultimocod int;
	select @ultimocod=RIGHT(max(nombrecat),5)+1 from catproducto
	if @ultimocod is null
		begin
			set @ultimocod=1
		end
set @codigo=CONCAT('cp',RIGHT(concat('00000000',@ultimocod),6));
insert into catproducto(idcatprod,nombrecat) 
values(@codigo,@nombrecat)
end
go
--leer categorias de producto
create or alter procedure sp_leer_catpro
as select *from catproducto
go

--actualizar categoria
create or alter procedure sp_actualizar_catpro(@idcatpro char(8),@nombrecat varchar(50))
as update catproducto set nombrecat=@nombrecat where idcatprod=@idcatpro
go

--eliminar categoria prod
create or alter procedure sp_eliminar_catpro(@idcatpro char(8))
as delete from catproducto where idcatprod=@idcatpro
go

--productos
--crear producto
create or alter procedure sp_crear_pro
(@nombreprod varchar(40),@descripcion varchar(70),@costouni money,@stock int,@fechaing date,@fechacad date,@rutaimg varchar(100),@estado bit,@idcatprod varchar(50))
as
begin
	declare @codigo char(8);
	declare @ultimocod int;
	select @ultimocod=RIGHT(max(idprod),5)+1 from productos
	if @ultimocod is null
		begin
			set @ultimocod=1
		end
set @codigo=CONCAT('pr',RIGHT(concat('00000000',@ultimocod),6));
insert into productos(idprod,nombreprod,descripcion,costouni,stock,fechaing,fechacad,rutaimg,estado,idcatprod) 
values(@codigo,@nombreprod,@descripcion,@costouni,@stock,@fechaing,@fechacad,@rutaimg,@estado,@idcatprod)
end
go
--leer productos
create or alter procedure sp_leer_productos
as select *from productos
go

execute sp_crear_catpro 'limpieza'
go
execute sp_crear_pro'Lejia clorox 50mml','Producto para ropa blanca',4.5,10,'05/30/2024','12/30/2024'
,'clorox.jpg',1,'cp000001'
go
select *from catproducto
select *from productos
/*select COLUMN_NAME
  from INFORMATION_SCHEMA.COLUMNS
 where TABLE_SCHEMA = 'dbo'
   and TABLE_NAME = 'productos'
 order by ORDINAL_POSITION*/
