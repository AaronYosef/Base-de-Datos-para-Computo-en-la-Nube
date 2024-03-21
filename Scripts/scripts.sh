show dbs;
use dbs (Nombre base de datos);

db.createCollection();

use db1;
show Collections;

db.empleado.insertOne({nombre:'ramon',edad:'Lopez'});

db.empleado.find();

db.empleado.find({});

db.dropDatabase();

db.empleado;

db.empleado.insertMany(
... [
... {
... nombre:'Hermeregildo',
... edad:67
... }
... ,
... {
... nombre:'Soy la vaca del corral',
... edad:14,
... sexo:'Mujer'
... },
... {
... nombre:'romulo',
... edad:40,
... nacionalidad:'Nigeriano'
... },
... {
... nombre:'Cristian Andres',
... localidad:'San Miguel de las Piedras',
... nacionalidad:'Aleman',
... edad:'Esta morro'
... }
... ]
... );

db.createCollection("facturas");
db.facturas.insertOne({
    Cod_factura: 10,
    Cliente: "Frutas Ramirez",
    Total: 223
});
db.facturas.find()
db.productos.insertOne({
    Cod_producto: 2,
    Nombre: "Martillo X2",
    Precio: 20,
    Unidades: 50,
    Fabricantes: ["Fab1", "Fab2", "Fab3", "Fab4"]
});
db.fabricantes.insertOne({
    ...     _id: 1,
    ...     Nombre: "Fab1",
    ...     Localidad: { Ciudad: "Buenos Aires", Pais: "Argentina", Calle: "Calle Pez 27", Cod: 29000 }
    ...    
    ... });


    borrar

    db.facturas.deleteOne({ Cliente: "Frutas Ramirez" });

 si quieres borrar todos los documentos de la colección "facturas" con un total mayor a 200:;

db.facturas.deleteMany({ Total: { $gt: 200 } });

and

db.libros.findOne({precio:{$in:[20,25]}});

db.libros.find({$and:[{precio:{$gt:25}},{cantidad:{$lt:15}}]});


or 

db.libros.find({
    ... $or:[{precio:{$gt:25}},{cantidad:{$lt:15}}]})


Seleccionar los libros de la editorial biblio con precio mayor a 40 o libros de la editorial planeta con precio
mayor a 30 

db.libros.find({ $or:[{$and:[{editorial:{$eq:'Biblio'}},{precio:{$gt:10}}]},{$and:[{precio:{$gt:30}},{editorial:{$eq:'Planeta'}}]}]})


ver solo ciertas columnas

db.libros.find({},{titulo:1})

db.libros.find({titulo:'Don quijote'},{titulo:1})

db.libros.find({precio:{$gte:20}},{titulo:1, precio:1,_id:0})

db.libros.find({ $or:[{$and:[{editorial:{$eq:'Biblio'}},{precio:{$gt:10}}]},{$and:[{precio:{$gt:30}},{editorial:{$eq:'Planeta'}}]}]},{titulo:1, cantidad:1,precio:1, _id:0})


Operador $exists

db.libros.find({titulo:{$exists:true}})

db.libros.find({$and:[{precio:{$gt:5}},{autor:{$exists:true}}]})

insertar uno 

db.libros.insertOne({_id:12, titulo:'Estupro', fianza:true, anios_carcel:'dos',precio:13.45})

encontrar tipo de dato

db.libros.find({precio:{$type:1}})

db.libros.find({precio:{$type:'double'}})

Operador $set para actualizar

db.libros.updateOne({_id:13},{$set:{"precio":10.2, "cantidad":50}})

Precio aumentar 
db.libros.updateMany({},{$inc:{precio:5}})

multiplicar el precio por dos a todas las cantidades mayores a 20

db.libros.updateMany({cantidad:{$gt:20}},{$mul:{precio:2}})

Remplazaron un documento completo

No se puede mutar debes borrar documentos

Borrar documentos



Numero de documentos size

db.libros.find({}, { "titulo": 1, "precio": 1, "_id": 0, "editorial": 1 }).size()

limit 
db.libros.find({}, { "titulo": 1, "precio": 1, "_id": 0, "editorial": 1 }).limit(2)

ordenar 

db.libros.find({}, { "titulo": 1, "precio": 1, "_id": 0, "editorial": 1 }).sort({titulo:1})

primeros tres ordenados 

db.libros.find({}, { "titulo": 1, "precio": 1, "_id": 0, "editorial": 1 }).sort({titulo:1}).limit(3)

1 es ascendente -1 descendente

ordenados y salta los tres primeros documentos

db.libros.find({}, { "titulo": 1, "precio": 1, "_id": 0, "editorial": 1 }).skip(3).sort({titulo:1})


toda la coleccion
db.ejemplo.drop()

por documentos delete One o Many

Borrar base de datos 

db.dropDatabase()

