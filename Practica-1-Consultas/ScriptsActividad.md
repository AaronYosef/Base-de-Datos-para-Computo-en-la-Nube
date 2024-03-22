# ***Mostrar bases de datos y usar una base de datos***
## Estos comandos muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.
* show dbs; 
* use practica1;

# ***Crear y mostrar colecciones***
## Estos comandos crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.
* db.createCollection("facturas");
* show collections;

# ***Insertar documentos en una colección***
## Este comando intenta insertar un documento vacío en la colección "productos".
* db.productos.insertOne();

# ***Borrar documentos en una colección***
## Este comando intenta borrar un documento de la colección "productos".
* db.productos.deleteOne();

# ***Mostrar documentos en una colección***
## Este comando muestra todos los documentos en la colección "facturas".
* db.facturas.find();

# ***Consultas en la colección de empleados***
## Estos comandos realizan consultas específicas en la colección "empleados".
## Este comando devuelve todos los documentos en la colección "empleados".
* db.empleados.find();
## Busca todos los documentos donde el campo "empresa" sea igual a "Google".
* db.empleados.find({"empresa":{$eq:"Google"}});
## Busca todos los documentos donde el campo "pais" sea igual a "Perú".
* db.empleados.find({"pais": {$eq: "Peru"}});
##  Devuelve todos los documentos donde el campo "salario" sea mayor que 8000.
* db.empleados.find({"salario": {$gt:8000}});
## Devuelve todos los documentos donde el campo "ventas" sea menor que 10000.
* db.empleados.find({"ventas": {$lt:10000}});
## Devuelve el primer documento que cumpla la condición de que "ventas" sea menor que 10000.
* db.empleados.findOne({"ventas": {$lt:10000}});
## Devuelve todos los documentos donde el campo "empresa" sea "Google" o "Yahoo".
* db.empleados.find({$or:[{"empresa": "Google"}, {"empresa": "Yahoo"}]});
##  Similar al anterior, busca documentos donde el campo "empresa" esté dentro de una lista que contiene "Google" o "Yahoo".
* db.empleados.find({“empresa": {$in:["Google",”Yahoo"]}});
## Busca documentos donde la "empresa" sea "Amazon" y el "salario" sea mayor que 9000.
* db.empleados.find({$and:[{"empresa":{$eq:"Amazon"}},{"salario":{$gt:9000}}]});
## Realiza una consulta más compleja, buscando documentos donde la empresa sea "Yahoo" y el salario sea mayor que 6000, o donde la empresa sea "Google" y las ventas sean menores que 20000.
* db.empleados.find({$or: [{$and: [{empresa: "Yahoo"}, {salario: {$gt:6000}}]},{$and:[{empresa: "Google"}, {ventas: {$lt:20000}}]}]});
##  Devuelve todos los documentos, pero solo incluye los campos "nombre", "apellidos" y "pais", excluyendo el campo "_id".
* db.empleados.find({},{_id:0,nombre:1, apellidos:1,pais:1});
