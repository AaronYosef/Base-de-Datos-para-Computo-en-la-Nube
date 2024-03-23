# ***Mostrar bases de datos y usar una base de datos***
## Estos comandos muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.
``` mongosh
* show dbs; 
* use practica1;
``` 
### Resultado:
![Imagen 1](imagenes/Cap1.png)

# ***Crear y mostrar colecciones***
## Estos comandos crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.
``` mongosh
* db.createCollection("facturas");
* show collections;
``` 
### Resultado:
![Imagen 2](imagenes/Cap2.png)
# ***Insertar documentos en una colección***
## Este comando intenta insertar un documento vacío en la colección "productos".
``` mongosh
* db.productos.insertOne();
``` 
### Resultado:
![Imagen 3](imagenes/Cap3.png)
# ***Borrar documentos en una colección***
## Este comando intenta borrar un documento de la colección "productos".
``` mongosh
* db.productos.deleteOne();
``` 
### Resultado:
![Imagen 4](imagenes/Cap4.png)
# ***Mostrar documentos en una colección***
## Este comando muestra todos los documentos en la colección "facturas".
``` mongosh
* db.facturas.find();
``` 
### Resultado:
![Imagen 5](imagenes/Cap5.png)
# ***Consultas en la colección de empleados***
## Estos comandos realizan consultas específicas en la colección "empleados".
## Este comando devuelve todos los documentos en la colección "empleados".
``` mongosh
* db.empleados.find();
``` 
### Resultado:
![Imagen 6](imagenes/Cap6.png)
## Busca todos los documentos donde el campo "empresa" sea igual a "Google".
``` mongosh
* db.empleados.find({"empresa":{$eq:"Google"}});
``` 
### Resultado:
![Imagen 7](imagenes/Cap7.png)
## Busca todos los documentos donde el campo "pais" sea igual a "Perú".
``` mongosh
* db.empleados.find({"pais": {$eq: "Peru"}});
``` 
### Resultado:
![Imagen 8](imagenes/Cap8.png)
##  Devuelve todos los documentos donde el campo "salario" sea mayor que 8000.
``` mongosh
* db.empleados.find({"salario": {$gt:8000}});
``` 
### Resultado:
![Imagen 9](imagenes/Cap9.png)
## Devuelve todos los documentos donde el campo "ventas" sea menor que 10000.
``` mongosh
* db.empleados.find({"ventas": {$lt:10000}});
``` 
### Resultado:
![Imagen 10](imagenes/Cap10.png)
## Devuelve el primer documento que cumpla la condición de que "ventas" sea menor que 10000.
``` mongosh
* db.empleados.findOne({"ventas": {$lt:10000}});
``` 
### Resultado:
![Imagen 11](imagenes/Cap11.png)
## Devuelve todos los documentos donde el campo "empresa" sea "Google" o "Yahoo".
``` mongosh
* db.empleados.find({$or:[{"empresa": "Google"}, {"empresa": "Yahoo"}]});
```
### Resultado:
![Imagen 12](imagenes/Cap12.png)
##  Similar al anterior, busca documentos donde el campo "empresa" esté dentro de una lista que contiene "Google" o "Yahoo".
``` mongosh
* db.empleados.find({“empresa": {$in:["Google",”Yahoo"]}});
``` 
### Resultado:
![Imagen 13](imagenes/Cap13.png)
## Busca documentos donde la "empresa" sea "Amazon" y el "salario" sea mayor que 9000.
``` mongosh
* db.empleados.find({$and:[{"empresa":{$eq:"Amazon"}},{"salario":{$gt:9000}}]});
``` 
### Resultado:
![Imagen 14](imagenes/Cap14.png)
## Realiza una consulta más compleja, buscando documentos donde la empresa sea "Yahoo" y el salario sea mayor que 6000, o donde la empresa sea "Google" y las ventas sean menores que 20000.
``` mongosh
* db.empleados.find({$or: [{$and: [{empresa: "Yahoo"}, {salario: {$gt:6000}}]},{$and:[{empresa: "Google"}, {ventas: {$lt:20000}}]}]});
``` 
### Resultado:
![Imagen 15](imagenes/Cap15.png)
##  Devuelve todos los documentos, pero solo incluye los campos "nombre", "apellidos" y "pais", excluyendo el campo "_id".
``` mongosh
* db.empleados.find({},{_id:0,nombre:1, apellidos:1,pais:1});
```
### Resultado:
![Imagen 16](imagenes/Cap16.png)