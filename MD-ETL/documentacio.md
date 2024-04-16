# DOCUMENTACION
UTILIZAMOS LAS BD DE Norhwind :
```
Create database datamartventas;
use datamartventas;

--hacer la primera dimension de estrella
--a dim  productos se le va a poner skproductio () y bkproducto (business key es el id del producto)
 drop table Employees;
CREATE TABLE [dbo].[DimProducts](
	skProductoId int not null identity(1,1) primary key,
	[ProductID] [int]  NOT NULL,
	[ProductName] [varchar](40) NULL,
	[categoryname] nvarchar(15) not null,
	[UnitinStock] [smallint] NULL,
)
go

CREATE TABLE [dbo].[DimEmployees](
	SkEmployeeId int not null identity(1,1) primary key,
	[EmployeeID] [int]  NOT NULL,
	FullName nvarchar(50) not null,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL
	)

CREATE TABLE [dbo].[DimCliente](
	SkCustomerId int not null identity(1,1) primary key,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	)

CREATE TABLE [dbo].[DimProveedor](
	SkSupplierId int not null identity(1,1) primary key,
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	)

CREATE TABLE [dbo].[DimTiempo](
	SkTimeId int not null identity(1,1) primary key,
	TimeFecha date not null,
	TimeAño int not null,
	TimeTrimestre int not null,
	TimeMes int not null,
	TimeDescripcionMes nvarchar(20) not null,
	TimeDescripcionTrimestre nvarchar(20) not null,
	)

CREATE TABLE  factVentas(
sk_Cliente int not null,
sk_Proveedor int not null,
sk_Producto int not null,
sk_Empleado int not null,
sk_timeid int not null,
precioVenta money not null,
cantidadUnidades int not null,
importe money not null

constraint pk_fact_ventas primary key(sk_Cliente,sk_Proveedor,sk_Producto,sk_Empleado,sk_TimeId),
constraint fk_fact_cliente foreign key (sk_Cliente) references DimCliente,
constraint fk_fact_proveedor foreign key (sk_Proveedor) references DimProveedor,
constraint fk_fact_producto foreign key (sk_Producto) references DimProducts,
constraint fk_fact_empleado foreign key (sk_Empleado) references DimEmployees,
constraint fk_fact_timeid foreign key (sk_TimeId) references DimTiempo,
)

	select year(getdate())
	select quarter(getdate())

insert into datamartventas.dbo.DimProducts
select p.productId, p.productName,c.CategoryName,p.UnitsInStock 
from Northwind.dbo.Products as p
inner join (select categoryId,categoryname from northwind.dbo.Categories) as c
on p.CategoryID=c.CategoryID



insert into datamartventas.dbo.DimCliente
select CustomerID,CompanyName,Address,City,case when Region is null then 'sin región' else Region end as Region,Country from Northwind.dbo.Customers

drop table factVentas2
CREATE TABLE  factVentas2(
sk_Cliente int not null identity(1,1) primary key,
precioVenta money not null,
cantidadUnidades int not null,
importe money not null
)

select UnitPrice,Quantity, (UnitPrice*Quantity)as importe from Northwind.dbo.[Order Details] 

```
### EL DIAGRAMA SE VISUALIZARA DE LA SIGUIENTE MANERA 

![alt text](img/image-1.png);

# SE LLENA EL DATAWERHAOSE MEDIANTE UN ETL EN SSIS
Esta es la arquitectura:
Del lado izquierdo esta la entrada  de Northwind y del lado derecho esta la entrada de la dim product
en medio hace el analisis en caso de que se encuentren nuevos datos , pasa a la salida  de DIMProductos:

![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.14.40_c2313cca.jpg>)

Hace la coneccion a notwind  y ingresamos el select como se muestra en la  imagen:
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.16.13_9ef4c44c.jpg>)

Es la coneccion al modelo dimenciones (dim prodructos):
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.17.16_14507685.jpg>)
Se muestra la salida  de la tabla (dimproductos)
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.19.21_49008abb.jpg>)

###clientes

