# ***Mostrar bases de datos y usar una base de datos***
## Estas líneas de código muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.
* show dbs; 
* use practica1;

# ***Crear y mostrar colecciones***
## Estas líneas de código crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.
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
## Estas líneas de código realizan consultas específicas en la colección "empleados".
* db.empleados.find();
* db.empleados.find({"empresa":{$eq:"Google"}});
* db.empleados.find({"pais": {$eq: "Peru"}});
* db.empleados.find({"salario": {$gt:8000}});
* db.empleados.find({"ventas": {$lt:10000}});
* db.empleados.findOne({"ventas": {$lt:10000}});
* db.empleados.find({$or:[{"empresa": "Google"}, {"empresa": "Yahoo"}]});
* db.empleados.find({“empresa": {$in:["Google",”Yahoo"]}});
* db.empleados.find({$and:[{"empresa":{$eq:"Amazon"}},{"salario":{$gt:9000}}]});
* db.empleados.find({$or: [{$and: [{empresa: "Yahoo"}, {salario: {$gt:6000}}]},{$and:[{empresa: "Google"}, {ventas: {$lt:20000}}]}]});
* db.empleados.find({},{_id:0,nombre:1, apellidos:1,pais:1});
