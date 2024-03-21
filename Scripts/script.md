# ***Mostrar bases de datos y usar una base de datos***
## Estas líneas de código muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.
* show dbs; *
* use dbs (Nombre base de datos); 

# ***Crear y mostrar colecciones***
## Estas líneas de código crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.
* db.createCollection();
* show Collections;

# ***Insertar documentos en una colección***
## Este script inserta un documento en la colección "empleado" con un nombre y una edad específicos.
* db.empleado.insertOne({nombre:'ramon',edad:'Lopez'});

# ***Encontrar documentos en una colección***
## Esta línea de código encuentra todos los documentos en la colección "empleado" y los muestra.
* db.empleado.find(); 

# ***Borrar una base de datos***
## Este comando borra la base de datos actual.

* db.dropDatabase();

# ***Insertar varios documentos en una colección***
## Este script inserta varios documentos en la colección "empleado" de una sola vez.
* db.empleado.insertMany([...]);

# ***Crear y mostrar colecciones con datos adicionales***
## Estas líneas de código crean una colección llamada "facturas" y luego insertan un documento en ella.
* db.createCollection("facturas");
* db.facturas.insertOne({...});

# ***Borrar documentos en base a ciertas condiciones***
## Estos comandos borran uno o varios documentos de la colección "facturas" basándose en ciertas condiciones.
* db.facturas.deleteOne({...});
* db.facturas.deleteMany({...});

# ***Consultas avanzadas***
## Estos comandos realizan consultas más avanzadas en la colección "libros", encontrando un solo documento que coincida con las condiciones o varios documentos, respectivamente.
* db.libros.findOne({...});
* db.libros.find({...});

# ***Actualizar documentos***
## Estos comandos actualizan uno o varios documentos en la colección "libros" con valores nuevos o modificados.
* db.libros.updateOne({...}, {$set: {...}});
* db.libros.updateMany({...}, {$inc: {...}});
* db.libros.updateMany({...}, {$mul: {...}});

# ***Ordenar y limitar resultados***
## Este comando ordena los resultados de una consulta y limita el número de documentos devueltos.
* db.libros.find({...}).sort({...}).limit(...); 

# ***Borrar colecciones y bases de datos***
## Estos comandos borran una colección específica o la base de datos actual, respectivamente.
* db.ejemplo.drop();
* db.dropDatabase();
