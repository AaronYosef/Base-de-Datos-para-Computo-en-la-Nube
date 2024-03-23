# ***Codigos de la clase***
## Operaciones de lectura, escritura, actualización y eliminación de datos. 

| Operación                      | Descripción                                                                                   |
|--------------------------------|-----------------------------------------------------------------------------------------------|
| `db.collection.find()`         | Consulta documentos en una colección según un criterio especificado.                          |
| `db.collection.findOne()`      | Consulta y devuelve un solo documento que cumple con los criterios especificados.             |
| `db.collection.insertOne()`    | Inserta un solo documento en la colección.                                                    |
| `db.collection.insertMany()`   | Inserta múltiples documentos en la colección.                                                  |
| `db.collection.updateOne()`    | Actualiza un solo documento que cumple con los criterios especificados.                        |
| `db.collection.updateMany()`   | Actualiza múltiples documentos que cumplen con los criterios especificados.                   |
| `db.collection.replaceOne()`   | Reemplaza un solo documento que cumple con los criterios especificados.                        |
| `db.collection.deleteOne()`    | Elimina un solo documento que cumple con los criterios especificados.                          |
| `db.collection.deleteMany()`   | Elimina múltiples documentos que cumplen con los criterios especificados.                      |
| `db.collection.aggregate()`    | Realiza operaciones de agregación en los datos, como agrupamiento, filtrado y transformación.  |
| `db.collection.distinct()`     | Devuelve un conjunto de valores distintos para un campo específico.                             |
| `db.collection.countDocuments()`| Cuenta los documentos que cumplen con los criterios especificados.                             |

# ***Mostrar bases de datos y usar una base de datos***
## Estos comandos muestran todas las bases de datos disponibles y seleccionan una base de datos específica para usarla.
``` mongosh
* show dbs; 
* use dbs (Nombre base de datos); 
``` 
# ***Crear y mostrar colecciones***
## Estos comandos crean una nueva colección en la base de datos actual y muestran todas las colecciones existentes en la base de datos actual.
``` mongosh
* db.createCollection(Nombre de la collecion);
* show Collections;
``` 
# ***Insertar documentos en una colección***
## Este script inserta un documento en la colección "empleado" con un nombre y una edad específicos.
``` mongosh
* db.empleado.insertOne({nombre:'ramon',edad:'Lopez'});
``` 
# ***Encontrar documentos en una colección***
## Este comando encuentra todos los documentos en la colección "empleado" y los muestra.
``` mongosh
* db.empleado.find(); 
``` 
# ***Borrar una base de datos***
## Este comando borra la base de datos actual.
``` mongosh
* db.dropDatabase();
```
# ***Insertar varios documentos en una colección***
## Este script inserta varios documentos en la colección "empleado" de una sola vez.
``` mongosh
* db.empleado.insertMany([...]);
``` 
# ***Crear y mostrar colecciones con datos adicionales***
## Estos comandos crean una colección llamada "facturas" y luego insertan un documento en ella.
``` mongosh
* db.createCollection("facturas");
* db.facturas.insertOne({...});
``` 
# ***Borrar documentos en base a ciertas condiciones***
## Estos comandos borran uno o varios documentos de la colección "facturas" basándose en ciertas condiciones.
``` mongosh
* db.facturas.deleteOne({...});
* db.facturas.deleteMany({...});
``` 
# ***Consultas avanzadas***
## Estos comandos realizan consultas más avanzadas en la colección "libros", encontrando un solo documento que coincida con las condiciones o varios documentos, respectivamente.
``` mongosh
* db.libros.findOne({...});
* db.libros.find({...});
``` 
# ***Actualizar documentos***
## Estos comandos actualizan uno o varios documentos en la colección "libros" con valores nuevos o modificados.
``` mongosh
* db.libros.updateOne({...}, {$set: {...}});
* db.libros.updateMany({...}, {$inc: {...}});
* db.libros.updateMany({...}, {$mul: {...}});
``` 
# ***Ordenar y limitar resultados***
## Este comando ordena los resultados de una consulta y limita el número de documentos devueltos.
``` mongosh
* db.libros.find({...}).sort({...}).limit(...); 
``` 
# ***Borrar colecciones y bases de datos***
## Estos comandos borran una colección específica o la base de datos actual, respectivamente.
``` mongosh
* db.ejemplo.drop();
* db.dropDatabase();
``` 

# ***Operadores en Mongo***

| Operador               | Descripción                                                                                   |
|------------------------|-----------------------------------------------------------------------------------------------|
| `$eq`                  | Igual a                                                                                       |
| `$ne`                  | No igual a                                                                                    |
| `$gt`                  | Mayor que                                                                                     |
| `$gte`                 | Mayor o igual que                                                                             |
| `$lt`                  | Menor que                                                                                     |
| `$lte`                 | Menor o igual que                                                                             |
| `$in`                  | Pertenece a un conjunto de valores                                                            |
| `$nin`                 | No pertenece a un conjunto de valores                                                         |
| `$and`                 | Operador lógico AND                                                                           |
| `$or`                  | Operador lógico OR                                                                            |
| `$not`                 | Operador lógico NOT                                                                           |
| `$exists`              | Comprueba si un campo existe en un documento                                                  |
| `$type`                | Comprueba el tipo de un campo                                                                 |
| `$regex`               | Coincide con expresiones regulares en un campo                                                 |
| `$elemMatch`           | Selecciona documentos que contienen al menos un elemento que cumple una consulta específica    |
| `$size`                | Comprueba el tamaño de un array                                                               |

# ***Operadores  aritméticos***
## Se utilizan dentro de las consultas de la base de datos para realizar operaciones matemáticas en los valores de los campos.

* Suma:
### $add: Agrega valores.
``` mongosh
db.productos.updateMany(
   { },
   { $set: { precio: { $add: ["$precio", 5] } } }
)
``` 
* Resta:
### $subtract: Resta valores.
``` mongosh
db.transacciones.aggregate([
   {
      $project: {
         _id: 1,
         monto: 1,
         saldoFinal: { $subtract: ["$monto", 100] }
      }
   }
])
``` 
* Multiplicación:
### $multiply: Multiplica valores.
``` mongosh
db.ventas.aggregate([
   {
      $project: {
         _id: 1,
         producto: 1,
         totalVentas: { $multiply: ["$precio", "$cantidadVendida"] }
      }
   }
])
``` 
* División:
### $divide: Divide valores.
``` mongosh
db.empleados.aggregate([
   {
      $group: {
         _id: null,
         salarioPromedio: { $avg: "$salario" }
      }
   }
])
```
* Resto de la división:
### $mod: Devuelve el resto de la división.
``` mongosh
db.numeros.find({ $expr: { $mod: [ "$numero", 2 ] } })
``` 