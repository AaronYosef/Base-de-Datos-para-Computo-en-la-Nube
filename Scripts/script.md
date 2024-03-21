
### Mostrar bases de datos y usar una base de datos

show dbs;
use dbs (Nombre base de datos);

Estas líneas de código muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.

### Crear y mostrar colecciones

db.createCollection();
show Collections;

Estas líneas de código crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.

### Insertar documentos en una colección

db.empleado.insertOne({nombre:'ramon',edad:'Lopez'});


Este script inserta un documento en la colección "empleado" con un nombre y una edad específicos.

### Encontrar documentos en una colección

db.empleado.find();


Esta línea de código encuentra todos los documentos en la colección "empleado" y los muestra.

### Borrar una base de datos

db.dropDatabase();


Este comando borra la base de datos actual.

### Insertar varios documentos en una colección

db.empleado.insertMany([...]);


Este script inserta varios documentos en la colección "empleado" de una sola vez.

### Crear y mostrar colecciones con datos adicionales

db.createCollection("facturas");
db.facturas.insertOne({...});


Estas líneas de código crean una colección llamada "facturas" y luego insertan un documento en ella.

### Borrar documentos en base a ciertas condiciones

db.facturas.deleteOne({...});
db.facturas.deleteMany({...});


Estos comandos borran uno o varios documentos de la colección "facturas" basándose en ciertas condiciones.

### Consultas avanzadas
db.libros.findOne({...});
db.libros.find({...});

Estos comandos realizan consultas más avanzadas en la colección "libros", encontrando un solo documento que coincida con las condiciones o varios documentos, respectivamente.

### Actualizar documentos

db.libros.updateOne({...}, {$set: {...}});
db.libros.updateMany({...}, {$inc: {...}});
db.libros.updateMany({...}, {$mul: {...}});


Estos comandos actualizan uno o varios documentos en la colección "libros" con valores nuevos o modificados.

### Ordenar y limitar resultados

db.libros.find({...}).sort({...}).limit(...);


Este comando ordena los resultados de una consulta y limita el número de documentos devueltos.

### Borrar colecciones y bases de datos

db.ejemplo.drop();
db.dropDatabase();


Estos comandos borran una colección específica o la base de datos actual, respectivamente.