Se muestra el comportamiento del flujo :
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.09.04_3af1d0d3.jpg>)
 imagen2.Entrada de Northwind
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.08.37_92b907a8.jpg>)
imagen3.Se muestra la entrada de datamark venta 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.10.17_34d60f5c.jpg>)
imagen4. salida de de las dos bases de datos 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.10.17_46692281.jpg>)

###Proveedores
esquema  de provedores 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.26.35_f9e6e8c7.jpg>)
imagen1.Entrada de la base de datos 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.27.02_aebfc3c0.jpg>)
imgen2.Datos dimProveedor
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.27.41_265b53aa.jpg>)
imgen 3.salida para guardar los datos en la tabla
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.29.11_2d4a5a12.jpg>)

###General de Employed
empleados:
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.30.40_cc1935ae.jpg>)

ingreso de datos de la conexión con northwnd
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.31.42_422e0ed8.jpg>)

![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.33.45_bc489c75.jpg>)


el ingreso de la tabla empleados

![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.33.45_7e44c409.jpg>)

salida de datos nuevos, del proceso de empleados

![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.35.15_4f29a535.jpg>)

# CONTADOR DE SECUENCIA



solo modulariza
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.36.34_bc6408e0.jpg>)

## CONTENEDOR DE SECUENCIA 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.37.52_71c9146f.jpg>)

FLUJO FINAL :
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.41.17_c1ad9753.jpg>)
 PARTE 1:
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.42.25_33d65a0f.jpg>)
 PARTE 2:
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.42.52_b3dec2b8.jpg>)
 PARTE 4:
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.43.26_d0259d32.jpg>)
se hace la implementacion 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.45.38_2ae10d9d.jpg>)

 
 # AUTOMATIZACION EN UN JOB DE SQLSERVER
realizamos la siguiente configuracion 
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.48.56_5eab3b2a.jpg>)
 Aceptamos las siguientes configuraciones como se muestran las imagenes :
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.49.22_50dd6c0a.jpg>)
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.50.50_2d952e98.jpg>)

 damos aceptar
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.52.21_8e94803f.jpg>)
 damos next

 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.53.02_da334080.jpg>)
 escoger implementar
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.53.46_5855dc51.jpg>)

 se a implementado correctamente
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.54.22_483164dc.jpg>)
hubicamos  la carpeta de integration services, hubicamos la carpeta llenar 2 que es como la llamamos, abrimos la carpeta abrimos proyecto abrimos paquetes, y hubicamos llenada-DW
![alt text](<Imagen de WhatsApp 2024-04-15 a las 15.59.42_5ad07f8b.jpg>)
seleccionamos  y ejecutamos
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.00.23_23110169.jpg>)

seleccionmos OK
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.02.02_b931096e.jpg>)
seleccionamos si
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.05.06_8855794e.jpg>)

resultaado

![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.06.44_abe72a05.jpg>)

reporte
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.07.55_75f38840.jpg>)
reporte lleno 
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.09.18_9321a8da.jpg>)
 
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.10.35_2fdedf50.jpg>)
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.10.35_840f0574.jpg>)
 
 Colocamos el nombre del jop 
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.11.41_6d23873e.jpg>)
 
 pasamos a Steps y seleccionamos new steps

 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.14.28_fb4f45cc.jpg>)

 colocamos nombre y cambiamos a integration services

 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.16.17_f7b5a9c0.jpg>)

 entranos en la carpeta, seleccionamos la carpeta que hicimos, y seleccionamos la que es del llenado

 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.18.21_02559f2b.jpg>)

 damos ok
 ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.18.48_103baf3a.jpg>)

 seleccionamos ok 
  ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.19.35_3ce5aebd.jpg>)

  seleccionamos schedules

  ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.19.58_274e5b95.jpg>)
  aquí modificamos los días que quiero que se generen nuestros reportes
  ![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.21.58_70c26cde.jpg>)
una vez hecho solo ejecutamos lo siguiente
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.23.04_27301874.jpg>)

carga
![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.23.28_9dd73431.jpg>)

visualizacion final 

![alt text](<Imagen de WhatsApp 2024-04-15 a las 16.23.59_695d1cb0-1.jpg>)
